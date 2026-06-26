package com.customer.interceptor;

import com.wabacus.config.component.application.report.ColBean;
import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.component.application.report.abstractreport.AbsReportType;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.system.intercept.ColDataBean;
import com.wabacus.system.intercept.RowDataBean;
import com.wabacus.util.Consts;

public class InterceptorEmpGdqMod extends AbsInterceptorDefaultAdapter {
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

			if ("分行有权人审核审核通过".equals((rowDataBean.getColData("STATUS"))) || "已提交".equals((rowDataBean.getColData("STATUS")))) {
				rowDataBean.setReadonly(true);
			}
			if(!"已提交".equals((rowDataBean.getColData("STATUS"))) )
            {
                String styleproperty=rowDataBean.getRowstyleproperty();
                if(styleproperty==null) styleproperty="";
                styleproperty+=" style='color:red'";
                rowDataBean.setRowstyleproperty(styleproperty);
            }
			
		}
		//System.out.println("before----------");
	}
	
	@Override
	public void beforeDisplayReportDataPerCol(ReportRequest rrequest,ReportBean rbean,ColDataBean colDataBean){
		
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
			//System.out.println("不是考核期");
			rrequest.authorize("select",Consts.BUTTON_PART,"subButn","disabled","true");
			rrequest.authorize("select", Consts.BUTTON_PART,"type{save}", "disabled", "true");
			rrequest.authorize("select", Consts.BUTTON_PART,"type{add}", "disabled", "true");
			rrequest.authorize("select", Consts.BUTTON_PART,"type{delete}", "disabled", "true");
			rrequest.setAttribute("select_ACCESSMODE", "readonly");
		}
	}

	@Override
	public void doEnd(ReportRequest rrequest, ReportBean rbean) {
		
	}
}
