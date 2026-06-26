package com.customer.interceptor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.customer.util.Time;
import com.wabacus.config.Config;
import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.util.Consts;

/*存款认领校验页面*/
public class InterceptorClaimDep_NEW extends AbsInterceptorDefaultAdapter {

	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		String vuch_nbr = rrequest.getStringAttribute("VUCH_NBR", "");// 取出凭证号
		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		String user_name = (String) rrequest.getRequest().getSession().getAttribute("user_name");
		String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
		String usr_org_nm = (String) rrequest.getRequest().getSession().getAttribute("usr_org_nm");

		//System.out.println("VUCH_NBR-----" + vuch_nbr + " and  user_id----" + user_id + " and usr_org_id----" + usr_org_id);
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

				String SQL_BUTTON = "select count(1) as cnt from IBS.T1_VUCH_EMP_RELA where CLAIM_STATUS_ID IN ('1', '2', '5', '6','21') AND VUCH_NBR=? AND EMP_ID=? ";
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

				// COALESCE(MARKETING_NO,0)
				
				//2017-11-02将对公存款剥离，大堂经理认领变更只对个人存款进行增量客户存量客户限制，对公存款保持原口径不变。
				String SQL = "Select  WITH_CARD_F, ORG_ID, ORG_NM, CST_NM, BIZ_TYPE_NM, VUCH_STATUS_NM, OPEN_DT, CST_OPEN_DT, VUCH_TYPE_ID, COALESCE(MARKETING_NO,'') as MARKETING_NO from IBS.T1_VUCH_DETAIL where VUCH_NBR=? and  VUCH_TYPE_ID in ('10','11','12','13','14','15','16','17','18') with ur";

				String VUCH_ORG_ID = ""; // 获取凭证所属机构号码
				String VUCH_ORG_NM = ""; // 获取凭证所属机构名
				String VUCH_CST_NM = ""; // 获取凭证客户名
				String BIZ_TYPE_NM = ""; // 获取凭证业务类型
				String VUCH_STATUS_NM = "";// 获取凭证状态名称
				String OPEN_DT = ""; // 获取凭证开户日期
				String MARKETING_NO = ""; // 获取营销活动编号

				// 20171102新增客户开户日期字段CST_OPEN_DT，变更依据为“大堂经理考核”-耿淑彤提出
				//String CST_OPEN_DT = ""; // 获取客户开户日期-以20180101为新老客户区分标准，“新增客户”指核心系统建户时间为2018年1月1日（含）以后的客户。（2）“存量客户”指核心建户时间在2018年1月1日之前的客户。
				//String VUCH_TYPE_ID = "";//获取凭证类型，区分对公户存款、个人存款
				
				
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
					rrequest.getWResponse().getMessageCollector().error("不存在输入的凭证号,请核对。（由于批量原因，新开户的凭证号，请明日再试。）", "", false);
					System.out.println("结束判断输入的凭证号不存在，页面不显示。");

				}

				else {
					resultSet.beforeFirst();
					String vuc_org_id="";
					ResultSet resultSetOrg = null;
					ResultSet resultSetOther = null;
					while (resultSet.next()) {
						System.out.println("************resultSet.getRow()===" + resultSet.getRow());
						System.out.println("MARKETING_NO" + resultSet.getString("MARKETING_NO") + "CST_OPEN_DT" + resultSet.getString("CST_OPEN_DT"));
						String cst_open_date=resultSet.getString("CST_OPEN_DT");
						
						//机构用户不可以跨行认领
						vuc_org_id=resultSet.getString("ORG_ID");
						if(user_id.equals(usr_org_id)){
							
							String sqlOrg="Select count(1) as orgCnt from IBS.T5_ORG where ORG_TYPE_ID='EO' and BRANCH_ORG_ID=? and ORG_ID=?";
							
							pstmt = conn.prepareStatement(sqlOrg);
							pstmt.setString(1, usr_org_id);
							pstmt.setString(2, vuc_org_id);
							resultSetOrg = pstmt.executeQuery();
							while (resultSetOrg.next()) {
								//支行行用户
								if(usr_org_id.equals(vuc_org_id)){
									
								}else{
									if (resultSetOrg.getInt("orgCnt")<1){
										rrequest.getWResponse().getMessageCollector().error("此凭证号的开户机构不是本机构。", "", false);
									}
								}
							}
							resultSetOrg.close();
						}
							
						if(cst_open_date == null || cst_open_date.equals("")){
							cst_open_date = "2010-01-01";
						}
						Time tt = new Time();
						boolean flag = tt.compareDate(cst_open_date);//compareDate用于比较数据日期，具体注释见函数内
						//System.out.println("flag=================="+flag);
						//if (!flag && !resultSet.getString("VUCH_TYPE_ID").equals("11")) {//输入凭证为老客户，且为非对公存款账户，即个人存款账户，则不可以认领。("11,对公存款账户")
							/*20210525 delete
							rrequest.authorize("dtl", null, null, "display", "false");
							rrequest.authorize("other_dtl", null, null, "display", "false");
							rrequest.getWResponse().getMessageCollector().error("该凭证是存量客户的凭证,客户开户日期为："+cst_open_date+"，不支持认领，如确有认领需求，可向分行有权人申请或分行个人业务部咨询。", "", false);
							System.out.println("老存量客户，不准在页面进行认领！");
							*/
						//} else {
							if (resultSet.getString("WITH_CARD_F").equals("0") && !resultSet.getString("MARKETING_NO").trim().equals("2016qq")) {
								// 输入正常的凭证号:未配卡也未参加蛐蛐网活动
								VUCH_ORG_ID = resultSet.getString("ORG_ID");
								VUCH_ORG_NM = resultSet.getString("ORG_NM");
								VUCH_CST_NM = resultSet.getString("CST_NM");
								BIZ_TYPE_NM = resultSet.getString("BIZ_TYPE_NM");
								VUCH_STATUS_NM = resultSet.getString("VUCH_STATUS_NM");
								OPEN_DT = resultSet.getString("OPEN_DT");
								MARKETING_NO = resultSet.getString("MARKETING_NO");
								
								// SQL_Other:查询是否含有他人认领信息、查询人认领信息
								String SQL_Other = "SELECT COALESCE(SUM(CASE WHEN EMP_ID=? THEN 1 ELSE 0 END ),0) AS EMP_ID_CNT, COALESCE(SUM(CASE WHEN EMP_ID<>? THEN 1 ELSE 0 END),0) AS OTHER_EMP_ID_CNT FROM IBS.T1_VUCH_EMP_RELA WHERE VUCH_NBR=? with ur";
								pstmt = conn.prepareStatement(SQL_Other);
								pstmt.setString(1, user_id);
								pstmt.setString(2, user_id);
								pstmt.setString(3, vuch_nbr);
								resultSetOther = pstmt.executeQuery();
								while (resultSetOther.next()) {
									
									if (resultSetOther.getInt("OTHER_EMP_ID_CNT") < 1) {
										// 此凭证没有他人认领信息
										rrequest.authorize("other_dtl", null, null, "display", "false");
										System.out.println("此凭证没有他人认领信息，report id='other_dtl' 页面被屏蔽，不显示");
									}
									
									if (resultSetOther.getInt("EMP_ID_CNT") < 1) {
										String SQL_INSERT = "INSERT INTO IBS.T1_VUCH_EMP_RELA (VUCH_NBR, EMP_ID, RATIO, CLAIM_STATUS_ID, REMARK, REMARK1, ORG_ID, ORG_NM, CST_NM, BIZ_TYPE_NM, VUCH_STATUS_NM, OPEN_DT, EMP_NM, EMP_ORG_ID, EMP_ORG_NM, MARKETING_NO,CST_OPEN_DT) VALUES(?, ?, '0', '0', '', '', ?,?,?,?,?,?,?,?,?,?,?) ";
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
										pstmt.setString(13, cst_open_date);  //20210621新增
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
								rrequest.getWResponse().getMessageCollector().error("输入的储蓄存折(凭证号" + vuch_nbr + ")已关联银行卡，请对关联卡进行认领。", "", false);
								System.out.println("此凭证有配卡，请对配卡进行认领。");
							} else if (resultSet.getString("MARKETING_NO").trim().equals("2016qq")) {
								// 参加蛐蛐网活动的凭证，则存款凭证不可以再次认领
								rrequest.authorize("dtl", null, null, "display", "false");
								rrequest.authorize("other_dtl", null, null, "display", "false");
								rrequest.getWResponse().getMessageCollector().error("输入的凭证号" + vuch_nbr + "已参加蛐蛐网活动，不能再次认领。", "", false);
								System.out.println("参加蛐蛐网活动的凭证，则存款凭证不可以再次认领。");
							}
							
							// 新老客户区分
							// 2018-01-01后（含2018-01-01）的凭证可以认领，2018-01-01之前的客户不可认领
							else if (resultSet.getString("MARKETING_NO").trim().equals("2016qq")) {
								// 参加蛐蛐网活动的凭证，则存款凭证不可以再次认领
								rrequest.authorize("dtl", null, null, "display", "false");
								rrequest.authorize("other_dtl", null, null, "display", "false");
								rrequest.getWResponse().getMessageCollector().error("输入的凭证号" + vuch_nbr + "已参加蛐蛐网活动，不能再次认领。", "", false);
								System.out.println("参加蛐蛐网活动的凭证，则存款凭证不可以再次认领。");
							}
					//}

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

		System.out.println(new Date() + "存款认领校验页面:::执行后置动作------------------");
	}

}
