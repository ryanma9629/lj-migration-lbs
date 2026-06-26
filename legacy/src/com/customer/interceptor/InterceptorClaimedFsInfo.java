package com.customer.interceptor;

import java.util.Date;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;

/*存款认领校验页面*/
public class InterceptorClaimedFsInfo extends AbsInterceptorDefaultAdapter {

	
	@Override
	public Object beforeLoadData(ReportRequest rrequest, ReportBean rbean, Object typeObj, String sql) {
		
		String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
		String org_lev_id = (String) rrequest.getRequest().getSession().getAttribute("org_lev_id");
		//String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		String userRol = (String) rrequest.getRequest().getSession().getAttribute("userRol");
        
		String sqlcon = "" ;
		String sqlinner = " ";
		
		if("2".equals(org_lev_id) && userRol.contains("branch_fszh")){//分行用户且为分行总经理，按部门终审支行提交上来的
			//sqlcon = sqlcon+ "and cog.BRANCH_ORG_ID='"+usr_org_id+"' and pog.ORG_LEVEL_ID='2' ";
			sqlcon = sqlcon+ "and cog.BRANCH_ORG_ID='"+usr_org_id+"' and pog.ORG_LEVEL_ID='1' ";
			sqlinner = sqlinner+ "inner join ibs.T9_SP_GROUPID sp on sp.BIZ_TYP=re.BIZ_TYPE_NM and sp.GROUP_ID in ("+userRol+") and sp.SP_TYP='按部门' and sp.IS_FS='1'";
			
		}else if("2".equals(org_lev_id) && !userRol.contains("branch_fszh")){//分行用户且不是分行总经理，是行长级，终审分行提交上来的
			sqlcon = sqlcon+ "and cog.BRANCH_ORG_ID='"+usr_org_id+"' and pog.ORG_LEVEL_ID='2' ";
			sqlinner = sqlinner+ "inner join ibs.T9_SP_GROUPID sp on sp.BIZ_TYP=re.BIZ_TYPE_NM and sp.GROUP_ID in ("+userRol+") and sp.SP_TYP='按部门' and sp.IS_FS='1'";
			
		}else if("3".equals(org_lev_id)){//总行用户
			sqlcon = sqlcon+ "and cog.HEAD_ORG_ID='"+usr_org_id+"' and pog.ORG_LEVEL_ID='3' ";
			sqlinner = sqlinner+ "inner join ibs.T9_SP_GROUPID sp on sp.BIZ_TYP=re.BIZ_TYPE_NM and sp.GROUP_ID in ("+userRol+") and sp.SP_TYP='按部门' and sp.IS_FS='1'";
		}
		
		sql =sql.replaceAll("%sqlcon%", sqlcon);
		sql =sql.replaceAll("%sqlinner%", sqlinner);
        return sql;
	}
	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		/*
		String vuch_nbr = rrequest.getStringAttribute("VUCH_NBR", "");// 取出凭证号
		String emp_id = rrequest.getStringAttribute("EMP_ID", "");// 员工号
		String emp_nm = rrequest.getStringAttribute("EMP_NM", "");// 员工姓名
		String biz_type_nm = rrequest.getStringAttribute("BIZ_TYPE_NM", "");// 业务类型
		//String claim_status_id = rrequest.getStringAttribute("CLAIM_STATUS_ID", "");// 审核状态
		String st_dt = rrequest.getStringAttribute("CLAIM_DT_START", "");// 审核开始日期
		String ed_dt = rrequest.getStringAttribute("CLAIM_DT_END", "");// 审核结束日期
		String cst_nm = rrequest.getStringAttribute("CST_NM", "");// 客户名
		
		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		//System.out.println("VUCH_NBR-----" + vuch_nbr + " and  user_id----"	+ user_id);

		if (vuch_nbr.equals("")&&emp_id.equals("")&&emp_nm.equals("")&&biz_type_nm.equals("")&&st_dt.equals("")&&ed_dt.equals("")&&st_dt.equals("")&&cst_nm.equals("")) {
			rrequest.setAttribute("select_lazyload", "true");
			rrequest.setAttribute("select_lazyloadmessage",	"现在是延迟读取，输入查询条件点击查询按钮才加载相应条件的数据");
			//rrequest.authorize("dtl", null, null, "display", "false");
		
		}
		*/
		System.out.println(new Date() + "认领信息明细:::执行完前置动作------------------");
		
	}

	@Override
	public void doEnd(ReportRequest rrequest, ReportBean rbean) {

		System.out.println(new Date() + "认领信息明细:::执行后置动作------------------");
	}
}
