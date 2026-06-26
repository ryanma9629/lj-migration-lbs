
package com.customer.interceptor;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;

public class InterceptorOtherChgSel extends AbsInterceptorDefaultAdapter
{
	
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
			sqll = " and og.ORG_ID ='"+usr_org_id+"'";
		}
		
		sql = sql.replaceAll("%SQL%", sqll);
        return sql;
		
	}
	/*
	@Override
	public void doStart(ReportRequest rrequest,ReportBean rbean){
		
		String beginTime = rrequest.getStringAttribute("MEASURE_DT", "");// 取出输入的查询时间
		
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
	                     rrequest.setAttribute("MEASURE_DT", date);
	                     i=0;
                    }
					resultSet1.close();
					pstmt1.close();
				} 
			catch (Exception e) {
					e.printStackTrace();
			}
        }
	}
*/
	@Override
	public void doEnd(ReportRequest rrequest,ReportBean rbean){
	    	
	}
	
    
}
