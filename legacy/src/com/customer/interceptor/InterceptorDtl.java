package com.customer.interceptor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.wabacus.config.Config;
import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.util.Consts;

/*存款认领校验页面*/
public class InterceptorDtl extends AbsInterceptorDefaultAdapter {

	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		String vuch_nbr = rrequest.getStringAttribute("VUCH_NBR", "");// 取出凭证号
		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		System.out.println("VUCH_NBR-----" + vuch_nbr + " and  user_id----"	+ user_id);
		Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
		
		if (!vuch_nbr.equals("")) {
//			Connection conn = rrequest.getConnection();
			
			try{

		        PreparedStatement pstmt=null;
				String SQL="select count(1) as cnt from IBS.T1_VUCH_EMP_RELA where VUCH_NBR=? AND EMP_ID=?";
				String SQL_INSERT ="INSERT INTO IBS.T1_VUCH_EMP_RELA (VUCH_NBR, EMP_ID, RATIO) VALUES(?, ?, '0')";
				PreparedStatement pstmt1 = null;
				pstmt1 = conn.prepareStatement(SQL);
				pstmt1.setString(1, vuch_nbr);
				pstmt1.setString(2, user_id);
				ResultSet resultSetSQL = pstmt1.executeQuery();
				while (resultSetSQL.next()){
					if (resultSetSQL.getInt("cnt") == 0){
						
						System.out.println("没有填写过认领信息， 准备执行SQL_INSERT插入一条凭证+员工号的认领信息");
						pstmt1 = conn.prepareStatement(SQL_INSERT);
						pstmt1.setString(1, vuch_nbr);
						pstmt1.setString(2, user_id);
						pstmt1.executeUpdate();
						System.out.println("完成 执行SQL_INSERT插入一条凭证+员工号的认领信息");
					}
					else {
						System.out.println("已经有凭证认领信息填写过，不插入新数据");
					}
				}
				String SQL1 = "select count(1) as cnt from IBS.T1_VUCH_EMP_RELA where CLAIM_STATUS_ID IN ('1', '2') AND VUCH_NBR=? AND EMP_ID=?";
				pstmt1 = conn.prepareStatement(SQL1);
				pstmt1.setString(1, vuch_nbr);
				pstmt1.setString(2, user_id);
				ResultSet resultSetSQL1 = pstmt1.executeQuery();
				while (resultSetSQL1.next()){
					if (resultSetSQL1.getInt("cnt") > 0){
						rrequest.authorize("dtl", Consts.BUTTON_PART, "type{save}",	"disabled", "true");
						rrequest.authorize("dtl", Consts.BUTTON_PART, "sub", "disabled", "true");
						rrequest.setAttribute("dtl_ACCESSMODE", "readonly");
					}
				}
				resultSetSQL1.close();
				resultSetSQL.close();
				pstmt1.close();
//				conn.close();
			}catch (Exception e) {
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
		System.out.println(new Date() + "存款认领dtl校验页面:::执行完前置动作------------------");
	}

	@Override
	public void doEnd(ReportRequest rrequest, ReportBean rbean) {

		System.out.println(new Date() + "存款认领dtl校验页面:::执行后置动作------------------");
	}
}
