package com.customer.interceptor;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;


public class InterceptorFundDetail extends AbsInterceptorDefaultAdapter {

	@Override
	public Object beforeLoadData(ReportRequest rrequest, ReportBean rbean, Object typeObj, String sql) {
		
		String txn_dt_st = rrequest.getStringAttribute("TXN_DT_ST", "");
		String txn_dt_ed = rrequest.getStringAttribute("TXN_DT_ED", "");
		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		sql=sql.replaceAll("%SQL1%", "fe.MSR_PRD_DT between date('"+txn_dt_st+"') and date('"+txn_dt_ed+"') and cr.EMP_ID='"+user_id+"' ") ;
		sql=sql.replaceAll("%SQL2%", "TXN_DT between date('"+txn_dt_st+"') and date('"+txn_dt_ed+"') and cr.EMP_ID='"+user_id+"' ") ;
		
		return sql;
	}
	
	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		
	}

	@Override
	public void doEnd(ReportRequest rrequest, ReportBean rbean) {

	}
}
