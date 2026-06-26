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
public class InterceptorClaimFncVerifyNo extends AbsInterceptorDefaultAdapter {

	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		String txn_dt = rrequest.getStringAttribute("TXN_DT", "");// 取出凭证号
		String emp_id = rrequest.getStringAttribute("EMP_ID", "");     // 取出认领人工号
		String txn_nbr = rrequest.getStringAttribute("TXN_NO", "");     // 取出认领人工号
		
		Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
		
		if (!txn_nbr.equals("")) {

			String SQL="Select count(1) as cnt from IBS.T1_FNC_TXN_EMP_RELA where TXN_NO=? and EMP_ID=? and TXN_DT=? and CLAIM_STATUS_ID='3' ";

			try {

		        PreparedStatement pstmt=null;
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, txn_nbr);
				pstmt.setString(2, emp_id);
				pstmt.setString(3, txn_dt);
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
