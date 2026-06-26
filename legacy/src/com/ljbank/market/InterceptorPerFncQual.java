package com.ljbank.market;

import com.ljbank.market.Util;
import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.component.application.report.abstractreport.AbsReportType;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.system.intercept.RowDataBean;

public class InterceptorPerFncQual extends AbsInterceptorDefaultAdapter {
	@Override
	public void beforeDisplayReportDataPerRow(ReportRequest rrequest,
			ReportBean rbean, RowDataBean rowDataBean) {
		if (rowDataBean.getRowindex() < 0) {// 当前是在显示标题行
			return;
		}
		AbsReportType reportTypeObj = rrequest.getDisplayReportTypeObj(rbean.getId());
		if (reportTypeObj.getLstReportData() != null && rowDataBean.getRowindex() < reportTypeObj.getLstReportData().size()) {
			Util u = new Util();
			
			String fenhang= String.valueOf(rowDataBean.getColData("BRANCH_ORG_NM"));
			fenhang = u.turnStr6(fenhang);
		//	System.out.println("分行换行后"+fenhang);
			rowDataBean.setColData("BRANCH_ORG_NM", fenhang);// 转为string才行
			
			String zhihang= String.valueOf(rowDataBean.getColData("ORG_NM"));
			zhihang = u.turnStr6(zhihang);
		//	System.out.println("支行换行后"+zhihang);
			rowDataBean.setColData("ORG_NM", zhihang);// 转为string才行
			
			String beizhu = String.valueOf(rowDataBean.getColData("REMARK"));
			beizhu = u.turnStr(beizhu);
		//	System.out.println("备注换行后"+beizhu);
			rowDataBean.setColData("REMARK", beizhu);// 转为string才行
			
			//QUAL_BANK_PUB_NUMBER 公共基础
			String ggjc= String.valueOf(rowDataBean.getColData("QUAL_BANK_PUB_NUMBER"));
			ggjc = u.turnStr(ggjc);
			rowDataBean.setColData("QUAL_BANK_PUB_NUMBER", ggjc);// 转为string才行
			
			//QUAL_BANK_NEW_FNC_NUMBER 个人理财
			String grlc= String.valueOf(rowDataBean.getColData("QUAL_BANK_NEW_FNC_NUMBER"));
			grlc = u.turnStr(grlc);
			rowDataBean.setColData("QUAL_BANK_NEW_FNC_NUMBER", grlc);// 转为string才行	
			//System.out.println("支行换行后"+grlc);


		}
	}
}
