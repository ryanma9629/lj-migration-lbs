package com.customer.interceptor;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;

public class InterceptorEmpLnDtil extends AbsInterceptorDefaultAdapter {
	@Override
	public Object beforeLoadData(ReportRequest rrequest, ReportBean rbean, Object typeObj, String sql) {
		
		String measure_dt = rrequest.getStringAttribute("MEASURE_DT", "");
		
		String sql1 = " inner join ibs.T5_EMP emp on emp.EMP_ID=a.EMP_ID ";
        if(measure_dt.substring(5,10).equals("03-31") || measure_dt.substring(5,10).equals("06-30") 
        		|| measure_dt.substring(5,10).equals("09-30") || measure_dt.substring(5,10).equals("12-31")){
        	
        	sql1 = " inner join ibs.T5_EMP_Q emp on emp.EMP_ID=a.EMP_ID and emp.MEASURE_DT='"+measure_dt+"' ";
		}
        //System.out.println("InterceptorEmpLnDtil measure_dt="+measure_dt);
        
        String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
		String branch_id = (String) rrequest.getRequest().getSession().getAttribute("branch_id");
		String org_lev_id = (String) rrequest.getRequest().getSession().getAttribute("org_lev_id");
		 
		if(org_lev_id.equals("2")){//分行用户
			rrequest.setAttribute("ORG_ID1", usr_org_id);			
		}else if(org_lev_id.equals("1")){//支行用户
			rrequest.setAttribute("ORG_ID1", branch_id);
			rrequest.setAttribute("ORG_ID2", usr_org_id);
			sql1 =sql1+" and emp.ORG_ID='"+usr_org_id+"' ";
		}
        
		sql = sql.replaceAll("%SQL%", sql1);
        return sql;
	}
	

	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		//rrequest.authorize("branch_dx_mod", null, null, "readonly", "true");
	}

	@Override
	public void doEnd(ReportRequest rrequest, ReportBean rbean) {
		
	}
}
