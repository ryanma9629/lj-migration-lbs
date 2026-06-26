package com.customer.interceptor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.wabacus.config.Config;
import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.system.intercept.RowDataBean;
import com.wabacus.util.Consts;

/*基金认领*/
public class InterceptorClaimFncDitlTxn extends AbsInterceptorDefaultAdapter {

	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		String txn_no = rrequest.getStringAttribute("txnNoPam","");
		//String inpRo = rrequest.getStringAttribute("RATIO");
		String txn_dt = rrequest.getStringAttribute("txnDtPam","");
		String emp_id = rrequest.getStringAttribute("empIdPam","");
		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		String user_name = (String) rrequest.getRequest().getSession().getAttribute("user_name");
		String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
		String usr_org_nm = (String) rrequest.getRequest().getSession().getAttribute("usr_org_nm");
		
		
//		rrequest.getRequest().getSession().setAttribute("txnNoPam", txn_no);
//		rrequest.getRequest().getSession().setAttribute("txnDtPam", txn_dt);
//		rrequest.getRequest().getSession().setAttribute("emp_id", emp_id);
		
		Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
		
		if(txn_dt!=null && !txn_dt.equals("")){
			
			String SQL_BUTTON = "Select count(1) as cnt,coalesce(sum(case when CLAIM_STATUS_ID in ('1','2','5','6','21') then RATIO else 0 end),0) as val_ro,coalesce(sum(case when EMP_ID =? then 1 else 0 end),0) as self,coalesce(sum(case when EMP_ID='000000' then 1 else 0 end),0) as is_inst,coalesce(sum(case when CLAIM_STATUS_ID in ('1','2','5','6','21') and EMP_ID =? then 1 else 0 end),0) as self_val " +
					"from IBS.T1_FNC_TXN_EMP_RELA where TXN_NO=? and TXN_DT=? ";
			System.out.println("SQL="+SQL_BUTTON);
			
			PreparedStatement pt;
			try {
				pt = conn.prepareStatement(SQL_BUTTON, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
				pt = conn.prepareStatement(SQL_BUTTON);
				pt.setString(1, user_id);
				pt.setString(2, user_id);
				pt.setString(3, txn_no);
				pt.setString(4, txn_dt);
				
				ResultSet resultSetSQL_BUTTON = pt.executeQuery();
				while (resultSetSQL_BUTTON.next()) {
					
					if (resultSetSQL_BUTTON.getInt("cnt") == 0 || resultSetSQL_BUTTON.getDouble("val_ro")==100 || resultSetSQL_BUTTON.getInt("self_val")>0) {
						rrequest.getWResponse().getMessageCollector().error("输入的流水号或凭证号不存在， 或已被认领，若是当日的交易，请明日再试。", false);
					}
					int a = resultSetSQL_BUTTON.getInt("cnt");
					
					int b = resultSetSQL_BUTTON.getInt("is_inst");
					int c = resultSetSQL_BUTTON.getInt("self");
					
					double d = resultSetSQL_BUTTON.getDouble("val_ro");
					if(resultSetSQL_BUTTON.getInt("cnt") > 0 && resultSetSQL_BUTTON.getInt("is_inst")!=1 && resultSetSQL_BUTTON.getInt("self")==0 && resultSetSQL_BUTTON.getDouble("val_ro")!=100) {
						String SQL_INSRT = "insert into ibs.T1_FNC_TXN_EMP_RELA(TXN_NO,VUCH_NBR,EMP_ID,RATIO,CLAIM_STATUS_ID,ORG_ID,ORG_NM,CST_NM,IDENTN_NO,BIZ_TYPE_CD,BIZ_TYPE_NM,TXN_DT,EMP_NM,EMP_ORG_ID,EMP_ORG_NM,TXN_AMT,PRD_CD,PRD_NM)" +
						"select TXN_NO , VUCH_NBR, ?,0,'7', ORG_ID, ORG_NM, CST_NM, IDENTN_NO, BIZ_TYPE_CD, BIZ_TYPE_NM, TXN_DT, ?, ?, ?, TXN_AMT, PRD_CD, PRD_NM " +
						"from ibs.T1_FNC_TXN_EMP_RELA where TXN_NO=? and TXN_DT=? fetch first 1 row only";
						System.out.println("SQL="+SQL_INSRT);
						PreparedStatement pstmt = conn.prepareStatement(SQL_INSRT);
						pstmt.setString(1, user_id); 
						pstmt.setString(2, user_name);
						pstmt.setString(3, usr_org_id);
						pstmt.setString(4, usr_org_nm);
						pstmt.setString(5, txn_no);
						pstmt.setString(6, txn_dt);
						
						pstmt.executeUpdate();
						pstmt.close();
					}
				}
				resultSetSQL_BUTTON.close();
				pt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		

	}

	@Override
	public void doEnd(ReportRequest rrequest, ReportBean rbean) {

	}
	
	@Override
	   public void beforeDisplayReportDataPerRow(ReportRequest rrequest,ReportBean rbean,RowDataBean rowDataBean)
	    {
	        /*if(rowDataBean.getRowindex()<0)
	        {//当前是在显示标题行
	            return;
	        }
	        AbsReportType reportTypeObj=rrequest.getDisplayReportTypeObj(rbean.getId());
	        if(reportTypeObj.getLstReportData()!=null&&rowDataBean.getRowindex()<reportTypeObj.getLstReportData().size())
	        {
	            if( ((String)rowDataBean.getColData("CLAIM_STATUS_ID")).trim().equals("7")||((String)rowDataBean.getColData("CLAIM_STATUS_ID")).trim().equals("0") ||((String)rowDataBean.getColData("CLAIM_STATUS_ID")).trim().equals("3"))
	            {
	                String styleproperty=rowDataBean.getRowstyleproperty();
	                if(styleproperty==null) styleproperty="";
	                styleproperty+=" style='color:red'";
	                rowDataBean.setRowstyleproperty(styleproperty);
	            }
	        }*/
	    }

}
