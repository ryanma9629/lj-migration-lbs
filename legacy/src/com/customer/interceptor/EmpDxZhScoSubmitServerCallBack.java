
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

public class EmpDxZhScoSubmitServerCallBack implements IServerAction {
	
	@Override
	public String executeServerAction(HttpServletRequest request,
			HttpServletResponse response, List<Map<String, String>> lstData) {
		System.out
				.println("executeServerAction(HttpServletRequest request,HttpServletResponse response,List<Map<String,String>> lstData)方法...");
		return null;
	}

	
	@Override
	public String executeSeverAction(ReportRequest rrequest,
			IComponentConfigBean ccbean, List<Map<String, String>> lstData,
			Map<String, String> mCustomizedData) {

		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		String ip = (String) rrequest.getRequest().getSession().getAttribute("ip");
//		String org_id = (String) rrequest.getRequest().getSession().getAttribute("org_id");
		
		Date date = new Date();
//		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
//		String dt = dateformat.format(date);

		SimpleDateFormat dateformat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dts = dateformat1.format(date);
		
		String year = "";
		String examQ = "";
		String projctNm = "";
		String zbNm = "";
		String msrPrdDt="";
		String empId="";
		String score = "";
		
		/*客户端传入参数列表*/
		if (lstData == null || lstData.size() == 0) {
			System.out.println("无参数");
		} else {
			//System.out.println("客户端传入参数列表：：：");
			for (Map<String, String> mParams : lstData) {
				for (Entry<String, String> entryTmp : mParams.entrySet()) {
					if (entryTmp.getKey().equals("EXAM_YEAR")) {
						year = entryTmp.getValue();
					}
					if (entryTmp.getKey().equals("EXAM_Q")) {
						examQ = entryTmp.getValue();
					}
					if (entryTmp.getKey().equals("PROJCT_NM")) {
						projctNm = entryTmp.getValue();
					}
					if (entryTmp.getKey().equals("ZB_NM")) {
						zbNm = entryTmp.getValue();
					}
					if (entryTmp.getKey().equals("MSR_PRD_DT")) {
						msrPrdDt = entryTmp.getValue();
					}
					if (entryTmp.getKey().equals("EMP_ID")) {
						empId = entryTmp.getValue();
					}
					if (entryTmp.getKey().equals("SCORE")) {
						score = entryTmp.getValue();
					}
				}
				
				Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
				try {

					PreparedStatement pstmt = null;
					String sqlSub ="UPDATE IBS.T2_EMP_DX_SCORE SET STUS='1' ,OU_MOD_PEOPLE=? ,OU_MOD_TIME=? ,OU_MOD_IP=?, SCORE=? " +
							"WHERE EXAM_YEAR=? AND EXAM_Q=? AND MSR_PRD_DT=? AND PROJCT_NM=? AND ZB_NM=? and EMP_ID=? " ;
					
					System.out.println("sqlSub="+sqlSub);
					
					pstmt = conn.prepareStatement(sqlSub);
					pstmt.setString(1, user_id);
					pstmt.setString(2, dts);
					pstmt.setString(3, ip);
					pstmt.setString(4, score);
					pstmt.setString(5, year);
					pstmt.setString(6, examQ);
					pstmt.setString(7, msrPrdDt);
					pstmt.setString(8, projctNm);
					pstmt.setString(9, zbNm);
					pstmt.setString(10, empId);
					pstmt.executeUpdate();
					
					pstmt.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				finally{
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}

			}

		}
		rrequest.getWResponse().getMessageCollector().success("数据处理完成！", "", false);
		return "成功!!!";
	}
}

