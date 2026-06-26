package com.customer.interceptor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.wabacus.config.Config;
import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.util.Consts;

/*贷款认领延迟加载校验页面*/
public class InterceptorClaimLn_OLD extends AbsInterceptorDefaultAdapter {

	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		String vuch_nbr = rrequest.getStringAttribute("VUCH_NBR", "");// 取出借据号
		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		String user_name = (String) rrequest.getRequest().getSession().getAttribute("user_name");
		String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
		String usr_org_nm = (String) rrequest.getRequest().getSession().getAttribute("usr_org_nm");
		
		System.out.println("VUCH_NBR-----" + vuch_nbr + " and  user_id----" + user_id);

		/************************ step1 判断是否输入借据号，如果不存在，则页面进行延迟加载 ***************************/
		if (vuch_nbr.equals("")) {
			rrequest.setAttribute("select_lazyload", "true");
			rrequest.setAttribute("select_lazyloadmessage", "现在是延迟读取，输入借据号后点击查询按钮才加载相应条件的数据");
			rrequest.authorize("other_dtl", null, null, "display", "false");
			rrequest.authorize("dtl", null, null, "display", "false");
		} else {
			/************************** step2 判断是否存在输入的借据号 *************************************************/
			Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
			PreparedStatement pstmt = null;
			try {
				// SQL是否存在输入的借据号，其中
					/*
					 * VUCH_TYPE_ID,VUCH_TYPE_NM
						21,贷款借据
					 */
				String SQL = "Select count(1) as cnt, ORG_ID, ORG_NM, CST_NM, BIZ_TYPE_NM, VUCH_STATUS_NM, OPEN_DT from IBS.T1_VUCH_DETAIL where VUCH_NBR=? and VUCH_TYPE_ID in ('21') group by  ORG_ID, ORG_NM, CST_NM, BIZ_TYPE_NM, VUCH_STATUS_NM, OPEN_DT";
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, vuch_nbr);
				ResultSet resultSet = pstmt.executeQuery();
				
				String VUCH_ORG_ID=""; //获取凭证所属机构号码
//				String VUCH_TYPE_NM="";//获取凭证类型
				String VUCH_ORG_NM="";      //获取凭证所属机构名
				
				String VUCH_CST_NM=""; //获取凭证客户名
				String BIZ_TYPE_NM=""; //获取凭证业务类型
				String VUCH_STATUS_NM="";//获取凭证状态名称
				String OPEN_DT="";      //获取凭证开户日期  
				
				while (resultSet.next()) {
					VUCH_ORG_ID=resultSet.getString("ORG_ID");
//					VUCH_TYPE_NM=resultSet.getString("VUCH_TYPE_NM");
					VUCH_ORG_NM=resultSet.getString("ORG_NM");
					
					VUCH_CST_NM=resultSet.getString("CST_NM");
					BIZ_TYPE_NM=resultSet.getString("BIZ_TYPE_NM");
					VUCH_STATUS_NM=resultSet.getString("VUCH_STATUS_NM");
					OPEN_DT=resultSet.getString("OPEN_DT");   
					
					if (resultSet.getInt("cnt") < 1) {
						// 输入的借据号不存在
						rrequest.authorize("dtl", null, null, "display", "false");
						rrequest.authorize("other_dtl", null, null, "display", "false");
						rrequest.getWResponse().getMessageCollector().error("不存在输入的借据号,请核对。", "", false);
						System.out.println("结束判断输入的借据号不存在，页面不显示。");
					} else {
						/************************** step3 判断输入的借据号否存在他人认领信息 *************************************************/
						// SQL_Other是否存在输入的借据号的他人认领信息
						String SQL_Other = "select count(1) as cnt from IBS.T1_VUCH_EMP_RELA where CLAIM_STATUS_ID IN ('1', '2', '5', '6') AND VUCH_NBR=? AND EMP_ID<>?";
						pstmt = conn.prepareStatement(SQL_Other);
						pstmt.setString(1, vuch_nbr);
						pstmt.setString(2, user_id);
						ResultSet resultSetOther = pstmt.executeQuery();
						while (resultSetOther.next()) {
							if (resultSetOther.getInt("cnt") < 1) {
								// 此借据没有他人认领信息
								rrequest.authorize("other_dtl", null, null, "display", "false");
								System.out.println("此借据没有他人认领信息，report id='other_dtl' 页面被屏蔽，不显示");
							}
							
							String SQL_RELA = "select count(1) as cnt from IBS.T1_VUCH_EMP_RELA where VUCH_NBR=? AND EMP_ID=?";
							String SQL_INSERT = "INSERT INTO IBS.T1_VUCH_EMP_RELA (VUCH_NBR, EMP_ID, RATIO, CLAIM_STATUS_ID, REMARK, REMARK1, ORG_ID, ORG_NM, CST_NM, BIZ_TYPE_NM, VUCH_STATUS_NM, OPEN_DT, EMP_NM, EMP_ORG_ID, EMP_ORG_NM) VALUES(?, ?, '0', '0', '', '', ?,?,?,?,?,?,?,?,?) ";

							pstmt = conn.prepareStatement(SQL_RELA);
							pstmt.setString(1, vuch_nbr);
							pstmt.setString(2, user_id);
							ResultSet resultSetSQL_RELA = pstmt.executeQuery();
							while (resultSetSQL_RELA.next()) {
								if (resultSetSQL_RELA.getInt("cnt") == 0) {

									System.out.println("没有填写过认领信息， 准备执行SQL_INSERT插入一条借据+员工号的认领信息");
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
									pstmt.executeUpdate();
									System.out.println("完成 执行SQL_INSERT插入一条借据+员工号的认领信息");
								} else {
									System.out.println("已经有借据认领信息填写过，不插入新数据");
								}
							}
							
							String SQL_BUTTON = "select count(1) as cnt from IBS.T1_VUCH_EMP_RELA where CLAIM_STATUS_ID IN ('1', '2', '5', '6') AND VUCH_NBR=? AND EMP_ID=?";
							pstmt = conn.prepareStatement(SQL_BUTTON);
							pstmt.setString(1, vuch_nbr);
							pstmt.setString(2, user_id);
							ResultSet resultSetSQL_BUTTON = pstmt.executeQuery();
							while (resultSetSQL_BUTTON.next()) {
								if (resultSetSQL_BUTTON.getInt("cnt") > 0) {
									rrequest.authorize("dtl", Consts.BUTTON_PART, "type{save}", "disabled", "true");
									rrequest.authorize("dtl", Consts.BUTTON_PART, "sub", "disabled", "true");
									rrequest.setAttribute("dtl_ACCESSMODE", "readonly");
								}
							}
							resultSetSQL_BUTTON.close();
							resultSetSQL_RELA.close();

						}

					}
				}

				resultSet.close();
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				try {
					conn.close();
				} catch (SQLException e) {
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
