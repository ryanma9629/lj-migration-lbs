
package com.customer.interceptor;

import java.sql.Connection;
import java.sql.PreparedStatement;
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

public class ClaimVerifyAccFsServerCallBack implements IServerAction {
	/**
	 * 与框架无关的ajax调用
	 */
	@Override
	public String executeServerAction(HttpServletRequest request,
			HttpServletResponse response, List<Map<String, String>> lstData) {
		System.out
				.println("executeServerAction(HttpServletRequest request,HttpServletResponse response,List<Map<String,String>> lstData)方法...");
		return null;
	}

	/**
	 * 针对组件通过ajax调用服务器端方法
	 */
	@Override
	public String executeSeverAction(ReportRequest rrequest,
			IComponentConfigBean ccbean, List<Map<String, String>> lstData,
			Map<String, String> mCustomizedData) {
		System.out
				.println("调用executeSeverAction(ReportRequest rrequest,IComponentConfigBean ccbean,List<Map<String,String>> lstData)方法...");
//		rrequest.getWResponse().getMessageCollector().success("数据处理中...",false);//("批量审核通过，数据处理中...");//("批量审核通过，数据处理中...", "", false);//向前台提示一条信息，这里还可以终止后续处理
		// printLstParams(lstData);//打印客户端传过来的参数
		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");// 审核人
		String user_nm = (String) rrequest.getRequest().getSession().getAttribute("user_name");
		Date date = new Date();
		/* dt认领时间 VERIFY_DT */
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
		String dt = dateformat.format(date);

		/* dts认领时间戳，用于填写在备注时间上 */
		SimpleDateFormat dateformat1 = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");// 认领时间戳，用于填写在备注时间上
		String dts = dateformat1.format(date);
		//Connection conn = Config.getInstance().getDataSource("ds_ibs").getConnection();// 取DB2数据源配置
		
		String vuch_nbr = "";
		String emp_id = "";
		Double newRation=0.0;
		if (lstData == null || lstData.size() == 0) {
			System.out.println("无参数");
		} else {
			System.out.println("客户端传入参数列表：：：");
			for (Map<String, String> mParams : lstData) {

				for (Entry<String, String> entryTmp : mParams.entrySet()) {
					if (entryTmp.getKey().equals("VUCH_NBR")) {
						vuch_nbr = entryTmp.getValue();
					}
					if (entryTmp.getKey().equals("EMP_ID")) {
						emp_id = entryTmp.getValue();
					}
					if (entryTmp.getKey().equals("NEW_RATIO")) {
						newRation = Double.valueOf(entryTmp.getValue());
					}
				}
				System.out.println("页面勾选的凭证号:" + vuch_nbr + "      员工号为："
						+ emp_id);
				Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置

				try {

					PreparedStatement pstmt1 = null;
					PreparedStatement pstmt2 = null;
					PreparedStatement pstmt3 = null;
					
					String sql1 = "UPDATE IBS.T1_VUCH_EMP_RELA SET CLAIM_STATUS_ID='2' "
							+ ", VERIFY_DT=?"
							+ ", VERIFY_EMP_ID=? "
							+ ", REMARK=REMARK||' 终审工号'||?||' 姓名'||?||' 时间'||?||' 备注终审通过。' "
							+ "WHERE CLAIM_STATUS_ID ='21' "
							+ "AND VUCH_NBR=? "
							+ "AND EMP_ID=?";
					
					String sql2 ="UPDATE IBS.T6_VUCH_EMP_RELA_CHANGE_LOG SET NEW_CLAIM_STATUS_ID='2' "
						+ ",NEW_FIN_VERIFY_DT=? "
						+ ",NEW_FIN_VERIFY_EMP_ID=? "
						+ ",NEW_REMARK=NEW_REMARK||' 终审工号'||?||' 姓名'||?||' 时间'||?||'备注终审通过。' "
						+ "WHERE NEW_CLAIM_STATUS_ID='21' "
						+ "AND VUCH_NBR=? "
						+ "AND NEW_EMP_ID=? " 
						+ "and CHANGE_FLAG='0' "
						;
					
					String sql3 ="UPDATE IBS.T1_VUCH_EMP_RELA SET RVS_STATUS_ID='2',RATIO=RVS_RATIO "
						+ ",RVS_CLAIM_EMP_ID=? "
						+ ",RVS_CLAIM_DT=? "
						+ ",REMARK=REMARK||' 终审工号'||?||' 姓名'||?||' 时间'||?||' 备注终审通过。' "
						+ "WHERE RVS_STATUS_ID='21' "
						+ "AND VUCH_NBR=? AND EMP_ID=? "
						;
					
					pstmt1 = conn.prepareStatement(sql1);
					pstmt1.setString(1, dt);
					pstmt1.setString(2, user_id);
					pstmt1.setString(3, user_id);
					pstmt1.setString(4, user_nm);
					pstmt1.setString(5, dts);
					pstmt1.setString(6, vuch_nbr);
					pstmt1.setString(7, emp_id);
					pstmt1.executeUpdate();
					System.out.println("sql1="+sql1);
					
					pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setString(1, dt);
					pstmt2.setString(2, user_id);
					pstmt2.setString(3, user_id);
					pstmt2.setString(4, user_nm);
					pstmt2.setString(5, dts);
					pstmt2.setString(6, vuch_nbr);
					pstmt2.setString(7, emp_id);
					pstmt2.executeUpdate();
					System.out.println("sql2="+sql2);
					
					pstmt3 = conn.prepareStatement(sql3);
					pstmt3.setString(1, user_id);
					pstmt3.setString(2, dt);
					pstmt3.setString(3, user_id);
					pstmt3.setString(4, user_nm);
					pstmt3.setString(5, dts);
					pstmt3.setString(6, vuch_nbr);
					pstmt3.setString(7, emp_id);
					pstmt3.executeUpdate();
					System.out.println("sql3="+sql3);
					
					
					pstmt1.close();
					pstmt2.close();
					pstmt3.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				finally{
					try {
						conn.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

			}

		}
		rrequest.getWResponse().getMessageCollector().success("数据处理完成！", "", false);
		return "调用成功!!!";
	}
}

