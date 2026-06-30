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

/*贷款业绩认领提交按钮方法*/
public class SubmitClaimLn implements IServerAction {
	/**
	 * 与框架无关的ajax调用
	 */
	@Override
	public String executeServerAction(HttpServletRequest request, HttpServletResponse response, List<Map<String, String>> lstData) {

		System.out.println("executeServerAction(HttpServletRequest request,HttpServletResponse response,List<Map<String,String>> lstData)方法...");
		return null;
	}

	/**
	 * 针对组件通过ajax调用服务器端方法
	 */
	@Override
	public String executeSeverAction(ReportRequest rrequest, IComponentConfigBean ccbean, List<Map<String, String>> lstData,
			Map<String, String> mCustomizedData) {
		System.out.println("调用executeSeverAction(ReportRequest rrequest,IComponentConfigBean ccbean,List<Map<String,String>> lstData)方法...");
		// printLstParams(lstData);//打印客户端传过来的参数
		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		String vuch_nbr = rrequest.getStringAttribute("VUCH_NBR", "");// 取出借据号
		String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");

		Date date = new Date();
		/* dt认领时间 CLAIM_DT */
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
		String dt = dateformat.format(date);

		/* dts认领时间戳，用于填写在备注时间上 */

		SimpleDateFormat dateformat1 = new SimpleDateFormat("yyyy-MM-dd-HH.mm.ss");// 认领时间戳，用于填写在备注时间上
		String dts = dateformat1.format(date);

		//System.out.println("user_id=" + user_id +";usr_org_id="+usr_org_id+ ";vuch_nbr=" + vuch_nbr + ";dt=" + dt + ";dts=" + dts);

		Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置

		try {
			
			String sqlBrch="";
			sqlBrch="select trim(og.ORG_LEVEL_ID) ORG_LEVEL_ID,re.BIZ_TYPE_NM " +
			"from(select ORG_LEVEL_ID from ibs.T5_ORG where ORG_TYPE_ID='EO' and ORG_ID=? ) og " +
			"left join (select distinct trim(BIZ_TYPE_NM) as BIZ_TYPE_NM from IBS.T1_VUCH_EMP_RELA where VUCH_NBR=? )re " +
			"on 1=1 ";
			PreparedStatement pstmtBrch = null;
			pstmtBrch = conn.prepareStatement(sqlBrch);
			pstmtBrch.setString(1, usr_org_id);
			pstmtBrch.setString(2, vuch_nbr);
			ResultSet rsBrch = pstmtBrch.executeQuery();
			rsBrch.next();
			
			System.out.println("用户号："+user_id+"用户机构："+usr_org_id+"机构级别："+rsBrch.getString("ORG_LEVEL_ID")+"凭证类型："+rsBrch.getString("BIZ_TYPE_NM"));
			
			//分行用户认领对公存款 分行用户且为公司贷款
			if(user_id.equals(usr_org_id) && (rsBrch.getString("ORG_LEVEL_ID")).equals("2") && rsBrch.getString("BIZ_TYPE_NM").equals("公司贷款")){
				String sqlValRO = "SELECT COALESCE(SUM(CASE WHEN EMP_ID=? THEN ratio ELSE 0 END ),0) AS ro, 100-COALESCE(SUM(CASE WHEN EMP_ID<>?  and CLAIM_STATUS_ID in ('1','2','5','6') THEN ratio ELSE 0 END),0) AS inratio FROM IBS.T1_VUCH_EMP_RELA r inner join ibs.T5_ORG og on og.ORG_ID=r.EMP_ID and og.ORG_LEVEL_ID='2' and og.ORG_TYPE_ID='EO' WHERE VUCH_NBR=?";
				
				PreparedStatement pstmtValRO = null;
				pstmtValRO = conn.prepareStatement(sqlValRO);
				pstmtValRO.setString(1, user_id);
				pstmtValRO.setString(2, user_id);
				pstmtValRO.setString(3, vuch_nbr);
				ResultSet rsValRO = pstmtValRO.executeQuery();
				
				rsValRO.next();
				
				int inratio = rsValRO.getInt("inratio");
				double ro = rsValRO.getDouble("ro");
				
				System.out.println("剩余可以认领的比例inratio============" + inratio);
				System.out.println("已认领比例ro============" + ro);
				
				if (ro > inratio || inratio==0) {
					rrequest.getWResponse().getMessageCollector().error("提交前请核对认领比例！请调整认领比例后，再试。", "", false);
					rsValRO.close();
					pstmtValRO.close();
					rsBrch.close();
					pstmtBrch.close();
					conn.close();
					return "提交失败！";
				}else{
					String sql1="";
					sql1 = "update IBS.T1_VUCH_EMP_RELA set CLAIM_STATUS_ID='2', CLAIM_DT=?,VERIFY_DT='"+dt+"',VERIFY_EMP_ID='无需审批', REMARK=CONCAT('认领时间',?,'认领工号',?,'认领理由',COALESCE(REMARK1,'')), REMARK1=''  where VUCH_NBR=? and EMP_ID=? and coalesce(CLAIM_STATUS_ID,'0')='0' ";
					
					PreparedStatement pstmt = null;
					pstmt = conn.prepareStatement(sql1);
					pstmt.setString(1, dt);
					pstmt.setString(2, dts);
					pstmt.setString(3, user_id);
					pstmt.setString(4, vuch_nbr);
					pstmt.setString(5, user_id);
					pstmt.executeUpdate();
					
					rrequest.getWResponse().getMessageCollector().success("提交成功！", false);
					rrequest.authorize("dtl", Consts.BUTTON_PART, "type{save}", "disabled", "true");
					rrequest.authorize("dtl", Consts.BUTTON_PART, "sub", "disabled", "true");
					rrequest.setAttribute("dtl_ACCESSMODE", "readonly");
					
					rsValRO.close();
					pstmtValRO.close();
					pstmt.close();
					rsBrch.close();
					pstmtBrch.close();
					conn.close();
					return "提交成功！";
				}
				//支用户认领对公存款 支行用户且为对公存款
			}else if(user_id.equals(usr_org_id) && (rsBrch.getString("ORG_LEVEL_ID")).equals("1") && rsBrch.getString("BIZ_TYPE_NM").equals("公司贷款")){
				rrequest.getWResponse().getMessageCollector().error("支行用户不能认领对公业务！", "", false);
				rsBrch.close();
				pstmtBrch.close();
				rsBrch.close();
				pstmtBrch.close();
				conn.close();
				return "提交失败！";
			}else{
				// 提交按钮补充校验判断凭证认领剩余比例
				String sqlvalidate = "select sum(ro) ro,sum(inratio) inratio " +
				"from(" +
				"SELECT COALESCE(SUM(CASE WHEN EMP_ID=? THEN ratio ELSE 0 END ),0) AS ro, 100-COALESCE(SUM(CASE WHEN EMP_ID<>?  and CLAIM_STATUS_ID in ('1','2','5','6') THEN ratio ELSE 0 END),0) AS inratio FROM IBS.T1_VUCH_EMP_RELA WHERE VUCH_NBR=? " +
				"union all " +
				"select 0 as ro, ratio as inratio FROM IBS.T1_VUCH_EMP_RELA r inner join ibs.T5_ORG og on og.ORG_ID=r.EMP_ID and og.ORG_LEVEL_ID='2' and og.ORG_TYPE_ID='EO' where r.VUCH_NBR=? and CLAIM_STATUS_ID in ('1','2','5','6') and BIZ_TYPE_NM='公司贷款'" +
				")";
				
				//sqlvalidate = "SELECT COALESCE(SUM(CASE WHEN EMP_ID=? THEN ratio ELSE 0 END ),0) AS ro, 100-COALESCE(SUM(CASE WHEN EMP_ID<>?  and CLAIM_STATUS_ID in ('1','2','5','6') THEN ratio ELSE 0 END),0) AS inratio FROM IBS.T1_VUCH_EMP_RELA WHERE VUCH_NBR=?";
				PreparedStatement pstmt0 = null;
				pstmt0 = conn.prepareStatement(sqlvalidate);
				pstmt0.setString(1, user_id);
				pstmt0.setString(2, user_id);
				pstmt0.setString(3, vuch_nbr);
				pstmt0.setString(4, vuch_nbr);
				ResultSet rs = pstmt0.executeQuery();
				
				rs.next();
				
				double inratio = rs.getDouble("inratio");
				double ro = rs.getDouble("ro");
				
				System.out.println("剩余可以认领的比例inratio============" + inratio);
				System.out.println("页面输入的认领比例ro============" + ro);
				
				if (ro > inratio || inratio==0) {
					pstmt0.close();
					rs.close();
					rrequest.getWResponse().getMessageCollector().error("提交前请核对认领比例！请调整认领比例后，再试。", "", false);
					return "提交失败！";
				} else {
					
					// 贷款业绩填写完成后，点击提交按钮将刷新CLAIM_STATUS_ID="1-待审核"
					// 【认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）】，并填写提交时间
					String sql1 = "";
					
					sql1 = "update IBS.T1_VUCH_EMP_RELA set CLAIM_STATUS_ID='1', CLAIM_DT=?, REMARK=CONCAT('认领时间',?,'认领工号',?,'认领理由',COALESCE(REMARK1,'')), REMARK1=''  where VUCH_NBR=? and EMP_ID=? and coalesce(CLAIM_STATUS_ID,'0')='0' ";
					
					String sql2 = "Update IBS.T1_LN_LOBBY_MANAGER_RELA Set CLAIM_DT=? where BIZ_DIL_NBR=? AND MANAGER_EMP_ID=?";
					
					PreparedStatement pstmt = null;
					PreparedStatement pstmt1 = null;
					
					pstmt = conn.prepareStatement(sql1);
					pstmt.setString(1, dt);
					pstmt.setString(2, dts);
					pstmt.setString(3, user_id);
					pstmt.setString(4, vuch_nbr);
					pstmt.setString(5, user_id);
					pstmt.executeUpdate();
				    //System.out.println("======step1: 点击提交按钮将IBS.T1_VUCH_EMP_RELA刷新CLAIM_STATUS_ID='1-待审核'==============");
					
					pstmt1 = conn.prepareStatement(sql2);
					pstmt1.setString(1, dt);
					pstmt1.setString(2, vuch_nbr);
					pstmt1.setString(3, user_id);
					pstmt1.executeUpdate();
					//System.out.println("======step2: 点击提交按钮将IBS.T1_LN_LOBBY_MANAGER_RELA刷新CLAIM_DT为提交的统一时间============");
					
					rrequest.getWResponse().getMessageCollector().success("提交成功！", false);// 向前台提示一条信息，这里还可以终止后续处理
					rrequest.authorize("dtl", Consts.BUTTON_PART, "type{save}", "disabled", "true");
					rrequest.authorize("dtl", Consts.BUTTON_PART, "sub", "disabled", "true");
					rrequest.setAttribute("dtl_ACCESSMODE", "readonly");
					pstmt0.close();
					pstmt.close();
					pstmt1.close();
					// conn.close();
					return "提交成功！";
				
				}
			
			}
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

}
