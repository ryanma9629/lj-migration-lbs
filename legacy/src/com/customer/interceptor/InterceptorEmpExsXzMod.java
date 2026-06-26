package com.customer.interceptor;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.component.application.report.abstractreport.AbsReportType;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.system.intercept.ColDataBean;
import com.wabacus.system.intercept.RowDataBean;
import com.wabacus.util.Consts;

public class InterceptorEmpExsXzMod extends AbsInterceptorDefaultAdapter {
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

			if ("分行有权人审核审核通过".equals((rowDataBean.getColData("STUS"))) || "已提交分行有权人".equals((rowDataBean.getColData("STUS")))) {
				rowDataBean.setReadonly(true);
			}
			if(!"分行有权人审核审核通过".equals((rowDataBean.getColData("STUS"))) )
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
        
	}

	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		String isExam = (String) rrequest.getRequest().getSession().getAttribute("isExam");
		//不是考核期
		if(isExam.equals("0")){
			rrequest.authorize("select", Consts.BUTTON_PART,"type{save}", "disabled", "true");
			rrequest.authorize("select", "button", "subButn", "disabled", "true");
		}
	}

	@Override
	public void doEnd(ReportRequest rrequest, ReportBean rbean) {
		
	}
}
