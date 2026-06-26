package com.customer.interceptor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.wabacus.config.Config;
import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.util.Consts;

/*认领审核不通过弹窗页面*/
public class InterceptorClaimYbdbVerifyNo extends AbsInterceptorDefaultAdapter {

	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		String insure_no = rrequest.getStringAttribute("INSURE_NO", "");
		String emp_id = rrequest.getStringAttribute("EMP_ID", "");     
		String insure_dt = rrequest.getStringAttribute("INSURE_DATE", "");     
		
		Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
		
		if (!insure_no.equals("")) {

			String SQL="Select count(1) as cnt from IBS.T1_YBDB_EMP_RELA where INSURE_NO=? and EMP_ID=? and INSURE_DATE=? and CLAIM_STATUS_ID='3' ";

			try {

		        PreparedStatement pstmt=null;
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, insure_no);
				pstmt.setString(2, emp_id);
				pstmt.setString(3, insure_dt);
				ResultSet resultSet = pstmt.executeQuery();
				while (resultSet.next()) {
					if(resultSet.getInt("cnt") == 1){
						//此流水号已未审通过
						rrequest.authorize("report", Consts.BUTTON_PART, "type{save}",	"disabled", "true");
						rrequest.authorize("report", Consts.BUTTON_PART, "button2", "disabled", "true");
						rrequest.authorize("report", Consts.BUTTON_PART, "type{reset}", "disabled", "true");
					}
				}
				resultSet.close();
				pstmt.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
			finally{
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public void doEnd(ReportRequest rrequest, ReportBean rbean) {
	}
}
