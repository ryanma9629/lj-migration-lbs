
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

public class BrachDxVerPassServerCallBack implements IServerAction {
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
		System.out.println("调用executeSeverAction(ReportRequest rrequest,IComponentConfigBean ccbean,List<Map<String,String>> lstData)方法...");
		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");// 审核人
		
		Date date = new Date();
//		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
//		String dt = dateformat.format(date);
		
		SimpleDateFormat dateformat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 认领时间戳，用于填写在备注时间上
		String dts = dateformat1.format(date);
		
		
		String year = "";
		String examQ = "";
		String projctNm = "";
		String zbNm = "";
		String brachOrgId="";
		if (lstData == null || lstData.size() == 0) {
			System.out.println("无参数");
		} else {
			System.out.println("客户端传入参数列表：：：");
			for (Map<String, String> mParams : lstData) {

				for (Entry<String, String> entryTmp : mParams.entrySet()) {
					if (entryTmp.getKey().equals("YEAR")) {
						year = entryTmp.getValue();
					}
					if (entryTmp.getKey().equals("EXAM_Q_PARM")) {
						examQ = entryTmp.getValue();
					}
					if (entryTmp.getKey().equals("PROJCT_NM")) {
						projctNm = entryTmp.getValue();
					}
					if (entryTmp.getKey().equals("ZB_NM")) {
						zbNm = entryTmp.getValue();
					}
					if (entryTmp.getKey().equals("BRANCH_ORG_ID")) {
						brachOrgId = entryTmp.getValue();
					}
				}
				
				Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置

				try {

					PreparedStatement pstmt = null;
					String sqlPass ="UPDATE IBS.T3_BRANCH_DX_ZB SET STUS='3',VERIFY_PEOPLE=?, VERIFY_TIME=?, VER_REMARK=coalesce(VER_REMARK,'')||'审批时间'||?||'审批工号'||?||'审批理由页面批复通过。' " +
							"WHERE BRANCH_ORG_ID = ? AND YEAR=? AND EXAM_Q=? AND EFF_FLAG='1' and STUS='1' AND PROJCT_NM=? AND ZB_NM=? " ;
					
					System.out.println("sqlPass="+sqlPass);
					System.out.println("user_id="+user_id+"dts="+dts+"brachOrgId"+brachOrgId+"year="+year+"examQ="+examQ+"projctNm="+projctNm+"zbNm="+zbNm);
					
					pstmt = conn.prepareStatement(sqlPass);
					pstmt.setString(1, user_id);
					pstmt.setString(2, dts);
					pstmt.setString(3, dts);
					pstmt.setString(4, user_id);
					pstmt.setString(5, brachOrgId);
					pstmt.setString(6, year);
					pstmt.setString(7, examQ);
					pstmt.setString(8, projctNm);
					pstmt.setString(9, zbNm);
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
		return "调用成功!!!";
	}
}

