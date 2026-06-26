package com.customer.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wabacus.config.Config;
import com.wabacus.config.component.IComponentConfigBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.serveraction.IServerAction;
import com.wabacus.util.Consts;

/*第三方业绩认领提交按钮方法*/
public class SubmitClaimThd implements IServerAction {
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
	public String executeSeverAction(ReportRequest rrequest, IComponentConfigBean ccbean, List<Map<String, String>> lstData,
			Map<String, String> mCustomizedData) {
		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		String user_name = (String) rrequest.getRequest().getSession().getAttribute("user_name");
		String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
		String usr_org_nm = (String) rrequest.getRequest().getSession().getAttribute("usr_org_nm");
		String scurt_ac = (String) rrequest.getRequest().getSession().getAttribute("SCURT_AC");
		String runNbr = (String)rrequest.getRequest().getSession().getAttribute("TXN_RUN_NBR");

		Date date = new Date();
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
		String dt = dateformat.format(date);

		SimpleDateFormat dateformat1 = new SimpleDateFormat("yyyy-MM-dd-HH.mm.ss");// 认领时间戳，用于填写在备注时间上
		String dts = dateformat1.format(date);

		Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
		
		String sqlcnt="SELECT count(1) as cnt FROM IBS.T1_THD_EMP_RELA WHERE SCURT_AC=? and CLAIM_STATUS_ID in ('1','2','5','6') with ur";
		PreparedStatement pstmtCnt = null;
		try {
			pstmtCnt = conn.prepareStatement(sqlcnt);
			pstmtCnt.setString(1, scurt_ac);
			
			ResultSet rsCnt = pstmtCnt.executeQuery();
			rsCnt.next();
			int cnt=rsCnt.getInt("cnt");
			if(cnt>=1){
				rrequest.getWResponse().getMessageCollector().error("此笔业务已认领，不可重复认领！", false);
				rsCnt.close();
				pstmtCnt.close();
				return "提交失败！";
				
			}else{
				try { // 提交按钮补充校验判断凭证认领剩余比例
					/*String sqlvalidate = "SELECT 100-SUM(CASE WHEN EMP_ID<>'000000'  and CLAIM_STATUS_ID in ('1','2','5','6') THEN ratio ELSE 0 END) AS inratio FROM IBS.GOLD_EMP_RELA WHERE TXN_RUN_NBR=? and TXN_DT=? with ur";
					
					PreparedStatement pstmt0 = null;
					pstmt0 = conn.prepareStatement(sqlvalidate);
					pstmt0.setString(1, txn_run_nbr);
					pstmt0.setString(2, txn_dt);
					ResultSet rs = pstmt0.executeQuery();
					rs.next();

					double inratio = rs.getDouble("inratio");
					double ro = Double.parseDouble(inpRo);
					System.out.println("剩余可以认领的比例inratio=" + inratio+" 页面输入的认领比例inpRo=" + inpRo);
					if (ro > inratio) {
						pstmt0.close();
						rs.close();
						rrequest.getWResponse().getMessageCollector().error("提交前请核对认领比例！请调整认领比例后，再试。", false);
						return "提交失败！";
					} else {*/
						
						String sqlUpd= "update IBS.T1_THD_EMP_RELA set CLAIM_STATUS_ID='1', CLAIM_DT=?, REMARK='认领时间'||?||'认领工号'||?||'认领理由'||coalesce(REMARK1,''), REMARK1='' ,EMP_NM=?,EMP_ORG_ID=?, EMP_ORG_NM=? where TXN_RUN_NBR=? ";
						
						PreparedStatement pstmt = null;
						pstmt = conn.prepareStatement(sqlUpd);
						pstmt.setString(1, dt);
						pstmt.setString(2, dts);
						pstmt.setString(3, user_id);
						pstmt.setString(4, user_name);
						pstmt.setString(5, usr_org_id);
						pstmt.setString(6, usr_org_nm);
						pstmt.setString(7, runNbr);
						pstmt.executeUpdate();
						rrequest.getWResponse().getMessageCollector().success("提交成功！", false);// 向前台提示一条信息，这里还可以终止后续处理
						rrequest.authorize("dtl", Consts.BUTTON_PART, "type{save}", "disabled", "true");
						rrequest.authorize("dtl", Consts.BUTTON_PART, "sub", "disabled", "true");
						rrequest.setAttribute("dtl_ACCESSMODE", "readonly");
						
						/*
						if((inratio-ro)>0 && (inratio-ro)<inratio){
							String sqlIns="insert into IBS.GOLD_EMP_RELA(TXN_RUN_NBR,VUCH_NBR,EMP_ID,RATIO,CLAIM_STATUS_ID,CLAIM_DT,VERIFY_DT,VERIFY_EMP_ID,REMARK,REMARK1,ORG_ID,ORG_NM,CST_NM,IDENTN_NO,BIZ_TYPE_NM,VUCH_STATUS_NM,TXN_DT,EMP_NM,EMP_ORG_ID,EMP_ORG_NM,MARKETING_NO,TXN_AMT,PRD_NUM,PRD_CD,PRD_NM,MID_INC) " +
									"select TXN_RUN_NBR,VUCH_NBR,'000000','0','7',CLAIM_DT,VERIFY_DT,VERIFY_EMP_ID,REMARK,REMARK1,ORG_ID,ORG_NM,CST_NM,IDENTN_NO,BIZ_TYPE_NM,VUCH_STATUS_NM,TXN_DT,'','','',MARKETING_NO,TXN_AMT,PRD_NUM,PRD_CD,PRD_NM,MID_INC " +
									"from IBS.GOLD_EMP_RELA where TXN_RUN_NBR=? and EMP_ID=? and TXN_DT=?";
							
							PreparedStatement pstmt1 = null;
							pstmt1 = conn.prepareStatement(sqlIns);
							pstmt1.setString(1, scurt_ac);
							pstmt1.setString(2, old_emp_id);
							pstmt1.setString(3, txn_dt);
							pstmt1.executeUpdate();
							
							pstmt1.close();
						}
						*/
						//pstmt0.close();
						pstmt.close();
						//rs.close();
						return "提交成功！";
					//}
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
