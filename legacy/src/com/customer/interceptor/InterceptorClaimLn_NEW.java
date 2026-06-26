package com.customer.interceptor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import com.wabacus.config.Config;
import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.util.Consts;

/*贷款认领延迟加载校验页面*/
public class InterceptorClaimLn_NEW extends AbsInterceptorDefaultAdapter {

	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		String vuch_nbr = rrequest.getStringAttribute("VUCH_NBR", "");// 取出借据号
		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		String user_name = (String) rrequest.getRequest().getSession().getAttribute("user_name");
		String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
		String usr_org_nm = (String) rrequest.getRequest().getSession().getAttribute("usr_org_nm");

		Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
		System.out.println("VUCH_NBR-----" + vuch_nbr + " and  user_id----" + user_id);

		/************************ step1 判断是否输入借据号，如果不存在，则页面进行延迟加载 ***************************/
		if (vuch_nbr.equals("")) {
			rrequest.setAttribute("select_lazyload", "true");
			rrequest.setAttribute("select_lazyloadmessage", "现在是延迟读取，输入借据号后点击查询按钮才加载相应条件的数据");
			rrequest.authorize("other_dtl", null, null, "display", "false");
			rrequest.authorize("dtl", null, null, "display", "false");
		} else {
			/************************** step2 判断是否存在输入的借据号 *************************************************/
			// Connection conn =
			// Config.getInstance().getDataSource("ds_ibs").getConnection();//
			// 取DB2数据源配置
			// PreparedStatementStatement pstmt =conn.prepareStatement(sql,
			// resultSetType, resultSetConcurrency)
			// createPre(ResultSet.TYPE_SCROLL_INSENSITIVE,
			// ResultSet.CONCUR_READ_ONLY);
			System.out.println("step2 判断是否存在输入的凭证号");

			try {

				String SQL_BUTTON = "select count(1) as cnt from IBS.T1_VUCH_EMP_RELA where CLAIM_STATUS_ID IN ('1', '2', '5', '6') AND VUCH_NBR=? AND EMP_ID=? ";
				PreparedStatement pt = conn.prepareStatement(SQL_BUTTON, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
				pt = conn.prepareStatement(SQL_BUTTON);
				pt.setString(1, vuch_nbr);
				pt.setString(2, user_id);
				ResultSet resultSetSQL_BUTTON = pt.executeQuery();
				while (resultSetSQL_BUTTON.next()) {
					if (resultSetSQL_BUTTON.getInt("cnt") > 0) {
						rrequest.authorize("dtl", Consts.BUTTON_PART, "type{save}", "disabled", "true");
						rrequest.authorize("dtl", Consts.BUTTON_PART, "sub", "disabled", "true");
						rrequest.setAttribute("dtl_ACCESSMODE", "readonly");

					}
				}

				// SQL把凭证信息全部取出来为insert准备
				String SQL = "Select ORG_ID, ORG_NM, CST_NM, BIZ_TYPE_NM, VUCH_STATUS_NM, OPEN_DT, COALESCE(MARKETING_NO,'') as MARKETING_NO from IBS.T1_VUCH_DETAIL where VUCH_NBR=? and VUCH_TYPE_ID in ('21') WITH UR";

				String VUCH_ORG_ID = ""; // 获取凭证所属机构号码
				String VUCH_ORG_NM = ""; // 获取凭证所属机构名
				String VUCH_CST_NM = ""; // 获取凭证客户名
				String BIZ_TYPE_NM = ""; // 获取凭证业务类型
				String VUCH_STATUS_NM = "";// 获取凭证状态名称
				String OPEN_DT = ""; // 获取凭证开户日期
				String MARKETING_NO = ""; // 获取营销活动编号
				
				PreparedStatement pstmt = conn.prepareStatement(SQL, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
				pstmt.setString(1, vuch_nbr);
				ResultSet resultSet = pstmt.executeQuery();
				ResultSet resultSetOrg = null;
				int cnt = 0;
				resultSet.last();
				cnt = resultSet.getRow();
				System.out.println("cnt=" + cnt);
				if (resultSet.getRow() == 0) {
					rrequest.authorize("dtl", null, null, "display", "false");
					rrequest.authorize("other_dtl", null, null, "display", "false");
					rrequest.getWResponse().getMessageCollector().error("不存在输入的凭证号,请核对。不存在输入的凭证号,请核对。（由于批量原因，新开户的凭证号，请明日再试。）", "", false);
					System.out.println("结束判断输入的凭证号不存在，页面不显示。");

				} else {

					resultSet.beforeFirst();
					while (resultSet.next()) {

						VUCH_ORG_ID = resultSet.getString("ORG_ID");
						VUCH_ORG_NM = resultSet.getString("ORG_NM");
						VUCH_CST_NM = resultSet.getString("CST_NM");
						BIZ_TYPE_NM = resultSet.getString("BIZ_TYPE_NM");
						VUCH_STATUS_NM = resultSet.getString("VUCH_STATUS_NM");
						OPEN_DT = resultSet.getString("OPEN_DT");
						MARKETING_NO = resultSet.getString("MARKETING_NO");
						
						//机构用户不可以跨行认领
						
						if(user_id.equals(usr_org_id)){
							
							String sqlOrg="Select count(1) as orgCnt from IBS.T5_ORG where ORG_TYPE_ID='EO' and BRANCH_ORG_ID=? and ORG_ID=?";
							
							pstmt = conn.prepareStatement(sqlOrg);
							pstmt.setString(1, usr_org_id);
							pstmt.setString(2, VUCH_ORG_ID);
							resultSetOrg = pstmt.executeQuery();
							while (resultSetOrg.next()) {
								//支行行用户
								if(usr_org_id.equals(VUCH_ORG_ID)){
									
								}else{
									if (resultSetOrg.getInt("orgCnt")<1){
										rrequest.getWResponse().getMessageCollector().error("此凭证号的开户机构不是本机构。", "", false);
									}
								}
							}
							//resultSetOrg.close();
						}

						// SQL_Other:查询是否含有他人认领信息、查询人认领信息
						String SQL_Other = "SELECT COALESCE(SUM(CASE WHEN EMP_ID=? THEN 1 ELSE 0 END ),0) AS EMP_ID_CNT, COALESCE(SUM(CASE WHEN EMP_ID<>? THEN 1 ELSE 0 END),0) AS OTHER_EMP_ID_CNT FROM IBS.T1_VUCH_EMP_RELA WHERE VUCH_NBR=? with ur";
						pstmt = conn.prepareStatement(SQL_Other);
						pstmt.setString(1, user_id);
						pstmt.setString(2, user_id);
						pstmt.setString(3, vuch_nbr);
						ResultSet resultSetOther = pstmt.executeQuery();
						while (resultSetOther.next()) {
							if (resultSetOther.getInt("OTHER_EMP_ID_CNT") < 1) {
								// 此凭证没有他人认领信息
								rrequest.authorize("other_dtl", null, null, "display", "false");
								System.out.println("此凭证没有他人认领信息，report id='other_dtl' 页面被屏蔽，不显示");
							}

							if (resultSetOther.getInt("EMP_ID_CNT") < 1) {
								String SQL_INSERT = "INSERT INTO IBS.T1_VUCH_EMP_RELA (VUCH_NBR, EMP_ID, RATIO, CLAIM_STATUS_ID, REMARK, REMARK1, ORG_ID, ORG_NM, CST_NM, BIZ_TYPE_NM, VUCH_STATUS_NM, OPEN_DT, EMP_NM, EMP_ORG_ID, EMP_ORG_NM, MARKETING_NO) VALUES(?, ?, '0', '0', '', '', ?,?,?,?,?,?,?,?,?,?) ";
								System.out.println("没有填写过认领信息， 准备执行SQL_INSERT插入一条凭证+员工号的认领信息");
								pstmt = conn.prepareStatement(SQL_INSERT);
								pstmt.setString(1, vuch_nbr);
								pstmt.setString(2, user_id);
								pstmt.setString(3, VUCH_ORG_ID);
								pstmt.setString(4, VUCH_ORG_NM);
								pstmt.setString(5, VUCH_CST_NM);
								pstmt.setString(6, BIZ_TYPE_NM);
								pstmt.setString(7, VUCH_STATUS_NM);
								pstmt.setString(8, OPEN_DT);
								pstmt.setString(9, user_name);
								pstmt.setString(10, usr_org_id);
								pstmt.setString(11, usr_org_nm);
								pstmt.setString(12, MARKETING_NO);
								pstmt.executeUpdate();
								System.out.println("完成 执行SQL_INSERT插入一条凭证+员工号的认领信息");

							} else {
								System.out.println("已经有凭证认领信息填写过，不插入新数据");
							}

						}

					}

					resultSetSQL_BUTTON.close();
					pt.close();
					resultSet.close();
					if(resultSetOrg!=null){
						resultSetOrg.close();
					}
					pstmt.close();

				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
				conn.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}
		System.out.println(new Date() + "贷款认领校验页面:::执行完前置动作------------------");
	}

	@Override
	public void doEnd(ReportRequest rrequest, ReportBean rbean) {

		System.out.println(new Date() + "贷款认领校验页面:::执行后置动作------------------");
	}

}
