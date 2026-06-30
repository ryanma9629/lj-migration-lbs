
package com.customer.interceptor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wabacus.config.Config;
import com.wabacus.config.component.IComponentConfigBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.serveraction.IServerAction;

public class ClaimVerifyFundServerCallBack implements IServerAction {
	
	@Override
	public String executeServerAction(HttpServletRequest request,
			HttpServletResponse response, List<Map<String, String>> lstData) {
		System.out
				.println("executeServerAction(HttpServletRequest request,HttpServletResponse response,List<Map<String,String>> lstData)方法...");
		return null;
	}

	
	@Override
	public String executeSeverAction(ReportRequest rrequest,
			IComponentConfigBean ccbean, List<Map<String, String>> lstData,
			Map<String, String> mCustomizedData) {

		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		
		Date date = new Date();
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
		String dt = dateformat.format(date);

		SimpleDateFormat dateformat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dts = dateformat1.format(date);
		
		String vuch = "";
		String emp_id = "";
		String txn_dt = "";
		String remark1 = "";
		
		/*客户端传入参数列表*/
		if (lstData == null || lstData.size() == 0) {
			System.out.println("无参数");
		} else {
			//System.out.println("客户端传入参数列表：：：");
			for (Map<String, String> mParams : lstData) {
				for (Entry<String, String> entryTmp : mParams.entrySet()) {
					if (entryTmp.getKey().equals("VUCH_NO")) {
						vuch = entryTmp.getValue();
					}
					if (entryTmp.getKey().equals("EMP_ID")) {
						emp_id = entryTmp.getValue();
					}
					if (entryTmp.getKey().equals("TXN_DT")) {
						txn_dt = entryTmp.getValue();
					}
					if (entryTmp.getKey().equals("REMARK1")) {
						remark1 = entryTmp.getValue();
					}
				}
				
				Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
				try {

					PreparedStatement pstmt = null;
					String sqlTxn ="UPDATE ibs.T1_FUND_TXN_EMP_RELA SET CLAIM_STATUS_ID='2',VERIFY_DT=?,VERIFY_EMP_ID=?,REMARK=CONCAT(COALESCE(REMARK,''),'审批时间',?,'审批工号',?,'审批理由页面批复通过。') " +
					"WHERE TXN_NO=? AND TXN_DT=? AND EMP_ID=? AND CLAIM_STATUS_ID='1' " ;
					
					String sqlCst ="UPDATE ibs.T1_FUND_CST_EMP_RELA SET CLAIM_STATUS_ID='2',VERIFY_DT=?, VERIFY_EMP_ID=?, REMARK=CONCAT(COALESCE(REMARK,''),'审批时间',?,'审批工号',?,'审批理由页面批复通过。')  " +
					"WHERE IDENTN_NO=? AND EMP_ID=? AND TXN_DT=?  AND CLAIM_STATUS_ID='1' ";
					
					String sqlDt="UPDATE ibs.T1_FUND_DT_EMP_RELA SET CLAIM_STATUS_ID='2', VERIFY_DT=?, VERIFY_EMP_ID=?,REMARK=CONCAT(COALESCE(REMARK,''),'审批时间',?,'审批工号',?,'审批理由页面批复通过。') " +
					"WHERE SERIAL_NO=? AND EMP_ID=? AND TXN_DT=?  AND CLAIM_STATUS_ID='1'";
					
					//System.out.println("sqlTxn="+sqlTxn);
					pstmt = conn.prepareStatement(sqlTxn);
					pstmt.setString(1, dt);
					pstmt.setString(2, user_id);
					pstmt.setString(3, dts);
					pstmt.setString(4, user_id);
					pstmt.setString(5, vuch);
					pstmt.setString(6, txn_dt);
					pstmt.setString(7, emp_id);
					pstmt.executeUpdate();
					
					//System.out.println("sqlCst="+sqlCst);
					pstmt = conn.prepareStatement(sqlCst);
					pstmt.setString(1, dt);
					pstmt.setString(2, user_id);
					pstmt.setString(3, dts);
					pstmt.setString(4, user_id);
					pstmt.setString(5, vuch);
					pstmt.setString(6, emp_id);
					pstmt.setString(7, txn_dt);
					pstmt.executeUpdate();
					
					//System.out.println("sqlDt="+sqlDt);
					pstmt = conn.prepareStatement(sqlDt);
					pstmt.setString(1, dt);
					pstmt.setString(2, user_id);
					pstmt.setString(3, dts);
					pstmt.setString(4, user_id);
					pstmt.setString(5, vuch);
					pstmt.setString(6, emp_id);
					pstmt.setString(7, txn_dt);
					pstmt.executeUpdate();
					
					pstmt.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				finally{
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}

			}

		}
		rrequest.getWResponse().getMessageCollector().success("数据处理完成！", false);
		return "成功!!!";
	}
}
