package com.ljbank.market;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.wabacus.config.Config;
import com.wabacus.system.ReportRequest;

/*存款业绩认领比例校验*/
public class Servervalidate_lnBlChg {

	public static boolean isVUCH_NBR(ReportRequest rrequest, String vuch_nbr, Map<String, String> mValues, List<String> lstErrorMessages) throws SQLException {
		//String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		//String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
		
		String chg_dt=rrequest.getStringAttribute("REMARK", "");
		
		
		String mea_dt = "";
		String emp_id = "";
		
		for(Entry<String,String> entryTmp:mValues.entrySet()){
			//System.out.print(entryTmp.getKey()+"="+entryTmp.getValue()+";;");
			if(entryTmp.getKey().equals("MEASURE_DT")){
				mea_dt=entryTmp.getValue();
			}
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
		
		if (mea_dt != null && !mea_dt.trim().equals("") && emp_id != null && !emp_id.trim().equals("") && vuch_nbr != null && !vuch_nbr.trim().equals("")){
			Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
			String sqlcnt="SELECT count(1) as cnt FROM IBS.T2_EMP_LN_PROFIT_BL_CHG WHERE MEASURE_DT=? and EMP_ID=? and VUCH_NBR=?  with ur";
			PreparedStatement pstmtCnt = null;
			pstmtCnt = conn.prepareStatement(sqlcnt);
			
			pstmtCnt.setString(1, mea_dt);
			pstmtCnt.setString(2, emp_id);
			pstmtCnt.setString(3, vuch_nbr);
			
			ResultSet rsCnt = pstmtCnt.executeQuery();
			rsCnt.next();
			int cnt=rsCnt.getInt("cnt");
			if(cnt>=1){
				rrequest.getWResponse().getMessageCollector().error("此凭已调整，不可重复调整！", "", false);
				rsCnt.close();
				pstmtCnt.close();
				return false;
			}
			
			rsCnt.close();
			pstmtCnt.close();
			conn.close();
		}else{
			rrequest.getWResponse().getMessageCollector().error("统计日期、员工号、凭证号不能为空！", "", false);
			return false;
		}
		
		return true;
	}


}
