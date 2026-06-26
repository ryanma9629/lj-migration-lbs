package com.ljbank.market;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import com.wabacus.config.Config;
import com.wabacus.system.ReportRequest;

/*存款业绩认领比例校验*/
public class Servervalidate_ClaimDep {

	public static boolean isClaimRatio(ReportRequest rrequest, String RATIO, Map<String, String> mValues, List<String> lstErrorMessages) {
		//String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		//String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
		
		String vuch_nbr = rrequest.getStringAttribute("VUCH_NBR", "");// 取出凭证号
		//System.out.println("VUCH_NBR==" + vuch_nbr);
		//System.out.println("**************校验方法的凭证号取出" + vuch_nbr + "*********************");
		
		if (RATIO == null || RATIO.trim().equals(""))
			return true;// 为空不在这里校验，而是在isNotEmpty()中校验，所以直接返回true
		System.out.println("开始验证输入的认领比例是否合格");
//		for (Entry<String, String> entryTmp : mValues.entrySet()) {
//			//System.out.print(entryTmp.getKey() + "=" + entryTmp.getValue() + ";;");
//		}
		RATIO = RATIO.trim();
		Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			// System.out.println("------------取出的输入的认领比例"+RATIO);
			//String sql = "select 100-coalesce(sum(RATIO),0) as inratio from IBS.T1_VUCH_EMP_RELA where VUCH_NBR=" + vuch_nbr
			//+ " and CLAIM_STATUS_ID in ('1','2','5','6')";
			
			String sql = "select 100-coalesce(sum(case when coalesce(RVS_STATUS_ID,'') in ('1','2','21') then coalesce(RVS_RATIO,0) else coalesce(RATIO,0) end),0) as inratio " +
					"from IBS.T1_VUCH_EMP_RELA where VUCH_NBR='" + vuch_nbr+"' and CLAIM_STATUS_ID in ('1','2','5','6')";
			
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			Double inratio = rs.getDouble("inratio");
			System.out.println("剩余可以认领的比例inratio============" + inratio);
			Double ro =Double.parseDouble(RATIO);
			System.out.println("页面输入的认领比例ro============" + ro);
			if (ro > inratio) {
				rs.close();
				// conn.close();
				return false;
			} else {
				rs.close();
				// conn.close();
				return true;
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

	// 字符串换行 added by 王旭 此方法用于认领信息备注的换行输入
	public String turnStr(String str) {
		String s = "";
		char[] c = str.toCharArray();
		for (int i = 0; i < c.length; i++) {

			int k = i + 1;
			int j = 0;

			if (k % 10 == 0) {
				s += str.substring(k - 10, k) + "<br/>";
				j = k;// 获得插入字符的位置
				// System.out.println(s);
				// System.out.println(j);
			}

			if (k == c.length) {
				// System.out.println(j+":"+str.substring(k-k%10,k));
				s += str.substring(k - k % 10, k);
				// System.out.println(s);
			}
		}

		return s;
	}

}
