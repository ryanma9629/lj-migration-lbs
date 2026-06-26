package com.ljbank.market;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.wabacus.config.Config;
import com.wabacus.system.ReportRequest;

/*理财业绩认领比例校验*/
public class Servervalidate_ClaimFncTxn {

	public static boolean isClaimRatio(ReportRequest rrequest, String RATIO, Map<String, String> mValues, List<String> lstErrorMessages) throws SQLException {
		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		//String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
		
		String txn_run_nbr = rrequest.getStringAttribute("txnNoPam", "");
		String txn_dt = rrequest.getStringAttribute("txnDtPam", "");
		if (RATIO == null || RATIO.trim().equals("") || Double.parseDouble(RATIO.trim())==0){
			rrequest.getWResponse().getMessageCollector().error("认领比例不可输入空值或0！", "", false);
			return false;
		}
		
		
		RATIO = RATIO.trim();
		Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
		String sqlcnt="SELECT count(1) as cnt FROM IBS.T1_FNC_TXN_EMP_RELA WHERE TXN_NO=? and TXN_DT=? and EMP_ID=? and RATIO<>0 and CLAIM_STATUS_ID in ('1','2','5','6') with ur";
		PreparedStatement pstmtCnt = null;
		pstmtCnt = conn.prepareStatement(sqlcnt);
		
		pstmtCnt.setString(1, txn_run_nbr);
		pstmtCnt.setString(2, txn_dt);
		pstmtCnt.setString(3, user_id);
		
		ResultSet rsCnt = pstmtCnt.executeQuery();
		rsCnt.next();
		int cnt=rsCnt.getInt("cnt");
		if(cnt>=1){
			rrequest.getWResponse().getMessageCollector().error("此笔业务已认领，不可重复认领！", "", false);
			rsCnt.close();
			pstmtCnt.close();
			return false;
		}
		
		try {
			String sql = "SELECT 100-SUM(CASE WHEN EMP_ID<>'000000'  and CLAIM_STATUS_ID in ('1','2','5','6') THEN ratio ELSE 0 END) AS inratio FROM IBS.T1_FNC_TXN_EMP_RELA WHERE TXN_NO=? and TXN_DT=? with ur" 
				;
			PreparedStatement pstmt = null;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, txn_run_nbr);
			pstmt.setString(2, txn_dt);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			Double inratio = rs.getDouble("inratio");
			Double ro =Double.parseDouble(RATIO);
			if (ro > inratio) {
				
				rrequest.getWResponse().getMessageCollector().error("提交前请核对认领比例！请调整认领比例后，再试。", "", false);
				pstmt.close();
				rs.close();
				return false;
			} else {
				pstmt.close();
				rs.close();
				return true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				
				conn.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
	}
	
	public static boolean isSCURT_AC(ReportRequest rrequest, String RATIO, Map<String, String> mValues, List<String> lstErrorMessages) throws SQLException {
		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		//String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
		
		String txn_run_nbr = rrequest.getStringAttribute("txnNoPam", "");
		String txn_dt = rrequest.getStringAttribute("txnDtPam", "");
		if (RATIO == null || RATIO.trim().equals("") || Double.parseDouble(RATIO.trim())==0){
			rrequest.getWResponse().getMessageCollector().error("认领比例不可输入空值或0！", "", false);
			return false;
		}
		
		
		RATIO = RATIO.trim();
		Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
		String sqlcnt="SELECT count(1) as cnt FROM IBS.T1_FNC_TXN_EMP_RELA WHERE TXN_NO=? and TXN_DT=? and EMP_ID=? and RATIO<>0 and CLAIM_STATUS_ID in ('1','2','5','6') with ur";
		PreparedStatement pstmtCnt = null;
		pstmtCnt = conn.prepareStatement(sqlcnt);
		
		pstmtCnt.setString(1, txn_run_nbr);
		pstmtCnt.setString(2, txn_dt);
		pstmtCnt.setString(3, user_id);
		
		ResultSet rsCnt = pstmtCnt.executeQuery();
		rsCnt.next();
		int cnt=rsCnt.getInt("cnt");
		if(cnt>=1){
			rrequest.getWResponse().getMessageCollector().error("此笔业务已认领，不可重复认领！", "", false);
			rsCnt.close();
			pstmtCnt.close();
			return false;
		}
		
		try {
			String sql = "SELECT 100-SUM(CASE WHEN EMP_ID<>'000000' and CLAIM_STATUS_ID in ('1','2','5','6') THEN ratio ELSE 0 END) AS inratio FROM IBS.T1_FNC_TXN_EMP_RELA WHERE TXN_NO=? and TXN_DT=? with ur" 
				;
			PreparedStatement pstmt = null;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, txn_run_nbr);
			pstmt.setString(2, txn_dt);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			Double inratio = rs.getDouble("inratio");
			Double ro =Double.parseDouble(RATIO);
			if (ro > inratio) {
				
				rrequest.getWResponse().getMessageCollector().error("提交前请核对认领比例！请调整认领比例后，再试。", "", false);
				pstmt.close();
				rs.close();
				return false;
			} else {
				pstmt.close();
				rs.close();
				return true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				
				conn.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
	}


}
