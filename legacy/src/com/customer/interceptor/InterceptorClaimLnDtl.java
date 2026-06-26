package com.customer.interceptor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import com.wabacus.config.Config;
import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.util.Consts;

/*贷款认领dtl校验页面*/
public class InterceptorClaimLnDtl extends AbsInterceptorDefaultAdapter {
	
	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		String vuch_nbr = rrequest.getStringAttribute("VUCH_NBR", "");// 取出借据号
		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		

		System.out.println("VUCH_NBR-----" + vuch_nbr + " and  user_id----" + user_id);

		
		if (vuch_nbr.equals("")) {
			rrequest.setAttribute("select_lazyload", "true");
			rrequest.setAttribute("select_lazyloadmessage", "现在是延迟读取，输入借据号后点击查询按钮才加载相应条件的数据");
			rrequest.authorize("dtl", null, null, "display", "false");
		} else {

			Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
			try {

				String SQL_BUTTON = "select count(1) as cnt from IBS.T1_VUCH_EMP_RELA where VUCH_NBR=? AND EMP_ID=? ";
				PreparedStatement pt = conn.prepareStatement(SQL_BUTTON, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
				pt = conn.prepareStatement(SQL_BUTTON);
				pt.setString(1, vuch_nbr);
				pt.setString(2, user_id);
				ResultSet resultSetSQL_BUTTON = pt.executeQuery();
				while (resultSetSQL_BUTTON.next()) {
					if (resultSetSQL_BUTTON.getInt("cnt") == 0) {
						//rrequest.authorize("dtl", Consts.BUTTON_PART, "type{save}", "disabled", "true");
						rrequest.authorize("dtl", Consts.BUTTON_PART, "sub", "disabled", "true");
						rrequest.setAttribute("dtl_ACCESSMODE", "readonly");

					}
				}

				resultSetSQL_BUTTON.close();
				pt.close();
				 
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
				conn.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}
		System.out.println(new Date() + "贷款认领校验页面:::执行完前置动作------------------");
	}
	
}
