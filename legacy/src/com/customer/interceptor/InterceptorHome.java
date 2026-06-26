package com.customer.interceptor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;


/*存款认领校验页面*/
public class InterceptorHome extends AbsInterceptorDefaultAdapter {

	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");

		Connection conn1 = rrequest.getConnection();
		PreparedStatement pstmt1 = null;
		try {
				String SQL = "select count(1) as cnt from CST.SYS_C_SEC_USER_GROUP where USER_ID='"+user_id+"' and GROUP_ID='branch_fuhz_060'";
				System.out.println("home is display="+SQL);
				pstmt1 = conn1.prepareStatement(SQL);
				ResultSet resultSet1 = pstmt1.executeQuery();
				while(resultSet1.next()) {
					int cnt = resultSet1.getInt("cnt");
					if(cnt>0){
						rrequest.authorize("vp2", null, null, "display", "true"); 
						//rrequest.authorize("tab1",Consts.DATA_PART,"1","display","true");
					}else{
	             		rrequest.authorize("vp2", null, null, "display", "false");
						//rrequest.authorize("tab1",Consts.DATA_PART,"1","display","false");
	             	}
             	}
                
				resultSet1.close();
				pstmt1.close();
			} 
		catch (Exception e) {
				e.printStackTrace();
		}
		

	}

	@Override
	public void doEnd(ReportRequest rrequest, ReportBean rbean) {

		
	}

}
