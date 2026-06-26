
package com.customer.interceptor;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;

public class InterceptorEmpProfitSmyUser extends AbsInterceptorDefaultAdapter
{
	
	@Override
	public Object beforeLoadData(ReportRequest rrequest, ReportBean rbean, Object typeObj, String sql) {
		
		String examQ = rrequest.getStringAttribute("MEASURE_QTD", "");
		String examY = rrequest.getStringAttribute("MEASURE_YEAR", "");
		examQ=examQ==null?"":examQ;
		
		if(!"".equals(examQ)){
			sql = sql.replaceAll("%SQLExamQ%", "and sw.MEASURE_DT like '%"+examQ+"'");
			sql = sql.replaceAll("%SQLExamQgd%", "and gd.MEASURE_DT like '%"+examQ+"'");
			sql = sql.replaceAll("%SQLExamQtz%", "and CHG_DT like '%"+examQ+"'");
			sql = sql.replaceAll("%SQLExamCol%", "'"+examY+"-"+examQ+"'");
			sql = sql.replaceAll("%INNERSQL%"," ");
		}else{
			sql = sql.replaceAll("%SQLExamQ%", " ");
			sql = sql.replaceAll("%SQLExamQgd%", "and gd.MEASURE_DT like '%12-31'");
			sql = sql.replaceAll("%SQLExamQtz%", " ");
			sql = sql.replaceAll("%SQLExamCol%", examY);
			sql = sql.replaceAll("%INNERSQL%"," inner join (select max(MEASURE_DT) as exam_msr_dt from ibs.T99_MIDDLE_INCOME_SWITCH where MEASURE_DT like '"+examY+"%') t on t.exam_msr_dt=bz.MEASURE_DT");
		}
		
        return sql;
		
	}

	@Override
	public void doEnd(ReportRequest rrequest,ReportBean rbean){
	    	
	}
	
    
}
