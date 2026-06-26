
package com.customer.interceptor;

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

public class EmpExsXzSubmitServerCallBack implements IServerAction {
	
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
		String org_id = (String) rrequest.getRequest().getSession().getAttribute("org_id");
		String exam_year = (String) rrequest.getRequest().getSession().getAttribute("exam_year");
		String exam_q = (String) rrequest.getRequest().getSession().getAttribute("exam_q");
		
		//String examY = (String) rrequest.getRequest().getAttribute("EXAM_YEAR");
		//String examQ = (String) rrequest.getRequest().getAttribute("EXAM_Q");
		
		//System.out.println("examY="+examY+";examQ="+examQ);
		
		Date date = new Date();

		SimpleDateFormat dateformat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dts = dateformat1.format(date);
		
		String mesDt = (String) rrequest.getRequest().getSession().getAttribute("exam_msr_dt");
		//String empId = "";
		
		Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
		try {

			PreparedStatement pstmt = null;
			PreparedStatement pstmtVal = null;
			//校验
			String sqlVal="select EXS_BZJX_SUM,EXS_XZ from IBS.T3_BRANCH_EXS_XZ_VAL where MEASURE_DT=? and BRANCH_ORG_ID=? ";
			
			System.out.println("sqlVal="+sqlVal);
			
			pstmtVal = conn.prepareStatement(sqlVal);
			pstmtVal.setString(1, mesDt);
			pstmtVal.setString(2, org_id);
			
			ResultSet rs = pstmtVal.executeQuery();
			if (rs.next()) {
				
				if (rs.getDouble("EXS_BZJX_SUM") != rs.getDouble("EXS_XZ")) {
					rrequest.getWResponse().getMessageCollector().success("存量维护薪酬合计与实际季度存量维护薪酬合计不一致，无法提交！", "", false);
					

				}else{
					//提交
					String sqlSub ="UPDATE IBS.T5_EMP_BZJX SET STUS='1' ,MODIFY_PEOPLE=? ,MODIFY_TIME=? ,MODIFY_IP=? " +
							"WHERE MEASURE_DT=? AND BRANCH_ORG_ID=? AND STUS in ('0','2') and EMP_TYPE='E' and PSTN_TYPE='04' " ;
					System.out.println("sqlSub="+sqlSub);
					pstmt = conn.prepareStatement(sqlSub);
					pstmt.setString(1, user_id);
					pstmt.setString(2, dts);
					pstmt.setString(3, ip);
					pstmt.setString(4, mesDt);
					pstmt.setString(5, org_id);
					pstmt.executeUpdate();
					pstmt.close();
					pstmtVal.close();
					rs.close();
					rrequest.getWResponse().getMessageCollector().success("数据处理完成！", "", false);
				
				}
			}else{
				rrequest.getWResponse().getMessageCollector().alert("没有要提交的数据或其它指标未维护，无法提交！", "", false);
				
			}
			
			
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
		
		/*客户端传入参数列表*/
		/*
		if (lstData == null || lstData.size() == 0) {
			System.out.println("无参数");
		} else {
			//System.out.println("客户端传入参数列表：：：");
			for (Map<String, String> mParams : lstData) {
				for (Entry<String, String> entryTmp : mParams.entrySet()) {
					if (entryTmp.getKey().equals("MEASURE_DT")) {
						mesDt = entryTmp.getValue();
					}
					if (entryTmp.getKey().equals("EMP_ID")) {
						empId = entryTmp.getValue();
					}
				}
				
				Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
				try {

					PreparedStatement pstmt = null;
					String sqlSub ="UPDATE IBS.T5_EMP_BZJX SET STUS='1' ,MODIFY_PEOPLE=? ,MODIFY_TIME=? ,MODIFY_IP=? " +
							"WHERE MEASURE_DT=? AND EMP_ID=? AND STUS in ('0','2') and EMP_TYPE='E' and PSTN_TYPE='04' " ;
					
					System.out.println("sqlSub="+sqlSub);
					
					pstmt = conn.prepareStatement(sqlSub);
					pstmt.setString(1, user_id);
					pstmt.setString(2, dts);
					pstmt.setString(3, ip);
					pstmt.setString(4, mesDt);
					pstmt.setString(5, empId);
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

			}*/

		//}
		return "完成";
	}
}

