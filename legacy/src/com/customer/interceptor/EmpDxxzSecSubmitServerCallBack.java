
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

public class EmpDxxzSecSubmitServerCallBack implements IServerAction {
	
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
		
		Date date = new Date();
//		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
//		String dt = dateformat.format(date);

		SimpleDateFormat dateformat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dts = dateformat1.format(date);
		
		String mesDt = "";
		String braOrgId = "";
		
		/*客户端传入参数列表*/
		if (lstData == null || lstData.size() == 0) {
			System.out.println("无参数");
		} else {
			//System.out.println("客户端传入参数列表：：：");
			for (Map<String, String> mParams : lstData) {
				for (Entry<String, String> entryTmp : mParams.entrySet()) {
					if (entryTmp.getKey().equals("MEASURE_DT")) {
						mesDt = entryTmp.getValue();
					}
					if (entryTmp.getKey().equals("BRANCH_ORG_ID")) {
						braOrgId = entryTmp.getValue();
					}
					
				}
				
				Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
				try {

					PreparedStatement pstmt = null;
					String sqlSub ="UPDATE IBS.T3_BRANCH_SEC_DISTRIBUTION SET STUS='1' ,MODIFY_PEOPLE=? ,MODIFY_TIME=? ,MODIFY_IP=? " +
							"WHERE MEASURE_DT=? AND BRANCH_ORG_ID=? AND STUS IN ('0','2')" ;
					
					System.out.println("sqlSub="+sqlSub);
					
					pstmt = conn.prepareStatement(sqlSub);
					pstmt.setString(1, user_id);
					pstmt.setString(2, dts);
					pstmt.setString(3, ip);
					pstmt.setString(4, mesDt);
					pstmt.setString(5, braOrgId);
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

