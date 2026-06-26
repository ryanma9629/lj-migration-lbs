package com.customer.interceptor;

import java.util.Date;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;

public class InterceptorClaimedChange extends AbsInterceptorDefaultAdapter
{
	/*
	@Override
	public Object beforeLoadData(ReportRequest rrequest, ReportBean rbean, Object typeObj, String sql) {
		
		
		
        String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
        String org_lev_id = (String) rrequest.getRequest().getSession().getAttribute("org_lev_id");
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
	*/	

		
    @Override
	public void doStart(ReportRequest rrequest,ReportBean rbean)
    {
    	String vuch_nbr = rrequest.getStringAttribute("VUCH_NBR", "");//取出凭证号
		String cst_nm=rrequest.getStringAttribute("CST_NM","");//取出客户号
		String biznm=rrequest.getStringAttribute("BIZ_TYPE_NM","");//业务类型
		
		
      
        if(vuch_nbr.equals("")&&"".equals(cst_nm)&& "".equals(biznm))
        {//如果两个条件框都没有输入值，则延迟加载
        	System.out.println("延迟读取");
//            rrequest.setAttribute("dtl_lazyload","true");
//            rrequest.setAttribute("dtl_lazyloadmessage","现在是延迟读取，输入凭证号或认领工号后点击查询按钮才加载相应条件的数据");
            rrequest.setAttribute("select_lazyload","true");
            rrequest.setAttribute("select_lazyloadmessage","现在是延迟读取，输入凭证号或认领工号后点击查询按钮才加载相应条件的数据");
            
            
//			rrequest.authorize("dtl",Consts.BUTTON_PART,"type{save}","disabled","true");
//			rrequest.authorize("dtl",Consts.BUTTON_PART,"type{update}","disabled","true");
//			rrequest.authorize("dtl",Consts.BUTTON_PART,"type{delete}","disabled","true");
//			rrequest.authorize("dtl",Consts.BUTTON_PART,"sh_pass","disabled","true");
//			rrequest.authorize("dtl",Consts.BUTTON_PART,"sh_noPass","disabled","true");
//            rrequest.authorize("dtl", null, null, "display", "true");
            
        }                   

        
        
        System.out.println(new Date()+"认领调整:::执行完前置动作------------------");
    }

    @Override
	public void doEnd(ReportRequest rrequest,ReportBean rbean)
    {
        
         
    	
    	
    	System.out.println(new Date()+"认领调整:::执行后置动作------------------");
    }
}
