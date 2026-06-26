package com.customer.interceptor;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;


public class InterceptorGoldEmp extends AbsInterceptorDefaultAdapter {

	@Override
	public Object beforeLoadData(ReportRequest rrequest, ReportBean rbean, Object typeObj, String sql) {
		
		String txn_dt_st = rrequest.getStringAttribute("TXN_DT_ST", "");
		String txn_dt_ed = rrequest.getStringAttribute("TXN_DT_ED", "");
		
		String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
		
		sql=sql.replaceAll("%TXN_DT_WHERE%", "TXN_DT between date('"+txn_dt_st+"') and date('"+txn_dt_ed+"')") ;
		sql=sql.replaceAll("%TXN_DT_WHERE%", "TXN_DT between date('"+txn_dt_st+"') and date('"+txn_dt_ed+"')") ;
		
		if(usr_org_id.equals("9990")||usr_org_id.equals("8000")){
		}else{
			sql=sql.replaceAll("%UserLogOrg%", " and BRANCH_ORG_ID = '"+usr_org_id+"' ") ;			
		}
		return sql;
	}
	
	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		String MEASURE_DT = rrequest.getStringAttribute("MEASURE_DT", "");// 日期
		

		if (MEASURE_DT !=null && MEASURE_DT.equals("")) {
			rrequest.setAttribute("select_lazyload", "true");
			rrequest.setAttribute("select_lazyloadmessage",	"现在是延迟读取，输入查询条件点击查询按钮才加载相应条件的数据");
		
		}
	}

	@Override
	public void doEnd(ReportRequest rrequest, ReportBean rbean) {

	}
}
