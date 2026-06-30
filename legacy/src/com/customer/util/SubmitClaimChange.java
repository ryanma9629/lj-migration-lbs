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

/*存款业绩认领提交按钮方法*/
public class SubmitClaimChange implements IServerAction {
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
		
		//String vuch_nbr = rrequest.getStringAttribute("txtvuch", "");// 取出凭证号
		String vuch_nbr = (String) rrequest.getRequest().getSession().getAttribute("vuch_nbr");
		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		String user_nm = (String) rrequest.getRequest().getSession().getAttribute("user_name");
		String org_lev_id = (String) rrequest.getRequest().getSession().getAttribute("org_lev_id");
		Double ratio = 0.0;

		Date date = new Date();
		/* dt认领时间 CLAIM_DT */
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
		String dt = dateformat.format(date);

		/* dts认领时间戳，用于填写在备注时间上 */
		SimpleDateFormat dateformat1 = new SimpleDateFormat("yyyy-MM-dd-HH.mm.ss");// 认领时间戳，用于填写在备注时间上
		String dts = dateformat1.format(date);
        /*
		for (Map<String, String> mParams : lstData) {

			for (Entry<String, String> entryTmp : mParams.entrySet()) {
				if (entryTmp.getKey().equals("ratio")) {
					ratio = Double.valueOf(entryTmp.getValue());
				}
				
			}
			System.out.println("RATIO="+ratio.toString());
		}
		*/
		try {
			
			double inratio = 0;
			double ro = 0;
			
				System.out.println("vuch_nbr="+vuch_nbr);
				
				Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
				
				String sqlValRO = "select COALESCE(SUM(CASE WHEN EMP_ID=? and coalesce(RVS_STATUS_ID,'')='0' THEN RVS_RATIO ELSE 0 END ),0) AS ro" +
						",100-sum(case when coalesce(RVS_STATUS_ID,'') in ('1','2','21') then coalesce(RVS_RATIO,0) when CLAIM_STATUS_ID in ('1','2','5','6') and coalesce(RVS_STATUS_ID,'') <>'0' then coalesce(RATIO,0) else 0 end) as inratio " +
				"from IBS.T1_VUCH_EMP_RELA where VUCH_NBR=? " 
				+ " and CLAIM_STATUS_ID in ('1','2','5','6','0')";
				
				System.out.println("sqlValRO="+sqlValRO);
				
				PreparedStatement pstmtValRO = null;
				pstmtValRO = conn.prepareStatement(sqlValRO);
				pstmtValRO.setString(1, user_id);
				pstmtValRO.setString(2, vuch_nbr);
				ResultSet rsValRO = pstmtValRO.executeQuery();
				
				rsValRO.next();
				
				inratio = rsValRO.getDouble("inratio");
				System.out.println("剩余可以认领的比例inratio=" + inratio);
				ro = rsValRO.getDouble("ro");
				System.out.println("已认领比例ro=" + ro);
			
			
			
			
			if (ro > inratio || inratio<=0) {
				rrequest.getWResponse().getMessageCollector().error("提交前请核对认领比例！请调整认领比例后，再试。", "", false);
				rsValRO.close();
				pstmtValRO.close();
				conn.close();
				return "提交失败！";
			}
			else{
				String verEmpId ="";
				String verEmpNm ="";
				
				String veredEmpId ="";
				String veredEmpNm ="";
				
				Connection conn1 = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
				
				//获取初审人:支行认领人
				if(org_lev_id.equals("1")){
					PreparedStatement pstmtVer1 = null;
					String sqlVer1 = "select p.GROUP_ID,p.USER_ID,p.EMP_NM,p.ORG_ID,vu.ORG_LEVEL_ID,vu.BIZ_TYPE_NM " +
					"from (select re.ORG_ID as ORG_ID_VU,cog.BRANCH_ORG_ID as BRANCH_ORG_ID_VU, re.EMP_ID,emp.ORG_ID,emp.BRANCH_ORG_ID,pog.ORG_LEVEL_ID,bt.BIZ_TYPE_NM " +
					"from IBS.T1_VUCH_EMP_RELA re " +
					"inner join ibs.T5_EMP emp on emp.EMP_ID=re.EMP_ID " +
					"inner join IBS.T5_ORG pog on pog.ORG_ID=emp.ORG_ID and pog.ORG_TYPE_ID='EO' " +
					"inner join IBS.T5_ORG cog on cog.ORG_ID=re.ORG_ID and cog.ORG_TYPE_ID='AO' " +
					"inner join IBS.T9_BIZ_TYPE bt on bt.BIZ_TYPE_NM=re.BIZ_TYPE_NM " +
					"where re.VUCH_NBR=? " +
					"and re.EMP_ID=? " +
					")vu  " +
					"inner join" +
					"(select gp.GROUP_ID,gp.USER_ID,uem.EMP_NM,uem.ORG_ID " +
					"from cst.SYS_C_SEC_USER_GROUP gp " +
					"inner join ibs.T5_EMP uem on uem.EMP_ID=gp.USER_ID " +
					"where gp.GROUP_ID ='president_060'" +
					")p on p.ORG_ID=vu.ORG_ID_VU " +
					"order by p.USER_ID";
					System.out.println("sqlVer1="+sqlVer1);
					pstmtVer1 = conn1.prepareStatement(sqlVer1);
					pstmtVer1.setString(1, vuch_nbr );
					pstmtVer1.setString(2, user_id);
					ResultSet rsVer1 = pstmtVer1.executeQuery();
					
					while(rsVer1.next()){
						verEmpId = rsVer1.getString("USER_ID");
						verEmpNm = rsVer1.getString("EMP_NM");
					}

					rsVer1.close();
					pstmtVer1.close();
					
					
					
					//获取终审人:支行认领人,终审到分行总经理
				 
					String sqlVed1 = "select p.GROUP_ID,p.USER_ID,p.EMP_NM,p.ORG_ID,vu.ORG_LEVEL_ID,vu.BIZ_TYPE_NM " +
							"from (select re.ORG_ID as ORG_ID_VU,cog.BRANCH_ORG_ID as BRANCH_ORG_ID_VU,cog.HEAD_ORG_ID as HEAD_ORG_ID_VU,re.EMP_ID,emp.ORG_ID,emp.BRANCH_ORG_ID,pog.ORG_LEVEL_ID,bt.BIZ_TYPE_NM " +
							"from IBS.T1_VUCH_EMP_RELA re " +
							"inner join ibs.T5_EMP emp on emp.EMP_ID=re.EMP_ID " +
							"inner join IBS.T5_ORG pog on pog.ORG_ID=emp.ORG_ID and pog.ORG_TYPE_ID='EO' " +
							"inner join IBS.T5_ORG cog on cog.ORG_ID=re.ORG_ID and cog.ORG_TYPE_ID='AO' " +
							"inner join IBS.T9_BIZ_TYPE bt on bt.BIZ_TYPE_NM=re.BIZ_TYPE_NM " +
							"where re.VUCH_NBR=? and re.EMP_ID=? " +
							")vu " +
							"inner join(select gp.GROUP_ID,gp.USER_ID,uem.EMP_NM,uem.ORG_ID, BIZ_TYP " +
							"from cst.SYS_C_SEC_USER_GROUP gp " +
							"inner join ibs.T9_SP_GROUPID gve on gve.GROUP_ID=gp.GROUP_ID and gve.IS_FS='1' and gve.IS_CS='1'" +
							"inner join ibs.T5_EMP uem on uem.EMP_ID=gp.USER_ID " +
							")p on p.ORG_ID=vu.BRANCH_ORG_ID_VU and p.BIZ_TYP=vu.BIZ_TYPE_NM " +
							"order by p.USER_ID ";
					System.out.println("sqlVed1="+sqlVed1);
					PreparedStatement pstmtVed1 = conn1.prepareStatement(sqlVed1);
					pstmtVed1.setString(1, vuch_nbr);
					pstmtVed1.setString(2, user_id);
					ResultSet rsVed1 = pstmtVed1.executeQuery();
					while(rsVed1.next()){
						veredEmpId = rsVed1.getString("USER_ID");
						veredEmpNm = rsVed1.getString("EMP_NM");
					}
					

					rsVed1.close();
					pstmtVed1.close();
					
					conn1.close();
					
				}else if(org_lev_id.equals("2")){////获取初审人:分行认领人
					PreparedStatement pstmtVer2 = null;
					String sqlVer2 = "select p.GROUP_ID,p.USER_ID,p.EMP_NM,p.ORG_ID,vu.ORG_LEVEL_ID,vu.BIZ_TYPE_NM " +
							"from (select re.ORG_ID as ORG_ID_VU,cog.BRANCH_ORG_ID as BRANCH_ORG_ID_VU,cog.HEAD_ORG_ID as HEAD_ORG_ID_VU,re.EMP_ID,emp.ORG_ID,emp.BRANCH_ORG_ID,pog.ORG_LEVEL_ID,bt.BIZ_TYPE_NM " +
							"from IBS.T1_VUCH_EMP_RELA re " +
							"inner join ibs.T5_EMP emp on emp.EMP_ID=re.EMP_ID " +
							"inner join IBS.T5_ORG pog on pog.ORG_ID=emp.ORG_ID and pog.ORG_TYPE_ID='EO' " +
							"inner join IBS.T5_ORG cog on cog.ORG_ID=re.ORG_ID and cog.ORG_TYPE_ID='AO' " +
							"inner join IBS.T9_BIZ_TYPE bt on bt.BIZ_TYPE_NM=re.BIZ_TYPE_NM " +
							"where re.VUCH_NBR=? and re.EMP_ID=? " +
							")vu " +
							"inner join(select gp.GROUP_ID,gp.USER_ID,uem.EMP_NM,uem.ORG_ID, BIZ_TYP " +
							"from cst.SYS_C_SEC_USER_GROUP gp " +
							"inner join ibs.T9_SP_GROUPID gve on gve.GROUP_ID=gp.GROUP_ID and gve.IS_CS='1' " +
							"inner join ibs.T5_EMP uem on uem.EMP_ID=gp.USER_ID " +
							")p on p.ORG_ID=vu.BRANCH_ORG_ID_VU and p.BIZ_TYP=vu.BIZ_TYPE_NM " +
							"order by p.USER_ID ";
					pstmtVer2 = conn1.prepareStatement(sqlVer2);
					pstmtVer2.setString(1, vuch_nbr);
					pstmtVer2.setString(2, user_id);
					ResultSet rsVer2 = pstmtVer2.executeQuery();
					while(rsVer2.next()){
						verEmpId = rsVer2.getString("USER_ID");
						verEmpNm = rsVer2.getString("EMP_NM");
						
					}
					
					rsVer2.close();
					pstmtVer2.close();
					
					//获取终审人:分行认领人,终审到分行行长
					PreparedStatement pstmtVed2 = null;
					String sqlVed2 = "select p.GROUP_ID,p.USER_ID,p.EMP_NM,p.ORG_ID,vu.ORG_LEVEL_ID,vu.BIZ_TYPE_NM " +
							"from (select re.ORG_ID as ORG_ID_VU,cog.BRANCH_ORG_ID as BRANCH_ORG_ID_VU,cog.HEAD_ORG_ID as HEAD_ORG_ID_VU,re.EMP_ID,emp.ORG_ID,emp.BRANCH_ORG_ID,pog.ORG_LEVEL_ID,bt.BIZ_TYPE_NM " +
							"from IBS.T1_VUCH_EMP_RELA re " +
							"inner join ibs.T5_EMP emp on emp.EMP_ID=re.EMP_ID " +
							"inner join IBS.T5_ORG pog on pog.ORG_ID=emp.ORG_ID and pog.ORG_TYPE_ID='EO' " +
							"inner join IBS.T5_ORG cog on cog.ORG_ID=re.ORG_ID and cog.ORG_TYPE_ID='AO' " +
							"inner join IBS.T9_BIZ_TYPE bt on bt.BIZ_TYPE_NM=re.BIZ_TYPE_NM " +
							"where re.VUCH_NBR=? and re.EMP_ID=? " +
							")vu " +
							"inner join(select gp.GROUP_ID,gp.USER_ID,uem.EMP_NM,uem.ORG_ID, BIZ_TYP " +
							"from cst.SYS_C_SEC_USER_GROUP gp " +
							"inner join ibs.T9_SP_GROUPID gve on gve.GROUP_ID=gp.GROUP_ID and gve.IS_FS='1' and gve.IS_CS<>'1'" +
							"inner join ibs.T5_EMP uem on uem.EMP_ID=gp.USER_ID " +
							")p on p.ORG_ID=vu.BRANCH_ORG_ID_VU and p.BIZ_TYP=vu.BIZ_TYPE_NM " +
							"order by p.USER_ID ";
					pstmtVed2 = conn1.prepareStatement(sqlVed2);
					pstmtVed2.setString(1, vuch_nbr);
					pstmtVed2.setString(2, user_id);
					ResultSet rsVed2 = pstmtVed2.executeQuery();
					
					while(rsVed2.next()){
						veredEmpId = rsVed2.getString("USER_ID");
						veredEmpNm = rsVed2.getString("EMP_NM");
					}
					
					rsVed2.close();
					pstmtVed2.close();
					
					conn1.close();
				}else if(org_lev_id.equals("3")){////获取初审人:总行认领人
					PreparedStatement pstmtVer3 = null;
					String sqlVer3 = "select p.GROUP_ID,p.USER_ID,p.EMP_NM,p.ORG_ID,vu.ORG_LEVEL_ID,vu.BIZ_TYPE_NM " +
							"from (select re.ORG_ID as ORG_ID_VU,cog.BRANCH_ORG_ID as BRANCH_ORG_ID_VU,cog.HEAD_ORG_ID as HEAD_ORG_ID_VU,re.EMP_ID,emp.ORG_ID,emp.BRANCH_ORG_ID,pog.ORG_LEVEL_ID,bt.BIZ_TYPE_NM " +
							"from IBS.T1_VUCH_EMP_RELA re " +
							"inner join ibs.T5_EMP emp on emp.EMP_ID=re.EMP_ID " +
							"inner join IBS.T5_ORG pog on pog.ORG_ID=emp.ORG_ID and pog.ORG_TYPE_ID='EO' " +
							"inner join IBS.T5_ORG cog on cog.ORG_ID=re.ORG_ID and cog.ORG_TYPE_ID='AO' " +
							"inner join IBS.T9_BIZ_TYPE bt on bt.BIZ_TYPE_NM=re.BIZ_TYPE_NM " +
							"where re.VUCH_NBR=? and re.EMP_ID=? " +
							")vu " +
							"inner join(select gp.GROUP_ID,gp.USER_ID,uem.EMP_NM,uem.ORG_ID, BIZ_TYP " +
							"from cst.SYS_C_SEC_USER_GROUP gp " +
							"inner join ibs.T9_SP_GROUPID gve on gve.GROUP_ID=gp.GROUP_ID and gve.IS_CS='1' " +
							"inner join ibs.T5_EMP uem on uem.EMP_ID=gp.USER_ID " +
							")p on p.ORG_ID=vu.HEAD_ORG_ID_VU and p.BIZ_TYP=vu.BIZ_TYPE_NM " +
							"order by p.USER_ID ";
					pstmtVer3 = conn1.prepareStatement(sqlVer3);
					pstmtVer3.setString(1, vuch_nbr);
					pstmtVer3.setString(2, user_id);
					ResultSet rsVer3 = pstmtVer3.executeQuery();
					while(rsVer3.next()){
						verEmpId = rsVer3.getString("USER_ID");
						verEmpNm = rsVer3.getString("EMP_NM");
					}
					
					
					rsVer3.close();
					pstmtVer3.close();
					
					//获取终审人:总行认领人,终审到总行部门总经理
					PreparedStatement pstmtVed3 = null;
					String sqlVed3 = "select p.GROUP_ID,p.USER_ID,p.EMP_NM,p.ORG_ID,vu.ORG_LEVEL_ID,vu.BIZ_TYPE_NM " +
							"from (select re.ORG_ID as ORG_ID_VU,cog.BRANCH_ORG_ID as BRANCH_ORG_ID_VU,cog.HEAD_ORG_ID as HEAD_ORG_ID_VU,re.EMP_ID,emp.ORG_ID,emp.BRANCH_ORG_ID,pog.ORG_LEVEL_ID,bt.BIZ_TYPE_NM " +
							"from IBS.T1_VUCH_EMP_RELA re " +
							"inner join ibs.T5_EMP emp on emp.EMP_ID=re.EMP_ID " +
							"inner join IBS.T5_ORG pog on pog.ORG_ID=emp.ORG_ID and pog.ORG_TYPE_ID='EO' " +
							"inner join IBS.T5_ORG cog on cog.ORG_ID=re.ORG_ID and cog.ORG_TYPE_ID='AO' " +
							"inner join IBS.T9_BIZ_TYPE bt on bt.BIZ_TYPE_NM=re.BIZ_TYPE_NM " +
							"where re.VUCH_NBR=? and re.EMP_ID=? " +
							")vu " +
							"inner join(select gp.GROUP_ID,gp.USER_ID,uem.EMP_NM,uem.ORG_ID, BIZ_TYP " +
							"from cst.SYS_C_SEC_USER_GROUP gp " +
							"inner join ibs.T9_SP_GROUPID gve on gve.GROUP_ID=gp.GROUP_ID and gve.IS_FS='1' and gve.IS_CS<>'1'" +
							"inner join ibs.T5_EMP uem on uem.EMP_ID=gp.USER_ID " +
							")p on p.ORG_ID=vu.HEAD_ORG_ID_VU and p.BIZ_TYP=vu.BIZ_TYPE_NM " +
							"order by p.USER_ID ";
					pstmtVed3 = conn1.prepareStatement(sqlVed3);
					pstmtVed3.setString(1, vuch_nbr);
					pstmtVed3.setString(2, user_id);
					ResultSet rsVed3 = pstmtVed3.executeQuery();
					while(rsVed3.next()){
						veredEmpId = rsVed3.getString("USER_ID");
						veredEmpNm = rsVed3.getString("EMP_NM");
					}
					
					rsVed3.close();
					pstmtVed3.close();
					
					conn1.close();
				}
				String sql1="";
				sql1 = "update IBS.T1_VUCH_EMP_RELA set RVS_STATUS_ID='1', RVS_DT=?,RVS_CLAIM_EMP_ID=?,RVS_CLAIM_EMP_NM=? " +
				"where RVS_STATUS_ID='0' and EMP_ID=? and VUCH_NBR=?";
				
				String sql2="";
				sql2 = "update IBS.T6_VUCH_EMP_RELA_CHANGE_LOG set NEW_CLAIM_STATUS_ID='1', NEW_CLAIM_DT=? ,NEW_VERIFY_EMP_ID=?,NEW_VERIFY_EMP_NM=?,NEW_FIN_VERIFY_EMP_ID=?,NEW_FIN_VERIFY_EMP_NM=? " +
				"where NEW_CLAIM_STATUS_ID='0' and NEW_EMP_ID=? and VUCH_NBR=? and CHANGE_FLAG='0' ";
				
				PreparedStatement pstmt = null;
				pstmt = conn.prepareStatement(sql1);
				pstmt.setString(1, dt);
				pstmt.setString(2, verEmpId);
				pstmt.setString(3, verEmpNm);
				pstmt.setString(4, user_id);
				pstmt.setString(5, vuch_nbr);
				pstmt.executeUpdate();
				
				PreparedStatement pstmt2 = null;
				pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setString(1, dt);
				pstmt2.setString(2, verEmpId);
				pstmt2.setString(3, verEmpNm);
				pstmt2.setString(4, veredEmpId);
				pstmt2.setString(5, veredEmpNm);
				pstmt2.setString(6, user_id);
				pstmt2.setString(7, vuch_nbr);
				pstmt2.executeUpdate();
				
				System.out.println("点击提交按钮将刷新RVS_STATUS_ID='1-调整待审'");
				rrequest.getWResponse().getMessageCollector().success("提交成功！", false);// 向前台提示一条信息，这里还可以终止后续处理
				rrequest.authorize("dtl", Consts.BUTTON_PART, "type{save}", "disabled", "true");
				rrequest.authorize("dtl", Consts.BUTTON_PART, "type{delete}", "disabled", "true");
				rrequest.authorize("dtl", Consts.BUTTON_PART, "sub", "disabled", "true");
				rrequest.setAttribute("dtl_ACCESSMODE", "readonly");
				
				pstmt.close();
				pstmt2.close();
				conn.close();
				return "提交成功！";
			}
		
			
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		return "提交失败！";
	}

}
