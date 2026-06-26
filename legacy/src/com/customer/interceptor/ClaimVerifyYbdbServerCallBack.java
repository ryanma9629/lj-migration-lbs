/* 
 * Copyright (C) 2010-2012 星星<349446658@qq.com>
 * 
 * This file is part of Wabacus 
 * 
 * Wabacus is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
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

public class ClaimVerifyYbdbServerCallBack implements IServerAction {
	
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

		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");// 审核人
		Date date = new Date();
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
		String dt = dateformat.format(date);

		SimpleDateFormat dateformat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dts = dateformat1.format(date);
		
		String insure_no = "";
		String emp_id = "";
		String insure_dt = "";
		
		/*客户端传入参数列表*/
		if (lstData == null || lstData.size() == 0) {
			System.out.println("无参数");
		} else {
			//System.out.println("客户端传入参数列表：：：");
			for (Map<String, String> mParams : lstData) {
				for (Entry<String, String> entryTmp : mParams.entrySet()) {
					if (entryTmp.getKey().equals("INSURE_NO")) {
						insure_no = entryTmp.getValue();
					}
					if (entryTmp.getKey().equals("EMP_ID")) {
						emp_id = entryTmp.getValue();
					}
					if (entryTmp.getKey().equals("INSURE_DATE")) {
						insure_dt = entryTmp.getValue();
					}
				}
				
				Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
				try {

					PreparedStatement pstmt = null;
					String sql = "UPDATE IBS.T1_YBDB_EMP_RELA SET CLAIM_STATUS_ID='2' "
							+ ", VERIFY_DT=?"
							+ ", VERIFY_EMP_ID=? "
							+ ", REMARK=REMARK||'审批时间'||?||'审批工号'||?||'审批理由页面批复通过。' "
							+ "WHERE CLAIM_STATUS_ID='1' "
							+ "AND INSURE_NO=? "
							+ "AND EMP_ID=? "
							+ "AND INSURE_DATE=? ";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, dt);
					pstmt.setString(2, user_id);
					pstmt.setString(3, dts);
					pstmt.setString(4, user_id);
					pstmt.setString(5, insure_no);
					pstmt.setString(6, emp_id);
					pstmt.setString(7, insure_dt);
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
						e.printStackTrace();
					}
				}

			}

		}
		rrequest.getWResponse().getMessageCollector().success("数据处理完成！",false);
		return "调用成功!!!";
	}
}

