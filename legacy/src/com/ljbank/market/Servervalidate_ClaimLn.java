package com.ljbank.market;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.wabacus.config.Config;
import com.wabacus.system.ReportRequest;

/*贷款业绩认领输入的借据号校验*/
public class Servervalidate_ClaimLn {

	public static boolean isClaimRatio(ReportRequest rrequest, String RATIO, Map<String, String> mValues, List<String> lstErrorMessages) {
		String vuch_nbr = rrequest.getStringAttribute("VUCH_NBR", "");// 取出借据号
		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
		System.out.println("VUCH_NBR==" + vuch_nbr);
		System.out.println("**************校验方法的借据号取出" + vuch_nbr + "*********************");
		if (RATIO == null || RATIO.trim().equals(""))
			return true;
		System.out.println("开始验证输入的认领比例是否合格");
		for (Entry<String, String> entryTmp : mValues.entrySet()) {
			System.out.print(entryTmp.getKey() + "=" + entryTmp.getValue() + ";;");
		}
		System.out.println();
		RATIO = RATIO.trim();
		Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			String sql = "";
			/*
			if(user_id.equals(usr_org_id)){
				System.out.println("机构用户");
				sql = "select 100-coalesce(sum(RATIO),0) as inratio from IBS.T1_VUCH_EMP_RELA r inner join ibs.T5_ORG og on og.ORG_ID=r.EMP_ID and og.ORG_LEVEL_ID in ('1','2') and og.ORG_TYPE_ID='EO' where VUCH_NBR='" + vuch_nbr
				+ "' and CLAIM_STATUS_ID in ('1','2','5','6') with ur";
			}else{
			}*/
			
			sql = "select 100-coalesce(sum(case when coalesce(RVS_STATUS_ID,'') in ('1','2','21') then coalesce(RVS_RATIO,0) else coalesce(RATIO,0) end),0) as inratio from IBS.T1_VUCH_EMP_RELA where VUCH_NBR='" + vuch_nbr
			+ "' and CLAIM_STATUS_ID in ('1','2','5','6')";
			
			System.out.println("sql="+sql);
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			Double inratio = rs.getDouble("inratio");
			System.out.println("剩余可以认领的比例inratio============" + inratio);
			Double ro = Double.parseDouble(RATIO);
			System.out.println("页面输入的认领比例ro============" + ro);
			if (ro > inratio) {
				rs.close();

				return false;
			} else {
				rs.close();
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/*
	 * isDTCanNotClaim--大堂经理不可以认领的凭证号校验方法
	 * ************考核办法内声明，大堂经理仅可以认领个人贷款、小企业贷款；公司贷款及三农贷款大堂经理不可以认领************
	 * CC-个人贷款************ DD-三农贷款************ EE-公司贷款************ FF-小企业贷款
	 */
	public static boolean isDTCanNotClaim(ReportRequest rrequest, String DT_EMP_ID, Map<String, String> mValues, List<String> lstErrorMessages) {
		String vuch_nbr = rrequest.getStringAttribute("VUCH_NBR", "");// 取出借据号
		System.out.println("VUCH_NBR==" + vuch_nbr);
		System.out.println("**************校验方法的借据号取出" + vuch_nbr + "*********************");
		if (DT_EMP_ID == null || DT_EMP_ID.trim().equals(""))
			return true;//
		System.out.println("开始验证领的凭证号是否是大堂经理可以认领的校验方法");
		for (Entry<String, String> entryTmp : mValues.entrySet()) {
			System.out.print(entryTmp.getKey() + "=" + entryTmp.getValue() + ";;");
		}
		System.out.println();
		// DT_EMP_ID=DT_EMP_ID.trim();
		Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			// System.out.println("------------取出的输入的认领比例"+RATIO);
			String sql = "select count(1) as cnt from IBS.T1_VUCH_DETAIL where VUCH_NBR=" + vuch_nbr + " and BIZ_TYPE_ID in ('CC','FF')";

			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			int flg = rs.getInt("cnt");
			System.out.println("要认领的凭证号是否为大堂经理可以认领的凭证类型" + flg);
			if (flg > 0) {// flg=1 则可以认领
				rs.close();
				return true;
			} else {// flg=1 则不可以认领
				rs.close();
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
