
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


public class EmpEmpDxFhPassServerCallBack implements IServerAction {
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
		
		System.out.println("选中提交--------------");
		String isExam = (String) rrequest.getRequest().getSession().getAttribute("isExam");
		//不是考核期
		if(isExam.equals("0")){
			rrequest.authorize("select", "button", "subButn", "disabled", "true");
		}else{
			String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");// 审核人
			String ip = (String) rrequest.getRequest().getSession().getAttribute("ip");
			String exam_q = (String) rrequest.getRequest().getSession().getAttribute("exam_q");
			String exam_year = (String) rrequest.getRequest().getSession().getAttribute("exam_year");
			
			Date date = new Date();
			
			SimpleDateFormat dateformat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 认领时间戳，用于填写在备注时间上
			String dts = dateformat1.format(date);
			
			//String examYear = "";
			String empId = "";
			
			if (lstData == null || lstData.size() == 0) {
				System.out.println("无参数");
			} else {
				System.out.println("客户端传入参数列表：：：");
				for (Map<String, String> mParams : lstData) {

					for (Entry<String, String> entryTmp : mParams.entrySet()) {
						/*
						if (entryTmp.getKey().equals("EXAM_YEAR")) {
							examYear = entryTmp.getValue();
						}*/
						
						if (entryTmp.getKey().equals("EMP_ID")) {
							empId = entryTmp.getValue();
						}
						
					}
					
					Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置

					try {

						PreparedStatement pstmt = null;
						
						String sqlPass ="UPDATE IBS.T2_EMP_DX_SCORE SET STUS='0',OU_MOD_PEOPLE=?, OU_MOD_TIME=?,OU_MOD_IP=? " +
								"WHERE EXAM_YEAR = ? AND EXAM_Q=? AND EMP_ID=?  "  ;
						
						System.out.println("sqlPass="+sqlPass);
						
						pstmt = conn.prepareStatement(sqlPass);
						pstmt.setString(1, user_id);
						pstmt.setString(2, dts);
						pstmt.setString(3, ip);
						pstmt.setString(4, exam_year);
						pstmt.setString(5, exam_q);
						pstmt.setString(6, empId);
						pstmt.executeUpdate();
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
		}
		return "调用成功!!!";
	}
}

