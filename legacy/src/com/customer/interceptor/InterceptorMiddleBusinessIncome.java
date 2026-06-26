package com.customer.interceptor;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.component.application.report.abstractreport.AbsReportType;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.system.intercept.RowDataBean;

/*中间业务收入手工录入页面*/
public class InterceptorMiddleBusinessIncome extends AbsInterceptorDefaultAdapter {
	
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
				
				if (!exam_msr_dt_exam.equals((rowDataBean.getColData("MEASURE_DT")))) {
					rowDataBean.setReadonly(true);
				}
			}
		}
		
	}
	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		/*
		String beginTime = rrequest.getStringAttribute("MEASURE_DT", "");// 取出输入的查询时间
		String YANCHIJIAZAI = rrequest.getStringAttribute("YANCHIJIAZAI", "");// 判断是不是第一次进入页面,第一次进入页面则查询时间默认设成当前考核季
		
		String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
		//Connection conn = Config.getInstance().getDataSource("ds_ibs").getConnection();//
		
		Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();//
		PreparedStatement pstmt = null;
		String swcF = "0";
		if (YANCHIJIAZAI.equals("") && beginTime.equals("")) {// 条件框都没有输入值，则查询时间默认设成当前考核季
			rrequest.setAttribute("YANCHIJIAZAI", "1");
			try {
				String SQL = "Select MEASURE_DT from IBS.T99_MIDDLE_INCOME_SWITCH where SWITCH_F='1' ";
				pstmt = conn.prepareStatement(SQL);
				ResultSet resultSet = pstmt.executeQuery();
				while (resultSet.next()) {
					String date = resultSet.getString("MEASURE_DT");
					rrequest.setAttribute("MEASURE_DT", date);
					swcF = "1";
					
				}
				
				
				//System.out.println("输入的查询时间处理为:" + beginTime);
				//System.out.println("页面设置的MEASURE_DATE为："+rrequest.getStringAttribute("MEASURE_DT", "")); 
				resultSet.close();
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		}

		if (YANCHIJIAZAI.equals("1")) {
			try {
				String SQL = "Select MEASURE_DT from IBS.T99_MIDDLE_INCOME_SWITCH where SWITCH_F='1' ";
				pstmt = conn.prepareStatement(SQL);
				ResultSet resultSet = pstmt.executeQuery();
				while (resultSet.next()) {
					String date = resultSet.getString("MEASURE_DT");
					rrequest.setAttribute("MEASURE_DT", date);
					swcF = "1";
					
				}
				//System.out.println("输入的查询时间处理为:" + beginTime);
				//String measure_dt = (String) rrequest.getRequest().getSession().getAttribute("MEASURE_DT");
				
				resultSet.close();
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	 */
		String isExam = (String) rrequest.getRequest().getSession().getAttribute("isExam");
		if(isExam.equals("0")){
			rrequest.setAttribute("report_ACCESSMODE", "readonly");
			System.out.println("不是考核期不能修改！");
		}
		
		
	}

	@Override
	public void doEnd(ReportRequest rrequest, ReportBean rbean) {

		//System.out.println(new Date() + "中间业务收入手工录入页面:::执行后置动作------------------");
	}
}
