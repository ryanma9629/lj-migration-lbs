package com.customer.interceptor;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.system.intercept.ColDataBean;
import com.wabacus.system.intercept.RowDataBean;

public class InterceptorDxVer extends AbsInterceptorDefaultAdapter {
	@Override
	public void beforeDisplayReportDataPerRow(ReportRequest rrequest,
			ReportBean rbean, RowDataBean rowDataBean) {
		/*
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
		*/
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
		/*
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
        */
        
	}

	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		
		
		String isExam = (String) rrequest.getRequest().getSession().getAttribute("isExam");
		//不是考核期
		if(isExam.equals("0")){
			
			rrequest.authorize("select", "button", "button1", "disabled", "true");
			rrequest.authorize("select", "button", "sub", "disabled", "true");
		}
		
		
	}

	@Override
	public void doEnd(ReportRequest rrequest, ReportBean rbean) {
		
	}
}
