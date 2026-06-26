package com.customer.interceptor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;

/*存款认领校验页面*/
public class InterceptorOtherDtl extends AbsInterceptorDefaultAdapter {

	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		String vuch_nbr = rrequest.getStringAttribute("VUCH_NBR", "");// 取出凭证号
		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		System.out.println("VUCH_NBR-----" + vuch_nbr + " and  user_id----"	+ user_id);

		/************************ 判断输入凭证号是否有他人认领信息 ***************************/

			Connection conn = rrequest.getConnection();
			PreparedStatement pstmt = null;
			try {
				// SQL是否存在输入的凭证号
				String SQL = "select count(1) as cnt from IBS.T1_VUCH_EMP_RELA where CLAIM_STATUS_ID IN ('1', '2') AND VUCH_NBR=? AND EMP_ID<>?";
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, vuch_nbr);
				pstmt.setString(2, user_id);
				ResultSet resultSet = pstmt.executeQuery();
				while (resultSet.next()) {
					if (resultSet.getInt("cnt") < 1) {
						// 此凭证没有他人认领信息
						rrequest.authorize("other_dtl", null, null, "display", 	"false");
						System.out.println("此凭证没有他人认领信息，report id='other_dtl' 页面被屏蔽，不显示");
					}
					
						
					
				}
				
				resultSet.close();
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		
		System.out.println(new Date() + "存款认领other_dtl校验页面:::执行完前置动作------------------");
	}

	@Override
	public void doEnd(ReportRequest rrequest, ReportBean rbean) {

		System.out.println(new Date() + "存款认领other_dtl校验页面:::执行后置动作------------------");
	}
}
