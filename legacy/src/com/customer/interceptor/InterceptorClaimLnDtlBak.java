package com.customer.interceptor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;

/*贷款认领dtl校验页面*/
public class InterceptorClaimLnDtlBak extends AbsInterceptorDefaultAdapter {
	
	@Override
	public Object beforeLoadData(ReportRequest rrequest, ReportBean rbean, Object typeObj, String sql) {
		String vuch_nbr = rrequest.getStringAttribute("VUCH_NBR", "");// 取出借据号
		String emp_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");//取出登录人的工号
		System.out.println("贷款认领dtl校验页面");
        System.out.println(":::VUCH_NBR="+vuch_nbr +"EMP_ID="+emp_id);
		Connection conn = rrequest.getConnection();
		PreparedStatement pstmt = null;
		try{
			String SQL_RELA = "select count(1) as cnt from IBS.T1_VUCH_EMP_RELA where VUCH_NBR=? AND EMP_ID=?";
			String SQL_INSERT = "INSERT INTO IBS.T1_VUCH_EMP_RELA (VUCH_NBR, EMP_ID, RATIO, CLAIM_STATUS_ID, REMARK, REMARK1 ) VALUES(?, ?, '0', '0', '', '')";
			System.out.println("----------sql初始值："+sql);
			pstmt = conn.prepareStatement(SQL_RELA);
			pstmt.setString(1, vuch_nbr);
			pstmt.setString(2, emp_id);
			ResultSet resultSetSQL_RELA = pstmt.executeQuery();
			while (resultSetSQL_RELA.next()) {
				if (resultSetSQL_RELA.getInt("cnt") == 0) {

					System.out.println("没有填写过认领信息， 准备执行SQL替换");
					/*没有填写过认领信息*/
		    		String sql1 ="SELECT '" + vuch_nbr + "' as VUCH_NBR , '" + emp_id +"' as EMP_ID ,EMP_NM ,ORG_ID ,ORG_NM ,'0' as RATIO ,'0' as CLAIM_STATUS_ID ,'' as CLAIM_DT ,'' as VERIFY_DT ,'' as VERIFY_EMP_ID ,'' as REMARK , '' as REMARK1 , '' as DT_EMP_ID FROM IBS.T5_EMP WHERE EMP_ID="+emp_id ;
					sql = sql.replaceAll("%SELECT_SQL%", sql1);
					
					sql = sql.replaceAll("UPDATE_SQL", SQL_INSERT);
					System.out.println("替换sql为:"+sql);
					
				} else {
//					/*填写过认领信息*/
					System.out.println("填写过认领信息， 准备执行SQL替换");
//		    		String sql1 ="SELECT A.VUCH_NBR ,A.EMP_ID ,B.EMP_NM ,B.ORG_ID ,B.ORG_NM ,A.RATIO ,A.CLAIM_STATUS_ID ,A.CLAIM_DT ,A.VERIFY_DT ,A.VERIFY_EMP_ID ,COALESCE(A.REMARK,'') AS REMARK ,COALESCE(A.REMARK1,'') AS REMARK1 ,C.EMP_ID AS DT_EMP_ID FROM IBS.T1_VUCH_EMP_RELA A LEFT JOIN IBS.T5_EMP B ON A.EMP_ID=B.EMP_ID LEFT JOIN IBS.T1_LN_LOBBY_MANAGER_RELA C ON A.EMP_ID=C.MANAGER_EMP_ID AND A.VUCH_NBR=C.BIZ_DIL_NBR WHERE A.EMP_ID"+emp_id +"AND A.VUCH_ID="+vuch_nbr;
//					sql = sql.replaceAll("%SELECT_SQL%", sql1);
//					System.out.println("替换sql为:"+sql);
					
					
				}
			}
			resultSetSQL_RELA.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
//        if(!vuch_nbr.equals("")||!emp_id.equals("")){
//
//    		
//			sql = sql.replaceAll("%SQL%", sql1);
//			
//		}
        return sql;

	}
	
}
