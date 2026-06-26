package com.customer.interceptor;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.component.application.report.abstractreport.AbsReportType;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.system.intercept.RowDataBean;
import com.wabacus.util.Consts;

public class InterceptorEmpDxxzSec extends AbsInterceptorDefaultAdapter {
	
	@Override
	public void beforeDisplayReportDataPerRow(ReportRequest rrequest,
			ReportBean rbean, RowDataBean rowDataBean) {
		if (rowDataBean.getRowindex() < 0) {// 当前是在显示标题行
			return;
		}
		AbsReportType reportTypeObj = rrequest.getDisplayReportTypeObj(rbean
				.getId());
		if (reportTypeObj.getLstReportData() != null
				&& rowDataBean.getRowindex() < reportTypeObj.getLstReportData()
						.size()) {

			if ("已提交给分行有权人".equals((rowDataBean.getColData("STUS")))||"分行有权人审核通过".equals((rowDataBean.getColData("STUS")))) {
				rowDataBean.setReadonly(true);
			}
			
			if(!"已提交给分行有权人".equals((rowDataBean.getColData("STUS"))) && !"分行有权人审核通过".equals((rowDataBean.getColData("STUS"))))
            {
                String styleproperty=rowDataBean.getRowstyleproperty();
                if(styleproperty==null) styleproperty="";
                styleproperty+=" style='color:red'";
                rowDataBean.setRowstyleproperty(styleproperty);
            }
		}
		
		
	}

	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		String isExam = (String) rrequest.getRequest().getSession().getAttribute("isExam");
		//不是考核期
		if(isExam.equals("0")){
			rrequest.authorize("select2", Consts.BUTTON_PART,"type{save}", "disabled", "true");
			rrequest.authorize("select2", "button", "sub", "disabled", "true");
			rrequest.setAttribute("select2_ACCESSMODE", "readonly");
		}
	}

	@Override
	public void doEnd(ReportRequest rrequest, ReportBean rbean) {
		
	}
}
