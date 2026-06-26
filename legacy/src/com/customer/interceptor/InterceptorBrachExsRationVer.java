package com.customer.interceptor;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.component.application.report.abstractreport.AbsReportType;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.system.intercept.RowDataBean;

public class InterceptorBrachExsRationVer extends AbsInterceptorDefaultAdapter {
	
	
	
	@Override
	public void beforeDisplayReportDataPerRow(ReportRequest rrequest,
			ReportBean rbean, RowDataBean rowDataBean) {
		if (rowDataBean.getRowindex() < 0) {// 当前是在显示标题行
			return;
		}
		AbsReportType reportTypeObj = rrequest.getDisplayReportTypeObj(rbean
				.getId());
		if (reportTypeObj.getLstReportData() != null
				&& rowDataBean.getRowindex() < reportTypeObj.getLstReportData()
						.size()) {
			
			if ("审核通过".equals((rowDataBean.getColData("STUS")))) {
				//rowDataBean.setReadonly(true);
				
				//rrequest.authorize("select","data","sh_zt_btn","disabled","true");
				//rrequest.authorize("select",Consts.BUTTON_PART,"noPassBtn","disabled","true");
			}
			
			if("等待审核".equals(rowDataBean.getColData("STUS")))
            {
                String styleproperty=rowDataBean.getRowstyleproperty();
                if(styleproperty==null) styleproperty="";
                styleproperty+=" style='color:red'";
                rowDataBean.setRowstyleproperty(styleproperty);
            }
		}
		
		
	}

	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		
		String isExam = (String) rrequest.getRequest().getSession().getAttribute("isExam");
		//不是考核期
		if(isExam.equals("0")){
			
			rrequest.authorize("select", "button", "button1", "disabled", "true");
			rrequest.authorize("select", "button", "sub", "disabled", "true");
		}
	}

	@Override
	public void doEnd(ReportRequest rrequest, ReportBean rbean) {
		
	}
}
