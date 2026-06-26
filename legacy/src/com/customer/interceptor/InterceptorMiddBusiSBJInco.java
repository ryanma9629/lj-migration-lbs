package com.customer.interceptor;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;

/*存款认领校验页面*/
public class InterceptorMiddBusiSBJInco extends AbsInterceptorDefaultAdapter {

	@Override
	public Object beforeLoadData(ReportRequest rrequest, ReportBean rbean, Object typeObj, String sql) {
		String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
		
		if(usr_org_id.equals("9990")||usr_org_id.equals("8000")){
			sql=sql.replaceAll("%UserLogOrg%", "") ;
		}else{
			sql=sql.replaceAll("%UserLogOrg%", " and ou.SEC_OU_CD = '"+usr_org_id+"' ") ;			
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
