package com.customer.security;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.servlet.http.HttpServletRequest;

import com.customer.util.Time;
import com.ljbank.market.Util;
import com.wabacus.config.Config;
import com.wabacus.util.DesEncryptTools;

public class Login {
	@SuppressWarnings("static-access")
	public String checkPrivilege(String user_id, String password, HttpServletRequest request, HttpServletResponse response) throws SQLException {
		HttpSession session = request.getSession();
		String isLegal = "passErr";
		//第一步，取出客户相关信息 增加ip地址作为记录
		Connection conn = Config.getInstance().getDataSource("").getConnection();
		//String sql = "SELECT a.user_id, a.user_name, a.org_id as usr_org_id, b.org_nm as usr_org_nm, a.is_enable, a.password, a.is_enable, b.org_id, b.branch_org_id,b.BRANCH_ORG_NM,og.HEAD_ORG_ID,og.ORG_LEVEL_ID FROM cst.sys_c_sec_user a left join ibs.t5_emp b on a.user_id=b.emp_id left join IBS.T5_ORG og on og.ORG_ID=a.org_id and og.ORG_TYPE_ID='EO' WHERE user_id=? AND password=?";
		String sql = "SELECT a.user_id, a.user_name, a.org_id as usr_org_id, b.org_nm as usr_org_nm, a.is_enable, a.password, a.is_enable, b.org_id, b.branch_org_id,b.BRANCH_ORG_NM,og.HEAD_ORG_ID,og.ORG_LEVEL_ID FROM cst.sys_c_sec_user a left join ibs.t5_emp b on a.user_id=b.emp_id left join IBS.T5_ORG og on og.ORG_ID=a.org_id and og.ORG_TYPE_ID='EO' WHERE user_id=? ";
		
		PreparedStatement pstmt = null;
		
		//ResultSet rsRel = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			//pstmt.setString(2, DesEncryptTools.encrypt(password));
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String user_name = rs.getString("user_name").trim();
				String usr_org_nm = rs.getString("usr_org_nm").trim();
				// String group_id = rs.getString("group_id");
				String usr_org_id = rs.getString("usr_org_id").trim();
				String org_id = rs.getString("org_id").trim();
				String branch_id = rs.getString("branch_org_id").trim();
				String branch_idNm = rs.getString("BRANCH_ORG_NM").trim();
				String head_id = rs.getString("HEAD_ORG_ID").trim();
				String org_lev_id=rs.getString("ORG_LEVEL_ID").trim();
				System.out.println("user_name="+user_name+";org_id=" + org_id + ";branch_id="+branch_id+";branch_idNm="+branch_idNm+";head_id="+head_id+";org_lev_id="+org_lev_id);

				if ("Y".equals(rs.getString("is_enable"))) {
					
					session.setAttribute("org_id", org_id);
					session.setAttribute("user_name", user_name);
					session.setAttribute("user_id", user_id);
					session.setAttribute("branch_id", branch_id);
					session.setAttribute("usr_org_nm", usr_org_nm);
					session.setAttribute("usr_org_id", usr_org_id);
					session.setAttribute("usr_head_id", head_id);
					session.setAttribute("branch_idNm", branch_idNm);
					session.setAttribute("org_lev_id", org_lev_id);
					// session.setAttribute("group_id", group_id);
					//System.out.println(session.getAttribute("org_id"));

					// 增加IP
					Util u = new Util();
					String ip = u.getRemoteIP(request);
					session.setAttribute("ip", ip);
					
					//isLegal = true;
					isLegal = "passOK";
					
					
					//如果是季末，判断认领关系是否完成
					Time tt = new Time();
					String curday = tt.getNowTime("yyyy-MM-dd");
					String curYear = tt.getStringYear();
					session.setAttribute("curDay", curday);
					session.setAttribute("curYear", curYear);
					
					//System.out.println("当日日期："+curday);
					//System.out.println("当前季度季末:" + tt.getCurSeasonTime());
					//System.out.println("获取两个日期之间间隔天数" + tt.getTwoDay(curday,tt.getCurSeasonTime()));
					
					
					String dys = tt.getTwoDay(curday,tt.getCurSeasonTime());
					if(dys.equals("1")){
						String sql_rel = "select count(1) as cnt from IBS.T99_EMP_RELA_Q_SWITCH where MEASURE_DT=?";
						PreparedStatement pstmtRel = null;
						pstmtRel = conn.prepareStatement(sql_rel);
						pstmtRel.setString(1, curday);
						ResultSet rsRel = pstmtRel.executeQuery();
						
						while(rsRel.next()){
							int cnt = rsRel.getInt("cnt");
							if(cnt<1){
								isLegal = "relNO";
							}
						}
						rsRel.close();
						pstmtRel.close();
					}
					
					
					//取当前季度
					String sql_q = "select max(MEASURE_DT) as exam_msr_dt from ibs.T99_MIDDLE_INCOME_SWITCH ";
					PreparedStatement pstmtQ = null;
					pstmtQ = conn.prepareStatement(sql_q);
					ResultSet rsQ = pstmtQ.executeQuery();
					String exam_msr_dt = "";
					
					while(rsQ.next()){
						exam_msr_dt = rsQ.getString("exam_msr_dt");
						
					}
					if(exam_msr_dt==null || exam_msr_dt.equals("")){
						exam_msr_dt = curday;
					}
					
					session.setAttribute("exam_msr_dt", curday);
					session.setAttribute("exam_year", exam_msr_dt.substring(0, 4));
				
					if(exam_msr_dt.substring(5).equals("03-31")){
						session.setAttribute("exam_q", "01");
					}else if(exam_msr_dt.substring(5).equals("06-30")){
						session.setAttribute("exam_q", "02");
					}else if(exam_msr_dt.substring(5).equals("09-30")){
						session.setAttribute("exam_q", "03");
					}else if(exam_msr_dt.substring(5).equals("12-31")){
						session.setAttribute("exam_q", "04");
					}else{
						session.setAttribute("exam_q", "00");
					}
					
					
					//是否是考核季度
					String sql_q_exam = "select max(MEASURE_DT) as exam_msr_dt from ibs.T99_MIDDLE_INCOME_SWITCH where SWITCH_F='1'";
					PreparedStatement pstmtQExam = null;
					pstmtQExam = conn.prepareStatement(sql_q_exam);
					ResultSet rsQExam = pstmtQExam.executeQuery();
					String exam_msr_dt_exam = "";
					String isExam = "0";
					while(rsQExam.next()){
						exam_msr_dt_exam = rsQExam.getString("exam_msr_dt");
						
					}
					if(exam_msr_dt_exam==null || exam_msr_dt_exam.equals("")){
						isExam = "0";
						session.setAttribute("exam_msr_dt_exam", exam_msr_dt);
					}else{
						isExam = "1";
						session.setAttribute("exam_msr_dt_exam", exam_msr_dt_exam);
					}
					
					session.setAttribute("isExam", isExam);
					
					//System.out.println("exam_msr_dt="+exam_msr_dt.substring(5, 5)+";");
					System.out.println("isExam="+session.getAttribute("isExam")+";exam_q="+session.getAttribute("exam_q")+";exam_msr_dt="+"curday");
					
					
					//用户角色
					PreparedStatement pstmtDRol = null;
					String sqlRol = "select distinct g.GROUP_ID from cst.SYS_C_SEC_USER_GROUP g inner join  cst.SYS_C_SEC_GROP s on s.GROUP_ID=g.GROUP_ID and s.SERVICE_ID='060' where g.user_id=? " ;
					System.out.println("sqlRol="+sqlRol);
					pstmtDRol = conn.prepareStatement(sqlRol);
					pstmtDRol.setString(1, user_id);
					ResultSet rsRol = pstmtDRol.executeQuery();
					
					//int i=1;
					int j=1;
					//String rolStr="";
					String userRol="";
					while (rsRol.next()) {
						String groupId = rsRol.getString("GROUP_ID");
						if(j==1){
							userRol="'"+groupId+"'";
						}else{
							userRol=userRol+",'"+groupId+"'";
						}
						j++;
						
						/*
						if(groupId.contains("admin")){
							if(i==1){
								rolStr="'"+groupId+"'";
							}else{
								rolStr=rolStr+",'"+groupId+"'";
								
							}
							i++;
						}
						*/
						
					}
					System.out.println("userRol="+userRol);
					//System.out.println("noDownRol="+noDownRol);
					
					session.setAttribute("userRol", userRol);
					//session.setAttribute("noDownRol", noDownRol);
					
					rsRol.close();
					pstmtDRol.close();
					
					rsQ.close();
					pstmtQ.close();
					
					rsQExam.close();
					pstmtQExam.close();
					
				} else {
					isLegal = "passErr";
				}
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
		return isLegal;
	}
}
