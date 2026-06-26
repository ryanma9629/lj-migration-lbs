
package com.customer.interceptor;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.component.application.report.abstractreport.AbsReportType;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.system.intercept.RowDataBean;
import com.wabacus.util.Consts;

public class InterceptorLnBlChg extends AbsInterceptorDefaultAdapter
{
	
	@Override
	   public void beforeDisplayReportDataPerRow(ReportRequest rrequest,ReportBean rbean,RowDataBean rowDataBean)
	    {
	        
		if(rowDataBean.getRowindex()<0)
	        {//当前是在显示标题行
	            return;
	        }
	        AbsReportType reportTypeObj=rrequest.getDisplayReportTypeObj(rbean.getId());
	        if(reportTypeObj.getLstReportData()!=null&&rowDataBean.getRowindex()<reportTypeObj.getLstReportData().size())
	        {
	            if(((String)rowDataBean.getColData("PERF_STS_TP_ID")).trim().equals("10260002"))
	            {
	                String styleproperty=rowDataBean.getRowstyleproperty();
	                if(styleproperty==null) styleproperty="";
	                styleproperty+=" style='color:red'";
	                rowDataBean.setRowstyleproperty(styleproperty);
	            }
	        }
	        
	        
	    }
	
	
	@Override
	public Object beforeLoadData(ReportRequest rrequest, ReportBean rbean, Object typeObj, String sql) {
		/*
		String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
		
		if(usr_org_id.equals("9990")||usr_org_id.equals("8000")){
			sql=sql.replaceAll("%UserLogOrg%", "") ;
		}else{
			sql=sql.replaceAll("%UserLogOrg%", " and org.BRANCH_ORG_ID = '"+usr_org_id+"' ") ;			
		}
		return sql;
		*/
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
			sqll = " and org.ORG_ID ='"+usr_org_id+"'";
		}
		
		sql = sql.replaceAll("%SQL%", sqll);
        return sql;
	}
		
	@Override
	public void doStart(ReportRequest rrequest,ReportBean rbean){
		
		/*
		String beginTime = rrequest.getStringAttribute("REMARK", "");// 取出输入的查询时间
		String chg_dt = rrequest.getStringAttribute("CHG_DT", "");
		
		
		
		String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
		
		
		if (beginTime.equals("")) 
		{
			Connection conn1 = rrequest.getConnection();
			PreparedStatement pstmt1 = null;
			try {
					String SQL = "Select MEASURE_DT , SWITCH_F , REMARK from IBS.T99_MIDDLE_INCOME_SWITCH ORDER BY MEASURE_DT DESC";
					pstmt1 = conn1.prepareStatement(SQL);
					ResultSet resultSet1 = pstmt1.executeQuery();
					int i=1;
					while (resultSet1.next() && i==1) {
	                     String date=resultSet1.getString("MEASURE_DT");
	                     rrequest.setAttribute("REMARK", date);
	                     
	                     if(chg_dt!=null && chg_dt.equals("")){
	             			rrequest.setAttribute("CHG_DT", date);
	             		}
	                     i=0;
                    }
					resultSet1.close();
					pstmt1.close();
				} 
			catch (Exception e) {
					e.printStackTrace();
			}
        }
		
        String sql="Select MEASURE_DT , SWITCH_F , REMARK from IBS.T99_MIDDLE_INCOME_SWITCH WHERE SWITCH_F='1'";
    	
    	Connection conn=rrequest.getConnection();//Config.getInstance().getDataSource("dm_db2").getConnection();//取DB2数据源配置
        PreparedStatement pstmt=null;
        try {
			pstmt=conn.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			System.out.println("usr_org_id="+usr_org_id);
			
			if(!rs.next()||usr_org_id.equals("9990")||usr_org_id.equals("8000")){
//				rrequest.authorize("ln_bl_mod_rpt", Consts.BUTTON_PART,"type{save}", "disabled", "true");
//				rrequest.authorize("ln_bl_mod_rpt", Consts.BUTTON_PART,"type{add}", "disabled", "true");
//				rrequest.authorize("ln_bl_mod_rpt", Consts.BUTTON_PART,"type{delete}", "disabled", "true");
				rrequest.setAttribute("ln_bl_mod_rpt_ACCESSMODE", "readonly");
				System.out.println("不是考核期不能修改！");
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				//conn.close();
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		*/
		
		String isExam = (String) rrequest.getRequest().getSession().getAttribute("isExam");
		if(isExam.equals("0")){
			rrequest.authorize("ln_bl_mod_rpt", Consts.BUTTON_PART,"type{save}", "disabled", "true");
//			rrequest.authorize("ln_bl_mod_rpt", Consts.BUTTON_PART,"type{add}", "disabled", "true");
//			rrequest.authorize("ln_bl_mod_rpt", Consts.BUTTON_PART,"type{delete}", "disabled", "true");
			rrequest.setAttribute("ln_bl_mod_rpt_ACCESSMODE", "readonly");
			System.out.println("不是考核期不能修改！");
		}
	}

	@Override
	public void doEnd(ReportRequest rrequest,ReportBean rbean){
	    	
	}
	
   
    
}
