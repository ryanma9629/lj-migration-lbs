package com.customer.interceptor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.wabacus.config.Config;
import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.util.Consts;

/*认领审核不通过弹窗页面*/
public class InterceptorClaimFundVerifyNo extends AbsInterceptorDefaultAdapter {

	
	@Override
	public Object beforeLoadData(ReportRequest rrequest,ReportBean rbean,Object typeObj,String sql)
    {
		String vuch_no=rrequest.getStringAttribute("VUCH_NO","");
        String emp_id=rrequest.getStringAttribute("EMP_ID","");
        String txn_dt=rrequest.getStringAttribute("TXN_DT","");
        
        String p_sql = "select * from(select TXN_NO as VUCH_NO,'基金交易' as BIZ_NM, PRD_CD, PRD_NM, TXN_DT, CST_NM, TXN_AMT,BIZ_TYPE_CD ,BIZ_TYPE_NM, ORG_ID, ORG_NM, EMP_ID, EMP_ID as EMP_ID_Hid, CLAIM_STATUS_ID , EMP_NM, RATIO, CLAIM_DT, REMARK1, EMP_ORG_ID , EMP_ORG_NM "  
					+"from ibs.T1_FUND_TXN_EMP_RELA "
					+"where TXN_NO='"+vuch_no+"' and TXN_DT='"+txn_dt+"' and EMP_ID='"+emp_id+"' and CLAIM_STATUS_ID='1' "
					+"union all "
					+"select IDENTN_NO as VUCH_NO,'基金客户' as BIZ_NM,'' as PRD_CD,'' as PRD_NM, TXN_DT, CST_NM, 0 as TXN_AMT,'' as BIZ_TYPE_CD ,'客户签约' as BIZ_TYPE_NM, ORG_ID , ORG_NM , EMP_ID ,EMP_ID as EMP_ID_Hid, CLAIM_STATUS_ID, EMP_NM, RATIO, CLAIM_DT, REMARK1, EMP_ORG_ID , EMP_ORG_NM "   
					+"from ibs.T1_FUND_CST_EMP_RELA "
					+"where IDENTN_NO='"+vuch_no+"' and TXN_DT='"+txn_dt+"' and EMP_ID='"+emp_id+"' and CLAIM_STATUS_ID='1' "
					+"union all "
					+"select SERIAL_NO as VUCH_NO, '基金定投' as BIZ_NM, PRD_CD, PRD_NM, TXN_DT, CST_NM, TXN_AMT ,'' as BIZ_TYPE_CD ,'定投签约' as BIZ_TYPE_NM, ORG_ID , ORG_NM , EMP_ID ,EMP_ID as EMP_ID_Hid, CLAIM_STATUS_ID, EMP_NM, RATIO, CLAIM_DT, REMARK1 , EMP_ORG_ID , EMP_ORG_NM " 
					+"from ibs.T1_FUND_DT_EMP_RELA "
					+"where SERIAL_NO='"+vuch_no+"' and EMP_ID='"+emp_id+"' and TXN_DT='"+txn_dt+"' and CLAIM_STATUS_ID='1') ";
        sql=sql.replaceAll("%SQL%",p_sql);
        
		 System.out.println("sql="+sql);
		 return sql;
    }
	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		String vuch_no = rrequest.getStringAttribute("VUCH_NO", "");// 取出凭证号
		String emp_id = rrequest.getStringAttribute("EMP_ID", "");     // 取出认领人工号
		String txn_dt = rrequest.getStringAttribute("TXN_DT", "");     // 取出认领人工号
		
		Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
		
		if (!vuch_no.equals("")) {

			String SQL="select sum(cnt) as cnt from( "
			+"Select count(1) as cnt from ibs.T1_FUND_TXN_EMP_RELA where TXN_NO=? and EMP_ID=? and TXN_DT=? and CLAIM_STATUS_ID='3' "
			+"union all "
			+"Select count(1) as cnt from ibs.T1_FUND_CST_EMP_RELA where IDENTN_NO=? and EMP_ID=? and TXN_DT=? and CLAIM_STATUS_ID='3' "
			+"union all "
			+"Select count(1) as cnt from ibs.T1_FUND_DT_EMP_RELA where SERIAL_NO=? and EMP_ID=? and TXN_DT=? and CLAIM_STATUS_ID='3' )";

			try {

		        PreparedStatement pstmt=null;
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, vuch_no);
				pstmt.setString(2, emp_id);
				pstmt.setString(3, txn_dt);
				pstmt.setString(4, vuch_no);
				pstmt.setString(5, emp_id);
				pstmt.setString(6, txn_dt);
				pstmt.setString(7, vuch_no);
				pstmt.setString(8, emp_id);
				pstmt.setString(9, txn_dt);
				
				ResultSet resultSet = pstmt.executeQuery();
				while (resultSet.next()) {
					if(resultSet.getInt("cnt") == 1){
						//此流水号已未审通过
						rrequest.authorize("report", Consts.BUTTON_PART, "type{save}",	"disabled", "true");
						rrequest.authorize("report", Consts.BUTTON_PART, "button2", "disabled", "true");
						rrequest.authorize("report", Consts.BUTTON_PART, "type{reset}", "disabled", "true");
					}
				}
				resultSet.close();
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

	@Override
	public void doEnd(ReportRequest rrequest, ReportBean rbean) {
	}
}
