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

/*存款认领校验页面*/
/*大堂经理认领存款衍生变更页面 
 /此页面用于解决资源类客户经理老业绩认领以及公司业务部其他问题
 /分行管理员可以登录此页面对业绩进行调整认领，直接认领2018-01-01年之前的业绩	
 */

public class InterceptorClaimDep_NEW_FH extends AbsInterceptorDefaultAdapter {

	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		String vuch_nbr = rrequest.getStringAttribute("VUCH_NBR", "");// 取出凭证号
		
		
		String input_per_id = rrequest.getStringAttribute("EMP_ID", "");// 取出输入的员工号
		System.out.println("input_per_id = " + input_per_id);
		
		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		String user_name = (String) rrequest.getRequest().getSession().getAttribute("user_name");
		String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
		String usr_org_nm = (String) rrequest.getRequest().getSession().getAttribute("usr_org_nm");

		System.out.println("VUCH_NBR-----" + vuch_nbr + " and  user_id----" + user_id + " and usr_org_id----" + usr_org_id);
		Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
		// SQL是否存在输入的凭证号 判断输入的凭证号是否存在，如果存在判断是否配卡，并把凭证信息全部取出来为insert准备

		/************************ step1 判断是否输入凭证号，如果不存在，则页面进行延迟加载 ***************************/
		if (vuch_nbr.equals("")) {
			rrequest.setAttribute("select_lazyload", "true");
			rrequest.setAttribute("select_lazyloadmessage", "现在是延迟读取，输入凭证号后点击查询按钮才加载相应条件的数据");
			rrequest.authorize("other_dtl", null, null, "display", "false");
			rrequest.authorize("dtl", null, null, "display", "false");
		} else {
			/************************** step2 判断是否存在输入的凭证号 *************************************************/
			// Connection conn =
			// Config.getInstance().getDataSource("ds_ibs").getConnection();//
			// 取DB2数据源配置

			System.out.println("step2 判断是否存在输入的凭证号");
			try {

				String SQL_BUTTON = "select count(1) as cnt from IBS.T1_VUCH_EMP_RELA where CLAIM_STATUS_ID IN ('1', '2', '5', '6') AND VUCH_NBR=?  ";
				PreparedStatement pt = conn.prepareStatement(SQL_BUTTON, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
				pt = conn.prepareStatement(SQL_BUTTON);
				pt.setString(1, vuch_nbr);
				ResultSet resultSetSQL_BUTTON = pt.executeQuery();
				while (resultSetSQL_BUTTON.next()) {
//					if (resultSetSQL_BUTTON.getInt("cnt") > 0) {
//						rrequest.authorize("dtl", Consts.BUTTON_PART, "type{save}", "disabled", "true");
//						rrequest.authorize("dtl", Consts.BUTTON_PART, "sub", "disabled", "true");
//						rrequest.setAttribute("dtl_ACCESSMODE", "readonly");
//
//					}
				}

				// COALESCE(MARKETING_NO,0)
				String SQL = "Select  WITH_CARD_F, ORG_ID, ORG_NM, BRANCH_ORG_NM, BRANCH_ORG_ID, CST_NM, BIZ_TYPE_NM, VUCH_STATUS_NM, OPEN_DT, COALESCE(MARKETING_NO,'') as MARKETING_NO from IBS.T1_VUCH_DETAIL where VUCH_NBR=? and  VUCH_TYPE_ID in ('10','11','12','13','14','15','16','17','18') with ur";

				String VUCH_ORG_ID = ""; // 获取凭证所属机构号码
				String VUCH_ORG_NM = ""; // 获取凭证所属机构名
				
				//新增分行机构名、分行机构号，用来分行存款分配认领
				String VUCH_BRANCH_ORG_ID = ""; // 获取凭证所属分行的机构号码
				String VUCH_BRANCH_ORG_NM = ""; // 获取凭证所属分行的机构名
				
				String VUCH_CST_NM = ""; // 获取凭证客户名
				String BIZ_TYPE_NM = ""; // 获取凭证业务类型
				String VUCH_STATUS_NM = "";// 获取凭证状态名称
				String OPEN_DT = ""; // 获取凭证开户日期
				String MARKETING_NO = ""; // 获取营销活动编号

				PreparedStatement pstmt = conn.prepareStatement(SQL, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
				pstmt.setString(1, vuch_nbr);
				ResultSet resultSet = pstmt.executeQuery();
				int cnt = 0;
				resultSet.last();
				cnt = resultSet.getRow();

				System.out.println("cnt=" + cnt);
				if (resultSet.getRow() == 0) {
					rrequest.authorize("dtl", null, null, "display", "false");
					rrequest.authorize("other_dtl", null, null, "display", "false");
					rrequest.getWResponse().getMessageCollector().error("不存在输入的凭证号,请核对。（由于批量原因，新开户的凭证号，请明日再试。）", false);
					System.out.println("结束判断输入的凭证号不存在，页面不显示。");

				}

				else {
					resultSet.beforeFirst();
					while (resultSet.next()) {
						System.out.println("************resultSet.getRow()===" + resultSet.getRow());
						System.out.println("MARKETING_NO" + resultSet.getString("MARKETING_NO"));
						if (resultSet.getString("WITH_CARD_F").equals("0") && !resultSet.getString("MARKETING_NO").trim().equals("2016qq") && resultSet.getString("BRANCH_ORG_ID").equals(usr_org_id)) {
							// 输入正常的凭证号:未配卡也未参加蛐蛐网活动
							VUCH_ORG_ID = resultSet.getString("ORG_ID");
							VUCH_ORG_NM = resultSet.getString("ORG_NM");
							
							//新增分行机构名、分行机构号，用来分行存款分配认领
							VUCH_BRANCH_ORG_ID = resultSet.getString("BRANCH_ORG_ID");
							VUCH_BRANCH_ORG_NM = resultSet.getString("BRANCH_ORG_NM");
							
							VUCH_CST_NM = resultSet.getString("CST_NM");
							BIZ_TYPE_NM = resultSet.getString("BIZ_TYPE_NM");
							VUCH_STATUS_NM = resultSet.getString("VUCH_STATUS_NM");
							OPEN_DT = resultSet.getString("OPEN_DT");
							MARKETING_NO = resultSet.getString("MARKETING_NO");
							
						

							// SQL_Other:查询是否含有他人认领信息、查询人认领信息
							String SQL_Other = "SELECT COALESCE(SUM(CASE WHEN EMP_ID = '' THEN 1 ELSE 0 END ),0) AS EMP_ID_CNT, COALESCE(SUM(CASE WHEN EMP_ID<>'' THEN 1 ELSE 0 END),0) AS OTHER_EMP_ID_CNT FROM IBS.T1_VUCH_EMP_RELA WHERE VUCH_NBR=? with ur";
							pstmt = conn.prepareStatement(SQL_Other);
							pstmt.setString(1, vuch_nbr);
							ResultSet resultSetOther = pstmt.executeQuery();
							while (resultSetOther.next()) {

//								if (resultSetOther.getInt("OTHER_EMP_ID_CNT") < 1) {
//									// 此凭证没有他人认领信息
//									rrequest.authorize("other_dtl", null, null, "display", "false");
//									System.out.println("此凭证没有他人认领信息，report id='other_dtl' 页面被屏蔽，不显示");
//								}

								if (resultSetOther.getInt("EMP_ID_CNT") < 1) {
									String SQL_INSERT = "INSERT INTO IBS.T1_VUCH_EMP_RELA ( VUCH_NBR, EMP_ID, RATIO, CLAIM_STATUS_ID, REMARK, REMARK1, ORG_ID, ORG_NM, CST_NM, BIZ_TYPE_NM, VUCH_STATUS_NM, OPEN_DT, EMP_NM, EMP_ORG_ID, EMP_ORG_NM, MARKETING_NO) Values( ?, '', '0', '0', '', '', ?, ?, ?, ?, ?, ?, '', '', '', ?)  ";
									System.out.println("没有填写过认领信息， 准备执行SQL_INSERT插入一条凭证+员工号的认领信息");
									pstmt = conn.prepareStatement(SQL_INSERT);
									pstmt.setString(1, vuch_nbr);
									pstmt.setString(2, VUCH_ORG_ID);
									pstmt.setString(3, VUCH_ORG_NM);
									pstmt.setString(4, VUCH_CST_NM);
									pstmt.setString(5, BIZ_TYPE_NM);
									pstmt.setString(6, VUCH_STATUS_NM);
									pstmt.setString(7, OPEN_DT);
									pstmt.setString(8, MARKETING_NO);
									pstmt.executeUpdate();
									System.out.println("完成 执行SQL_INSERT插入一条凭证+员工号的认领信息");

								} else {
									System.out.println("已经有凭证认领信息填写过，不插入新数据");
								}
							}

						}

						else if (resultSet.getString("WITH_CARD_F").equals("1")) {
							// 配卡凭证
							rrequest.authorize("dtl", null, null, "display", "false");
							rrequest.authorize("other_dtl", null, null, "display", "false");
							rrequest.getWResponse().getMessageCollector().error("输入的储蓄存折(凭证号" + vuch_nbr + ")已关联银行卡，请对关联卡进行认领。", false);
							System.out.println("此凭证有配卡，请对配卡进行认领。");
						} else if (resultSet.getString("MARKETING_NO").trim().equals("2016qq")) {
							// 参加蛐蛐网活动的凭证，则存款凭证不可以再次认领
							rrequest.authorize("dtl", null, null, "display", "false");
							rrequest.authorize("other_dtl", null, null, "display", "false");
							rrequest.getWResponse().getMessageCollector().error("输入的凭证号" + vuch_nbr + "已参加蛐蛐网活动，不能再次认领。", false);
							System.out.println("参加蛐蛐网活动的凭证，则存款凭证不可以再次认领。");
						} else if (!resultSet.getString("BRANCH_ORG_ID").equals(usr_org_id)){
							// 输入的凭证号不是登陆人的分行凭证，则无权分配认领
							rrequest.authorize("dtl", null, null, "display", "false");
							rrequest.authorize("other_dtl", null, null, "display", "false");
							rrequest.getWResponse().getMessageCollector().error("输入的凭证号" + vuch_nbr + "归属机构为：" + resultSet.getString("BRANCH_ORG_NM") + "，与登录人机构不同，不能进行认领。", false);
							System.out.println("输入的凭证号不是登陆人的分行凭证，则无权分配认领。");
							
						}
						

					}
		

					resultSetSQL_BUTTON.close();
					pt.close();
					resultSet.close();
					pstmt.close();

				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		}
		System.out.println(new Date() + "存款认领校验页面:::执行完前置动作------------------");

	}

	@Override
	public void doEnd(ReportRequest rrequest, ReportBean rbean) {
//		System.out.println(new Date() + "存款认领校验页面:::执行后置动作         start------------------");
//		String vuch_nbr = rrequest.getStringAttribute("VUCH_NBR", "");// 取出凭证号
//		
//		
//		String input_per_id = rrequest.getStringAttribute("EMP_ID", "");// 取出输入的员工号
//		System.out.println("input_per_id = " + input_per_id);
//		
//		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
//		String user_name = (String) rrequest.getRequest().getSession().getAttribute("user_name");
//		String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
//		String usr_org_nm = (String) rrequest.getRequest().getSession().getAttribute("usr_org_nm");
//
//		System.out.println("VUCH_NBR-----" + vuch_nbr + " and  user_id----" + user_id + " and usr_org_id----" + usr_org_id);
		System.out.println(new Date() + "存款认领校验页面:::执行后置动作------------------");
	}

}
