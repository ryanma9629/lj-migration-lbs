package com.ljbank.market;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.wabacus.config.Config;
import com.wabacus.system.ReportRequest;

public class TestPersonnel {
//	public static String getPersonnelName(ReportRequest rrequest, String per_id, Map<String, String> mValues, List<String> lstErrorMessages) {
//		if (per_id == null || per_id.trim().equals("")) {
//			return "";
//		} else
//			return per_id;
//	}
	public static boolean isSameBranchOrg(ReportRequest rrequest,
			String per_id, Map<String, String> mValues,
			List<String> lstErrorMessages) {
		// 判断录入人与考核人是否为相同的分行机构号
		if (per_id == null || per_id.trim().equals(""))
			return true;
		//System.out.println("机构校验----进行验证服务器端各列的新旧值：");
//		for (Entry<String, String> entryTmp : mValues.entrySet()) {
//			System.out.print(entryTmp.getKey() + "=" + entryTmp.getValue()
//					+ ";;");
//
//		}
//		System.out.println();
		per_id = per_id.trim();
		// 获得录入员分行机构号
		String org_id = (String) rrequest.getRequest().getSession()
				.getAttribute("org_id");

		System.out.println("录入员org_id=" + org_id);
		Connection conn = rrequest.getConnection();
		Statement stmt = null;
		try {
			stmt = conn.createStatement();

			// 机构
			ResultSet rs = stmt
					.executeQuery("SELECT count(*) FROM IBS.T5_EMP WHERE EMP_ID='" + per_id	+ "' AND BRANCH_ORG_ID='" + org_id + "'");
			rs.next();
			int count = rs.getInt(1);
			rs.close();
			//System.out.println(count);
			//System.out.println(count == 1);
			return count == 1;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (stmt != null)
					stmt.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	public static boolean isPersonnel(ReportRequest rrequest, String per_id, Map<String, String> mValues, List<String> lstErrorMessages) {

		if (per_id == null || per_id.trim().equals(""))
			return true;
		//System.out.println("进行验证服务器端各列的新旧值：");
//		for (Entry<String, String> entryTmp : mValues.entrySet()) {
//			System.out.print(entryTmp.getKey() + "=" + entryTmp.getValue() + ";;");
//
//		}
//		System.out.println();

		per_id = per_id.trim();

		Connection conn = rrequest.getConnection();
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select count(*) from IBS.T5_EMP where EMP_ID='" + per_id + "'");
			rs.next();
			int count = rs.getInt(1);
			rs.close();
			System.out.println(count);
			System.out.println(count == 1);
			return count == 1;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (stmt != null)
					stmt.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}
	
	/*票业绩调 判断收入不为0*/
	public static boolean isBILL_INC(ReportRequest rrequest, String BILL_INC, Map<String, String> mValues, List<String> lstErrorMessages) throws SQLException {
		//String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		//String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
		
		if (BILL_INC == null || BILL_INC.trim().equals("") || Double.parseDouble(BILL_INC.trim())==0){
			rrequest.getWResponse().getMessageCollector().error("票据收不能为空或0！", "", false);
			return false;
			
		}
		
		String chg_dt=rrequest.getStringAttribute("REMARK", "");
		
		
		//String mea_dt = "";
		String emp_id = "";
		
		for(Entry<String,String> entryTmp:mValues.entrySet()){
			//System.out.print(entryTmp.getKey()+"="+entryTmp.getValue()+";;");
//			if(entryTmp.getKey().equals("MEASURE_DT")){
//				mea_dt=entryTmp.getValue();
//			}
			if(entryTmp.getKey().equals("EMP_ID")){
				emp_id=entryTmp.getValue();
			}
			if(entryTmp.getKey().equals("CHG_DT")){
				if(chg_dt!=null && !chg_dt.equals(""))
				{
					entryTmp.setValue(chg_dt);
				}
			}
			
		}
		
		if (emp_id != null && !emp_id.trim().equals("") ){
			Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
			String sqlcnt="SELECT count(1) as cnt FROM IBS.T2_EMP_BILL_INCOME WHERE CHG_DT=? and EMP_ID=?";
			PreparedStatement pstmtCnt = null;
			pstmtCnt = conn.prepareStatement(sqlcnt);
			
			pstmtCnt.setString(1, chg_dt);
			pstmtCnt.setString(2, emp_id);
			
			ResultSet rsCnt = pstmtCnt.executeQuery();
			rsCnt.next();
			int cnt=rsCnt.getInt("cnt");
			if(cnt>=1){
				rrequest.getWResponse().getMessageCollector().error("已调整，不可重复调整！", "", false);
				rsCnt.close();
				pstmtCnt.close();
				return false;
			}
			
			rsCnt.close();
			pstmtCnt.close();
			conn.close();
		}else{
			rrequest.getWResponse().getMessageCollector().error("员工号 不能为空！", "", false);
			return false;
		}
		
		return true;
	}
}
