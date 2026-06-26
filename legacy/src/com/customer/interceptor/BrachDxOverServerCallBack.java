
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

public class BrachDxOverServerCallBack implements IServerAction {
	
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
		String brachOrgId = (String) rrequest.getRequest().getSession().getAttribute("org_id");
		String exam_msr_dt = (String) rrequest.getRequest().getSession().getAttribute("exam_msr_dt");
		String ip = (String) rrequest.getRequest().getSession().getAttribute("ip");
		
		Date date = new Date();
//		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
//		String dt = dateformat.format(date);

		SimpleDateFormat dateformat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dts = dateformat1.format(date);
		
		
		
		Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
		try {

			PreparedStatement pstmt = null;
			PreparedStatement pstmtSh = null;
			PreparedStatement pstmtDx = null;
			
			//判断是否有审核
			String sqlSh ="select count(1) as cnt from IBS.T3_BRANCH_DX_ZB " +
			"WHERE BRANCH_ORG_ID = ?  AND MEASURE_DT=? AND EFF_FLAG='1' AND STUS='3' " ;
			
			//结束
			String sqlOver ="UPDATE IBS.T3_BRANCH_DX_ZB SET ISOVER='1' ,MODIFY_PEOPLE=? ,MODIFY_TIME=? ,MODIFY_IP=? " +
					"WHERE BRANCH_ORG_ID = ?  AND MEASURE_DT=? AND EFF_FLAG='1' " ;
			
			//生成定性打分表
			String sqlDx = "insert into ibs.T2_EMP_DX_SCORE(MSR_PRD_DT,EXAM_YEAR,EXAM_Q,EMP_ID,EMP_NM,ORG_ID,ORG_NM,PSTN_TYPE,PSTN_TYPE_NM,SUB_PSTN_TYPE,SUB_PSTN_TYPE_NM,BRANCH_ORG_ID,BRANCH_ORG_NM,PROJCT_NM,ZB_NM,ZB_SCORE,SCORE,STUS) " +
					"select em.MEASURE_DT,zb.YEAR,zb.EXAM_Q ,em.EMP_ID,em.EMP_NM,em.ORG_ID,em.ORG_NM,em.PSTN_TYPE,em.PSTN_TYPE_NM,em.SUB_PSTN_TYPE,em.SUB_PSTN_TYPE_NM,em.BRANCH_ORG_ID,em.BRANCH_ORG_NM,zb.PROJCT_NM,zb.ZB_NM,zb.SCORE as ZB_SCORE,0 as SCORE,'-1' as STUS " +
					"from ibs.T5_EMP_BZJX em " +
					"left join ibs.T3_BRANCH_DX_ZB zb on zb.MEASURE_DT=em.MEASURE_DT and em.BRANCH_ORG_ID=zb.BRANCH_ORG_ID and zb.EFF_FLAG='1' and zb.STUS='3' and zb.ISOVER='1' " +
					"where em.MEASURE_DT=? and em.BRANCH_ORG_ID=? ";
			
			System.out.println("sqlSh="+sqlSh);
			
			pstmtSh = conn.prepareStatement(sqlSh);
			
			pstmtSh.setString(1, brachOrgId);
			pstmtSh.setString(2, exam_msr_dt);
			ResultSet resultSetSh = pstmtSh.executeQuery();
			
			int cnt = 0;
			if(resultSetSh.next()){
				cnt=resultSetSh.getInt("cnt");
				if(cnt>0){
					System.out.println("sqlOver="+sqlOver);
					pstmt = conn.prepareStatement(sqlOver);
					pstmt.setString(1, user_id);
					pstmt.setString(2, dts);
					pstmt.setString(3, ip);
					pstmt.setString(4, brachOrgId);
					pstmt.setString(5, exam_msr_dt);
					pstmt.executeUpdate();
					pstmt.close();
					
					
					System.out.println("sqlDx="+sqlDx);
					pstmtDx = conn.prepareStatement(sqlDx);
					pstmtDx.setString(1, exam_msr_dt);
					pstmtDx.setString(2, brachOrgId);
					pstmtDx.executeUpdate();
					pstmtDx.close();
					
					
				}else{
					rrequest.getWResponse().getMessageCollector().alert("没有审核通过的数据，无法结束！", "", false);
				}
				//System.out.println("-----------------这里");
				pstmtSh.close();
				resultSetSh.close();
			}else{
				rrequest.getWResponse().getMessageCollector().alert("没有审核通过的数据，无法结束！", "", false);
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
		
		
		rrequest.getWResponse().getMessageCollector().success("数据处理完成！", "", false);
		return "成功!!!";
	}
}

