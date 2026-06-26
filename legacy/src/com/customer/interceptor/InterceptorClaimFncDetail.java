package com.customer.interceptor;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.system.intercept.RowDataBean;
import com.wabacus.util.Consts;

/*基金认领*/
public class InterceptorClaimFncDetail extends AbsInterceptorDefaultAdapter {

	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		String txn_dtSt = rrequest.getStringAttribute("TXN_DT_ST", "");
		String txn_dtEnd = rrequest.getStringAttribute("TXN_DT_END", "");
		
		if(txn_dtSt==null || txn_dtEnd==null || txn_dtSt.equals("") || txn_dtEnd.equals("")){
			rrequest.setAttribute("list_lazyload", "true");
			rrequest.setAttribute("list_lazyloadmessage", "现在是延迟读取，输入交易日期后点击查询按钮才加载相应条件的数据");
			rrequest.authorize("list", Consts.BUTTON_PART, "sub", "disabled", "true");
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
