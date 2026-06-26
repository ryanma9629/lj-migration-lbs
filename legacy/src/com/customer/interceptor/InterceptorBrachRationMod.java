package com.customer.interceptor;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.component.application.report.abstractreport.AbsReportType;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.system.intercept.ColDataBean;
import com.wabacus.system.intercept.RowDataBean;

public class InterceptorBrachRationMod extends AbsInterceptorDefaultAdapter {
	@Override
	public void beforeDisplayReportDataPerRow(ReportRequest rrequest,
			ReportBean rbean, RowDataBean rowDataBean) {
		if (rowDataBean.getRowindex() < 0) {// 当前是在显示标题行
			return;
		}
		String exam_year = (String) rrequest.getRequest().getSession().getAttribute("exam_year");
		String exam_q = (String) rrequest.getRequest().getSession().getAttribute("exam_q");
		
		AbsReportType reportTypeObj = rrequest.getDisplayReportTypeObj(rbean.getId());
		if (reportTypeObj.getLstReportData() != null
				&& rowDataBean.getRowindex() < reportTypeObj.getLstReportData()
						.size()) {

			if (!(exam_year.equals(rowDataBean.getColData("EXAM_YEAR")) && exam_q.equals(rowDataBean.getColData("EXAM_Q")))) {
				rowDataBean.setReadonly(true);
			}
			
			
		}
	}
	
	@Override
	public void beforeDisplayReportDataPerCol(ReportRequest rrequest,ReportBean rbean,ColDataBean colDataBean){
		
	}

	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		//rrequest.authorize("branch_dx_mod", null, null, "readonly", "true");
	}

	@Override
	public void doEnd(ReportRequest rrequest, ReportBean rbean) {
		
	}
}
