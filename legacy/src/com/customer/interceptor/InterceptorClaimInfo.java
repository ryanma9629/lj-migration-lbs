package com.customer.interceptor;

import java.util.Date;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;

/*存款认领校验页面*/
public class InterceptorClaimInfo extends AbsInterceptorDefaultAdapter {

	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		String vuch_nbr = rrequest.getStringAttribute("VUCH_NBR", "");// 取出凭证号
		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		System.out.println("VUCH_NBR-----" + vuch_nbr + " and  user_id----"	+ user_id);

		if (vuch_nbr.equals("")) {
			rrequest.setAttribute("select_lazyload", "true");
			rrequest.setAttribute("select_lazyloadmessage",	"现在是延迟读取，输入凭证号后点击查询按钮才加载相应条件的数据");
			rrequest.authorize("dtl", null, null, "display", "false");
		
		}
		System.out.println(new Date() + "认领信息明细:::执行完前置动作------------------");
	}

	@Override
	public void doEnd(ReportRequest rrequest, ReportBean rbean) {

		System.out.println(new Date() + "认领信息明细:::执行后置动作------------------");
	}
}
