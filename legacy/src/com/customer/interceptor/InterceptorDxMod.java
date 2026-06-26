package com.customer.interceptor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.wabacus.config.Config;
import com.wabacus.config.component.application.report.ColBean;
import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.component.application.report.abstractreport.AbsReportType;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.system.intercept.ColDataBean;
import com.wabacus.system.intercept.RowDataBean;
import com.wabacus.util.Consts;

public class InterceptorDxMod extends AbsInterceptorDefaultAdapter {
	@Override
	public void beforeDisplayReportDataPerRow(ReportRequest rrequest,
			ReportBean rbean, RowDataBean rowDataBean) {
		if (rowDataBean.getRowindex() < 0) {// 当前是在显示标题行
			return;
		}
		
		AbsReportType reportTypeObj = rrequest.getDisplayReportTypeObj(rbean.getId());
		if (reportTypeObj.getLstReportData() != null
				&& rowDataBean.getRowindex() < reportTypeObj.getLstReportData()
						.size()) {

			if ("等待审核".equals((rowDataBean.getColData("STUS")))
					|| "审核通过".equals((rowDataBean.getColData("STUS")))) {
				rowDataBean.setReadonly(true);
			}
			if(!"审核通过".equals((rowDataBean.getColData("STUS"))))
            {
                String styleproperty=rowDataBean.getRowstyleproperty();
                if(styleproperty==null) styleproperty="";
                styleproperty+=" style='color:red'";
                rowDataBean.setRowstyleproperty(styleproperty);
            }
		}
	}
	
	@Override
	public void beforeDisplayReportDataPerCol(ReportRequest rrequest,ReportBean rbean,ColDataBean colDataBean){
		/*
		if(colDataBean.getRowindex()<0)
        {//当前是在显示标题行
            return;
        }
        if(!(colDataBean.getDisplayColBean() instanceof ColBean))
        {//不是显示列的数据
            return;
        }
        
        AbsReportType reportTypeObj=rrequest.getDisplayReportTypeObj(rbean.getId());
        if(reportTypeObj==null||reportTypeObj.getLstReportData()==null||reportTypeObj.getLstReportData().size()<=colDataBean.getRowindex()) return;
        Object dataObj=reportTypeObj.getLstReportData().get(colDataBean.getRowindex());//取出存放当前行数据的POJO对象
        String examQ=String.valueOf(ReportAssistant.getInstance().getPropertyValue(dataObj,"EXAM_Q"));//从中取出STUS列的数据
        if(examQ.equals("01"))
        {
        	colDataBean.setValue("一季度");
        	
        	
        	String styleproperty=colDataBean.getStyleproperty();
            if(styleproperty==null) styleproperty="";
            styleproperty+=" bgcolor='#CFDFF8'";
            colDataBean.setStyleproperty(styleproperty);
            
        }
        if(examQ.equals("02"))
        {
        	colDataBean.setValue("二季度");
        }
        if(examQ.equals("03"))
        {
        	colDataBean.setValue("三季度");
        }
        if(examQ.equals("04"))
        {
        	colDataBean.setValue("四季度");
        }
        */
        if(colDataBean.getRowindex()<0) return ;//不是显示标题行的列
        if(!(colDataBean.getDisplayColBean() instanceof ColBean))
        {//不是显示列的数据
            return;
        }
        if(colDataBean.getDisplayColBean() instanceof ColBean){
        	if("01".equals(colDataBean.getValue()))
        	{
        		colDataBean.setValue("一季度");
        	}else if("02".equals(colDataBean.getValue()))
        	{
        		colDataBean.setValue("二季度");
        	}else if("03".equals(colDataBean.getValue()))
        	{
        		colDataBean.setValue("三季度");
        	}
        	else if("04".equals(colDataBean.getValue()))
        	{
        		colDataBean.setValue("四季度");
        	}
        }
        
	}

	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		
		
		String isExam = (String) rrequest.getRequest().getSession().getAttribute("isExam");
		//不是考核期
		if(isExam.equals("0")){
			rrequest.authorize("select", Consts.BUTTON_PART,"type{save}", "disabled", "true");
			rrequest.authorize("select", Consts.BUTTON_PART,"type{add}", "disabled", "true");
			rrequest.authorize("select", Consts.BUTTON_PART,"type{delete}", "disabled", "true");
			rrequest.authorize("select", "button", "subButn", "disabled", "true");
			rrequest.authorize("select", "button", "overButn", "disabled", "true");
			
		}else{
			String brachOrgId = (String) rrequest.getRequest().getSession().getAttribute("org_id");
			String exam_msr_dt = (String) rrequest.getRequest().getSession().getAttribute("exam_msr_dt");
			
			Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
			try {
				
				//判断是否有结束
				String sql ="select count(1) as cnt from IBS.T3_BRANCH_DX_ZB " +
				"WHERE BRANCH_ORG_ID = ?  AND MEASURE_DT=? AND ISOVER='1' " ;
				
				System.out.println("sql="+sql);
				
				PreparedStatement pstmt = null;
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, brachOrgId);
				pstmt.setString(2, exam_msr_dt);
				ResultSet resultSet = pstmt.executeQuery();
				
				int cnt = 0;
				if(resultSet.next()){
					cnt=resultSet.getInt("cnt");
					if(cnt>0){
						
						rrequest.authorize("select", Consts.BUTTON_PART,"type{save}", "disabled", "true");
						rrequest.authorize("select", Consts.BUTTON_PART,"type{add}", "disabled", "true");
						rrequest.authorize("select", Consts.BUTTON_PART,"type{delete}", "disabled", "true");
						rrequest.authorize("select", "button", "subButn", "disabled", "true");
						rrequest.authorize("select", "button", "overButn", "disabled", "true");
						//rrequest.setAttribute("select_ACCESSMODE", "readonly");
						
						System.out.println("--------------disabled");
					}
					pstmt.close();
					resultSet.close();
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			finally{
				try {
					
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		
	}

	@Override
	public void doEnd(ReportRequest rrequest, ReportBean rbean) {
		
	}
}
