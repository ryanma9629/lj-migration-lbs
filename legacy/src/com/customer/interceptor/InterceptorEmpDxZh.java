package com.customer.interceptor;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.component.application.report.abstractreport.AbsReportType;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;
import com.wabacus.system.intercept.RowDataBean;

public class InterceptorEmpDxZh extends AbsInterceptorDefaultAdapter {
	
	@Override
	public Object beforeLoadData(ReportRequest rrequest, ReportBean rbean, Object typeObj, String sql) {
		
		String exam_msr_dt = (String) rrequest.getRequest().getSession().getAttribute("exam_msr_dt");
        if(!exam_msr_dt.equals("")){
    		String sql1 = "MSR_PRD_DT='"+exam_msr_dt+"' ";
			sql = sql.replaceAll("%SQL%", sql1);
			
		}
        return sql;
	}
	
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

			if (!"支行已提交".equals((rowDataBean.getColData("STUS")))) {
				rowDataBean.setReadonly(true);
			}
			
			if("已保存".equals(rowDataBean.getColData("STUS")) || "未评分".equals(rowDataBean.getColData("STUS")))
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
		//rrequest.authorize("branch_dx_mod", null, null, "readonly", "true");
	}

	@Override
	public void doEnd(ReportRequest rrequest, ReportBean rbean) {
		
	}
}
