package com.customer.interceptor;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.system.intercept.RowDataBean;

public class InterceptorEmpJdAndGz extends AbsInterceptorDefaultAdapter {
	
	
	
	@Override
	public void beforeDisplayReportDataPerRow(ReportRequest rrequest,
			ReportBean rbean, RowDataBean rowDataBean) {
		
		
		
	}
	
	@Override
	public Object beforeLoadData(ReportRequest rrequest, ReportBean rbean, Object typeObj, String sql) {
		String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
		String branch_id = (String) rrequest.getRequest().getSession().getAttribute("branch_id");
		String org_lev_id = (String) rrequest.getRequest().getSession().getAttribute("org_lev_id");
		
		org_lev_id=org_lev_id==null?"":org_lev_id;
		String sqll=" ";
		
		if(org_lev_id.equals("2")){
			rrequest.setAttribute("ORG_ID1", usr_org_id);			
		}else if(org_lev_id.equals("1")){
			rrequest.setAttribute("ORG_ID1", branch_id);
			rrequest.setAttribute("ORG_ID2", usr_org_id);
			sqll = " and em.ORG_ID ='"+usr_org_id+"'";
		}
		
		sql = sql.replaceAll("%SQL%", sqll);
        return sql;
		
	}

	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		String isExam = (String) rrequest.getRequest().getSession().getAttribute("isExam");
		
	}

	@Override
	public void doEnd(ReportRequest rrequest, ReportBean rbean) {
		
	}
}
