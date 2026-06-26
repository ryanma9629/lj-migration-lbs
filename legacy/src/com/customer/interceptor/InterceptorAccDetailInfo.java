package com.customer.interceptor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;

/*凭证号下账户明细校验页面*/
public class InterceptorAccDetailInfo extends AbsInterceptorDefaultAdapter {
	
	@Override
	public Object beforeLoadData(ReportRequest rrequest,ReportBean rbean,Object typeObj,String sql)
    {
		String vuch_nbr = rrequest.getStringAttribute("VUCH_NBR", "");// 取出凭证号
		
		vuch_nbr=vuch_nbr==null?"":vuch_nbr;
		
        String dt_con=""; 
        String dt_in_con="";
        
        Connection conn = rrequest.getConnection();
		PreparedStatement pstmt = null;
		try {
				String SQL = "Select DATA_DT from IBS.T8_DATA_DT";
				pstmt = conn.prepareStatement(SQL);
				ResultSet resultSet = pstmt.executeQuery();
				while (resultSet.next()) {
                     dt_con=resultSet.getString("DATA_DT");
                }
				resultSet.close();
				pstmt.close();
			} 
		 catch (Exception e) {
				e.printStackTrace();
		 }
		
		 if(!dt_con.equals("")){
			 dt_in_con=dt_con.substring(0, 4)+dt_con.substring(5, 7)+dt_con.substring(8, 10);
		 }
		 sql=sql.replaceAll("%dt_con%","pf.MEASURE_DT=date('"+dt_con+"')");
		 sql=sql.replaceAll("%dt_in_con%","and dep.MSR_PRD_ID="+dt_in_con);
		 
		 if(!vuch_nbr.equals("")){
			 sql=sql.replaceAll("%suWhCon%"," where VUCH_NBR='"+vuch_nbr+"'"); 
		 }
        
		 return sql;
    }
	
	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		String vuch_nbr = rrequest.getStringAttribute("VUCH_NBR", "");// 取出凭证号
		String emp_id = rrequest.getStringAttribute("EMP_ID", "");// 取出凭证号

		if (vuch_nbr.equals("")&&emp_id.equals("")) {
			rrequest.setAttribute("select_lazyload", "true");
			rrequest.setAttribute("select_lazyloadmessage",	"现在是延迟读取，输入凭证号后点击查询按钮才加载相应条件的数据");
			//rrequest.authorize("dtl", null, null, "display", "false");
		
		}
		System.out.println(new Date() + "查询:::执行完前置动作------------------");
	}

	@Override
	public void doEnd(ReportRequest rrequest, ReportBean rbean) {

		System.out.println(new Date() + "查询:::执行后置动作------------------");
	}
}
