package com.ljbank.market;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.wabacus.config.Config;
import com.wabacus.system.ReportRequest;

/*基金相关校验*/
public class Servervalidate_Fund {

	public static boolean isClaimTxnRatio(ReportRequest rrequest, String RATIO, Map<String, String> mValues, List<String> lstErrorMessages) throws SQLException {
		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		//String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
		
		String txn_no = rrequest.getStringAttribute("TXN_NO", "");
		String txn_dt = rrequest.getStringAttribute("TXN_DT", "");
		if (RATIO == null || RATIO.trim().equals("") || Double.parseDouble(RATIO.trim())==0){
			rrequest.getWResponse().getMessageCollector().error("认领比例不可输入空值或0！", false);
			return false;
		}
		
		
		RATIO = RATIO.trim();
		Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
		String sqlcnt="SELECT count(1) as cnt FROM IBS.T1_FUND_TXN_EMP_RELA WHERE TXN_NO=? and TXN_DT=? and EMP_ID=? and RATIO<>0 and CLAIM_STATUS_ID in ('1','2','5','6','21') with ur";
		PreparedStatement pstmtCnt = null;
		pstmtCnt = conn.prepareStatement(sqlcnt);
		
		pstmtCnt.setString(1, txn_no);
		pstmtCnt.setString(2, txn_dt);
		pstmtCnt.setString(3, user_id);
		
		ResultSet rsCnt = pstmtCnt.executeQuery();
		rsCnt.next();
		int cnt=rsCnt.getInt("cnt");
		if(cnt>=1){
			rrequest.getWResponse().getMessageCollector().error("此笔业务你已认领，不可重复认领！", false);
			rsCnt.close();
			pstmtCnt.close();
			return false;
		}
		
		try {
			String sql = "SELECT 100-coalesce(SUM(ratio),0) AS inratio FROM IBS.T1_FUND_TXN_EMP_RELA WHERE TXN_NO=? and TXN_DT=? and CLAIM_STATUS_ID in ('1','2','5','6','21') with ur" 
				;
			PreparedStatement pstmt = null;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, txn_no);
			pstmt.setString(2, txn_dt);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			Double inratio = rs.getDouble("inratio");
			Double ro =Double.parseDouble(RATIO);
			if (ro > inratio) {
				
				rrequest.getWResponse().getMessageCollector().error("剩余认领比例为："+inratio+"！请调整认领比例后，再试。", false);
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
		public static boolean isClaimCstRatio(ReportRequest rrequest, String RATIO, Map<String, String> mValues, List<String> lstErrorMessages) throws SQLException {
			String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
			//String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
			
			String ide_no = rrequest.getStringAttribute("IDENTN_NO", "");
			if (RATIO == null || RATIO.trim().equals("") || Double.parseDouble(RATIO.trim())==0){
				rrequest.getWResponse().getMessageCollector().error("认领比例不可输入空值或0！", false);
				return false;
			}
			
			
			RATIO = RATIO.trim();
			Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
			String sqlcnt="SELECT count(1) as cnt FROM IBS.T1_FUND_CST_EMP_RELA WHERE IDENTN_NO=? and  EMP_ID=? and RATIO<>0 and CLAIM_STATUS_ID in ('1','2','5','6','21') with ur";
			PreparedStatement pstmtCnt = null;
			pstmtCnt = conn.prepareStatement(sqlcnt);
			
			pstmtCnt.setString(1, ide_no);
			pstmtCnt.setString(2, user_id);
			
			ResultSet rsCnt = pstmtCnt.executeQuery();
			rsCnt.next();
			int cnt=rsCnt.getInt("cnt");
			if(cnt>=1){
				rrequest.getWResponse().getMessageCollector().error("此笔业务你已认领，不可重复认领！", false);
				rsCnt.close();
				pstmtCnt.close();
				return false;
			}
			
			try {
				String sql = "SELECT 100-coalesce(SUM(ratio),0) AS inratio FROM IBS.T1_FUND_CST_EMP_RELA WHERE IDENTN_NO=? and CLAIM_STATUS_ID in ('1','2','5','6','21') with ur" 
					;
				PreparedStatement pstmt = null;
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, ide_no);
				ResultSet rs = pstmt.executeQuery();
				
				rs.next();
				Double inratio = rs.getDouble("inratio");
				Double ro =Double.parseDouble(RATIO);
				if (ro > inratio) {
					
					rrequest.getWResponse().getMessageCollector().error("剩余认领比例为："+inratio+"！请调整认领比例后，再试。", false);
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
	
		public static boolean isClaimDtRatio(ReportRequest rrequest, String RATIO, Map<String, String> mValues, List<String> lstErrorMessages) throws SQLException {
			String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
			//String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
			
			String ser_no = rrequest.getStringAttribute("SERIAL_NO", "");
			if (RATIO == null || RATIO.trim().equals("") || Double.parseDouble(RATIO.trim())==0){
				rrequest.getWResponse().getMessageCollector().error("认领比例不可输入空值或0！", false);
				return false;
			}
			
			
			RATIO = RATIO.trim();
			Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
			String sqlcnt="SELECT count(1) as cnt FROM IBS.T1_FUND_DT_EMP_RELA WHERE SERIAL_NO=? and  EMP_ID=? and RATIO<>0 and CLAIM_STATUS_ID in ('1','2','5','6','21') with ur";
			PreparedStatement pstmtCnt = null;
			pstmtCnt = conn.prepareStatement(sqlcnt);
			
			pstmtCnt.setString(1, ser_no);
			pstmtCnt.setString(2, user_id);
			
			ResultSet rsCnt = pstmtCnt.executeQuery();
			rsCnt.next();
			int cnt=rsCnt.getInt("cnt");
			if(cnt>=1){
				rrequest.getWResponse().getMessageCollector().error("此笔业务你已认领，不可重复认领！", false);
				rsCnt.close();
				pstmtCnt.close();
				return false;
			}
			
			try {
				String sql = "SELECT 100-coalesce(SUM(ratio),0) AS inratio FROM IBS.T1_FUND_DT_EMP_RELA WHERE SERIAL_NO=? and CLAIM_STATUS_ID in ('1','2','5','6','21') with ur" 
					;
				PreparedStatement pstmt = null;
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, ser_no);
				ResultSet rs = pstmt.executeQuery();
				
				rs.next();
				Double inratio = rs.getDouble("inratio");
				Double ro =Double.parseDouble(RATIO);
				if (ro > inratio) {
					
					rrequest.getWResponse().getMessageCollector().error("剩余认领比例为："+inratio+"！请调整认领比例后，再试。", false);
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
