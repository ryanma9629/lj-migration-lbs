
package com.customer.interceptor;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.component.application.report.abstractreport.AbsReportType;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.system.intercept.RowDataBean;

public class InterceptorBillIncChg extends AbsInterceptorDefaultAdapter
{
	
	@Override
	public Object beforeLoadData(ReportRequest rrequest, ReportBean rbean, Object typeObj, String sql) {
		String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
		String branch_id = (String) rrequest.getRequest().getSession().getAttribute("branch_id");
		String org_lev_id = (String) rrequest.getRequest().getSession().getAttribute("org_lev_id");
		
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
	public void beforeDisplayReportDataPerRow(ReportRequest rrequest,ReportBean rbean, RowDataBean rowDataBean) {
		
		
		String isExam = (String) rrequest.getRequest().getSession().getAttribute("isExam");
		if(isExam.equals("1")){
			
			String exam_msr_dt_exam = (String) rrequest.getRequest().getSession().getAttribute("exam_msr_dt_exam");
			
			if (rowDataBean.getRowindex() < 0) {// 当前是在显示标题行
				return;
			}
			AbsReportType reportTypeObj = rrequest.getDisplayReportTypeObj(rbean.getId());
			if (reportTypeObj.getLstReportData() != null
					&& rowDataBean.getRowindex() < reportTypeObj.getLstReportData()
					.size()) {
				
				if (!exam_msr_dt_exam.equals((rowDataBean.getColData("CHG_DT")))) {
					rowDataBean.setReadonly(true);
				}
			}
		}
		
	}
	
	@Override
	public void doStart(ReportRequest rrequest,ReportBean rbean){
		/*
		String beginTime = rrequest.getStringAttribute("CHG_DT", "");// 取出输入的查询时间
		String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
		String org_lev_id = (String) rrequest.getRequest().getSession().getAttribute("org_lev_id");
		org_lev_id=org_lev_id==null?"":org_lev_id;
		 */
		/*
		if(org_lev_id.equals("2")){
			rrequest.setAttribute("orgID1", usr_org_id);
		}else if(org_lev_id.equals("1")){
			rrequest.setAttribute("ORG_ID2", usr_org_id);
		}
		*/
		/*
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
	                     rrequest.setAttribute("CHG_DT", date);
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
			
			if(!rs.next()||usr_org_id.equals("9990")||usr_org_id.equals("8000")){
//				rrequest.authorize("bill_inc_mod_rpt", Consts.BUTTON_PART,"type{save}", "disabled", "true");
//				rrequest.authorize("bill_inc_mod_rpt", Consts.BUTTON_PART,"type{add}", "disabled", "true");
//				rrequest.authorize("bill_inc_mod_rpt", Consts.BUTTON_PART,"type{delete}", "disabled", "true");
				rrequest.setAttribute("bill_inc_mod_rpt_ACCESSMODE", "readonly");
				System.out.println("不是考核期不能修改！");
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		*/
		String isExam = (String) rrequest.getRequest().getSession().getAttribute("isExam");
		if(isExam.equals("0")){
//			rrequest.authorize("ln_bl_mod_rpt", Consts.BUTTON_PART,"type{save}", "disabled", "true");
//			rrequest.authorize("ln_bl_mod_rpt", Consts.BUTTON_PART,"type{add}", "disabled", "true");
//			rrequest.authorize("ln_bl_mod_rpt", Consts.BUTTON_PART,"type{delete}", "disabled", "true");
			rrequest.setAttribute("bill_inc_mod_rpt_ACCESSMODE", "readonly");
			System.out.println("不是考核期不能修改！");
		}
	}

	@Override
	public void doEnd(ReportRequest rrequest,ReportBean rbean){
	    	
	}
	
    
}
