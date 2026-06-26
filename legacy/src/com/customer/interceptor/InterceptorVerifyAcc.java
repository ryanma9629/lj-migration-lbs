package com.customer.interceptor;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.component.application.report.abstractreport.AbsReportType;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.system.intercept.RowDataBean;

public class InterceptorVerifyAcc extends AbsInterceptorDefaultAdapter {
	
	@Override
	public Object beforeLoadData(ReportRequest rrequest, ReportBean rbean, Object typeObj, String sql) {
		
		String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
		String org_lev_id = (String) rrequest.getRequest().getSession().getAttribute("org_lev_id");
		//String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		String userRol = (String) rrequest.getRequest().getSession().getAttribute("userRol");
        
		String sqlcon = "" ;
		String sqlinner = " ";
		if("1".equals(org_lev_id)){//支行用户
			
			sqlcon = sqlcon+ "and re.ORG_ID='"+usr_org_id+"' and pog.ORG_LEVEL_ID='1' ";
			
		}else if("2".equals(org_lev_id)){//分行用户
			sqlcon = sqlcon+ "and cog.BRANCH_ORG_ID='"+usr_org_id+"' and pog.ORG_LEVEL_ID='2' ";
			sqlinner = sqlinner+ "inner join ibs.T9_SP_GROUPID sp on sp.BIZ_TYP=re.BIZ_TYPE_NM and sp.GROUP_ID in ("+userRol+") and sp.SP_TYP='按部门' and sp.IS_CS='1'";
			
		}else if("3".equals(org_lev_id)){//总行用户
			sqlcon = sqlcon+ "and cog.HEAD_ORG_ID='"+usr_org_id+"' and pog.ORG_LEVEL_ID='3' ";
			sqlinner = sqlinner+ "inner join ibs.T9_SP_GROUPID sp on sp.BIZ_TYP=re.BIZ_TYPE_NM and sp.GROUP_ID in ("+userRol+") and sp.SP_TYP='按部门' and sp.IS_CS='1'";
			
		}
		
		sql =sql.replaceAll("%sqlcon%", sqlcon);
		sql =sql.replaceAll("%sqlinner%", sqlinner);
        return sql;
	}
	
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

			if (rowDataBean.getColData("NEW_RATIO")!=null) {
				String styleproperty=rowDataBean.getRowstyleproperty();
                if(styleproperty==null) styleproperty="";
                styleproperty+=" style='color:blue'";
                rowDataBean.setRowstyleproperty(styleproperty);
			}
			
		}
	}
	

	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		//rrequest.authorize("branch_dx_mod", null, null, "readonly", "true");
	}

	@Override
	public void doEnd(ReportRequest rrequest, ReportBean rbean) {
		
	}
}
