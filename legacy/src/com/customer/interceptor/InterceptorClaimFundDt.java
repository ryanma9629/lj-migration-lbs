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

/*基金定投认领*/
public class InterceptorClaimFundDt extends AbsInterceptorDefaultAdapter {

	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		String ser_no = rrequest.getStringAttribute("SERIAL_NO", "");
		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		String user_name = (String) rrequest.getRequest().getSession().getAttribute("user_name");
		String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
		String usr_org_nm = (String) rrequest.getRequest().getSession().getAttribute("usr_org_nm");

		Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();

		
		
		if (ser_no==null || ser_no.equals("")) {
			rrequest.setAttribute("dtl_lazyload", "true");
			rrequest.setAttribute("dtl_lazyloadmessage", "现在是延迟读取，输入定投协义编号后点击查询按钮才加载相应条件的数据");
			rrequest.authorize("dtl", Consts.BUTTON_PART, "sub", "disabled", "true");
			
		} else {
			try {
				String SQL_BUTTON = "Select count(1) as cnt,coalesce(sum(case when CLAIM_STATUS_ID in ('1','2','5','6','21') then RATIO else 0 end),0) as val_ro,coalesce(sum(case when EMP_ID =? then 1 else 0 end),0) as self,coalesce(sum(case when EMP_ID='000000' then 1 else 0 end),0) as is_inst,coalesce(sum(case when CLAIM_STATUS_ID in ('1','2','5','6','21') and EMP_ID =? then 1 else 0 end),0) as self_val from IBS.T1_FUND_DT_EMP_RELA where SERIAL_NO=? ";
				System.out.println("SQL="+SQL_BUTTON);
				PreparedStatement pt = conn.prepareStatement(SQL_BUTTON, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
				pt = conn.prepareStatement(SQL_BUTTON);
				pt.setString(1, user_id);
				pt.setString(2, user_id);
				pt.setString(3, ser_no);
				ResultSet resultSetSQL_BUTTON = pt.executeQuery();
				while (resultSetSQL_BUTTON.next()) {
//					if (resultSetSQL_BUTTON.getInt("cnt") > 0) {
//						rrequest.authorize("dtl", Consts.BUTTON_PART, "type{save}", "disabled", "true");
//						rrequest.authorize("dtl", Consts.BUTTON_PART, "sub", "disabled", "true");
//						rrequest.setAttribute("dtl_ACCESSMODE", "readonly");
//
//					}
					if (resultSetSQL_BUTTON.getInt("cnt") == 0 || resultSetSQL_BUTTON.getDouble("val_ro")==100 || resultSetSQL_BUTTON.getInt("self_val")>0) {
						//rrequest.authorize("dtl", null, null, "display", "false");
						rrequest.getWResponse().getMessageCollector().error("输入的证件号不存在， 或已被认领，若是当日的证件号，请明日再试。", "", false);
					}
					if(resultSetSQL_BUTTON.getInt("cnt") > 0 && resultSetSQL_BUTTON.getInt("is_inst")!=1 && resultSetSQL_BUTTON.getInt("self")==0 && resultSetSQL_BUTTON.getDouble("val_ro")!=100) {
						String SQL_INSRT = "insert into ibs.T1_FUND_DT_EMP_RELA(SERIAL_NO,VUCH_NBR,EMP_ID,RATIO,CLAIM_STATUS_ID,ORG_ID,ORG_NM,CST_NM,IDENTN_NO,TXN_DT,PRD_CD,PRD_NM,EMP_NM,EMP_ORG_ID,EMP_ORG_NM,TXN_AMT) " +
								"select SERIAL_NO,VUCH_NBR, ?,0,'7', ORG_ID, ORG_NM, CST_NM, IDENTN_NO, TXN_DT,PRD_CD,PRD_NM, ?, ?, ?,TXN_AMT from ibs.T1_FUND_DT_EMP_RELA where SERIAL_NO=? fetch first 1 row only";
						System.out.println("SQL="+SQL_INSRT);
						PreparedStatement pstmt = conn.prepareStatement(SQL_INSRT);
						pstmt.setString(1, user_id); 
						pstmt.setString(2, user_name);
						pstmt.setString(3, usr_org_id);
						pstmt.setString(4, usr_org_nm);
						pstmt.setString(5, ser_no);
						pstmt.executeUpdate();
						pstmt.close();
					}
				}
				resultSetSQL_BUTTON.close();
				pt.close();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
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
