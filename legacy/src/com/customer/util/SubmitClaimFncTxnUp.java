package com.customer.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
import com.wabacus.util.Consts;



/*理财业绩认领提交按钮方法*/
public class SubmitClaimFncTxnUp implements IServerAction {
	/**
	 * 与框架无关的ajax调用
	 */
	@Override
	public String executeServerAction(HttpServletRequest request, HttpServletResponse response, List<Map<String, String>> lstData) {

		return null;
	}

	/**
	 * 针对组件通过ajax调用服务器端方法
	 */
	@Override
	public String executeSeverAction(ReportRequest rrequest,
			IComponentConfigBean ccbean, List<Map<String, String>> lstData,
			Map<String, String> mCustomizedData) {
		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		String user_name = (String) rrequest.getRequest().getSession().getAttribute("user_name");
		String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
		String usr_org_nm = (String) rrequest.getRequest().getSession().getAttribute("usr_org_nm");
		String txn_run_nbr = (String)rrequest.getRequest().getSession().getAttribute("txnNoPam");
		//String inpRo = rrequest.getStringAttribute("RATIO");
		String txn_dt = (String)rrequest.getRequest().getSession().getAttribute("txnDtPam");
		String old_emp_id = (String)rrequest.getRequest().getSession().getAttribute("EMP_ID");
		String ratio = (String)rrequest.getRequest().getSession().getAttribute("RATIO");
		String remark1 = (String)rrequest.getRequest().getSession().getAttribute("REMARK1");
		Date date = new Date();
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
		String dt = dateformat.format(date);

		SimpleDateFormat dateformat1 = new SimpleDateFormat("yyyy-MM-dd-HH.mm.ss");// 认领时间戳，用于填写在备注时间上
		String dts = dateformat1.format(date);

		Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
		
		String sqlcnt="SELECT count(1) as cnt FROM IBS.T1_FNC_TXN_EMP_RELA WHERE TXN_NO=? and TXN_DT=? and EMP_ID=? and RATIO<>0 and CLAIM_STATUS_ID in ('1','2','5','6')";
		PreparedStatement pstmtCnt = null;
		try {
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
				return "提交失败！";
				
			}else{
				try { // 提交按钮补充校验判断凭证认领剩余比例
				
						
						String sqlUpd= "update IBS.T1_FNC_TXN_EMP_RELA set RATIO = ?,REMARK1=?," +
								"CLAIM_STATUS_ID='0',EMP_ID = ?,EMP_NM = ?,EMP_ORG_ID = ?,EMP_ORG_NM = ?," +
								"CLAIM_DT=? where TXN_NO=? and EMP_ID=? and TXN_DT=?";
						
						PreparedStatement pstmt = null;
						pstmt = conn.prepareStatement(sqlUpd);
						pstmt.setString(1, ratio);
						pstmt.setString(2, remark1);
						pstmt.setString(3, user_id);
						pstmt.setString(4, user_name);
						pstmt.setString(5, usr_org_id);
						pstmt.setString(6, usr_org_nm);
						pstmt.setString(7, dt);
						pstmt.setString(8, txn_run_nbr);
						pstmt.setString(9, txn_dt);
						pstmt.executeUpdate();
						rrequest.getWResponse().getMessageCollector().success("提交成功！", false);// 向前台提示一条信息，这里还可以终止后续处理
						
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println(e);
					return "执行数据库操作失败";
				} finally {
					try {
						conn.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		
		return "提交成功！";

		
	}

}
