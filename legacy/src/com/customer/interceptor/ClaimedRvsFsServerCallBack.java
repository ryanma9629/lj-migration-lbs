
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

public class ClaimedRvsFsServerCallBack implements IServerAction {
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
		String user_id = (String) rrequest.getRequest().getSession()
				.getAttribute("user_id");// 审核人
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
		Double ration = 0.0;
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
					if (entryTmp.getKey().equals("RATIO")) {
						ration = Double.valueOf(entryTmp.getValue());
					}
				}
				System.out.println("页面勾选的凭证号:" + vuch_nbr + "      员工号为："
						+ emp_id);
				Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置

				try {

					PreparedStatement pstmt = null;
					String sql = "UPDATE IBS.T1_VUCH_EMP_RELA SET RVS_STATUS_ID='2' "
							+ ", RVS_CLAIM_DT=?"
							+ ", RVS_CLAIM_EMP_ID=? "
							+ ", REMARK=REMARK||'调整审批批量通过。' "
							+ ", RATIO=? "
							+ "WHERE RVS_STATUS_ID ='1' "
							+ "AND VUCH_NBR=? "
							+ "AND EMP_ID=?";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, dt);
					pstmt.setString(2, user_id);
					pstmt.setDouble(3, ration);
					pstmt.setString(4, vuch_nbr);
					pstmt.setString(5, emp_id);
					pstmt.executeUpdate();
					System.out.println(sql);
					pstmt.close();
					
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

