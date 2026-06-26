package com.customer.interceptor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.wabacus.config.Config;
import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.component.application.report.abstractreport.AbsReportType;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.system.intercept.RowDataBean;

/*存款认领校验页面*/
public class InterceptorClaimGold extends AbsInterceptorDefaultAdapter {

	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		String vuch_nbr = rrequest.getStringAttribute("VUCH_NBR", "");// 取出凭证号
//		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
//		String user_name = (String) rrequest.getRequest().getSession().getAttribute("user_name");
//		String usr_org_id = (String) rrequest.getRequest().getSession().getAttribute("usr_org_id");
//		String usr_org_nm = (String) rrequest.getRequest().getSession().getAttribute("usr_org_nm");

		Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();

		
		
		if (vuch_nbr.equals("")) {
			rrequest.setAttribute("list_lazyload", "true");
			rrequest.setAttribute("list_lazyloadmessage", "现在是延迟读取，输入凭证号后点击查询按钮才加载相应条件的数据");
			//rrequest.authorize("dtl", null, null, "display", "false");
			
		} else {
			try {
				String SQL_BUTTON = "select count(1) as cnt from IBS.GOLD_EMP_RELA where VUCH_NBR=? ";
				PreparedStatement pt = conn.prepareStatement(SQL_BUTTON, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
				pt = conn.prepareStatement(SQL_BUTTON);
				pt.setString(1, vuch_nbr);
				//pt.setString(2, user_id);
				ResultSet resultSetSQL_BUTTON = pt.executeQuery();
				while (resultSetSQL_BUTTON.next()) {
//					if (resultSetSQL_BUTTON.getInt("cnt") > 0) {
//						rrequest.authorize("dtl", Consts.BUTTON_PART, "type{save}", "disabled", "true");
//						rrequest.authorize("dtl", Consts.BUTTON_PART, "sub", "disabled", "true");
//						rrequest.setAttribute("dtl_ACCESSMODE", "readonly");
//
//					}
					if (resultSetSQL_BUTTON.getInt("cnt") == 0) {
						//rrequest.authorize("dtl", null, null, "display", "false");
						rrequest.getWResponse().getMessageCollector().error("输入凭证号不存在或批量原因，新开户的凭证号，请明日再试。）", "", false);
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
	        if(rowDataBean.getRowindex()<0)
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
	        }
	    }

}
