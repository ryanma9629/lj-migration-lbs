package com.customer.interceptor;

import com.ljbank.market.Util;
import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.component.application.report.abstractreport.AbsReportType;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.system.intercept.RowDataBean;

/*存款认领dtl校验页面*/
public class InterceptorClaimDepDtl extends AbsInterceptorDefaultAdapter {

	@Override
	public void beforeDisplayReportDataPerRow(ReportRequest rrequest,
			ReportBean rbean, RowDataBean rowDataBean) {
		if (rowDataBean.getRowindex() < 0) {// 当前是在显示标题行
			return;
		}
		AbsReportType reportTypeObj = rrequest.getDisplayReportTypeObj(rbean.getId());
		if (reportTypeObj.getLstReportData() != null && rowDataBean.getRowindex() < reportTypeObj.getLstReportData().size()) {


			String remark= String.valueOf(rowDataBean.getColData("REMARK"));
			if(!remark.equals("")){

				Util u = new Util();
				System.out.println("remark="+remark);
				remark = u.turnStrREMARK(remark);
				System.out.println("装换后remark="+remark);
				rowDataBean.setColData("REMARK", remark);// 转为string才行
			}

			


		}
	}
}
