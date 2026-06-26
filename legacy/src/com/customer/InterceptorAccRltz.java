package com.customer;

import java.util.Date;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;

public class InterceptorAccRltz extends AbsInterceptorDefaultAdapter
{

    @Override
	public void doStart(ReportRequest rrequest,ReportBean rbean)
    {
        String ACC_ID=rrequest.getStringAttribute("ACC_ID","");//取出客户号
        System.out.println(":::ACC_ID------------------"+ACC_ID);
        if(ACC_ID.equals(""))
        {//如果两个条件框都没有输入值，则延迟加载
            rrequest.setAttribute("select_lazyload","true");
            rrequest.setAttribute("select_lazyloadmessage","现在是延迟读取，输入凭证号后点击查询按钮才加载相应条件的数据");

        }                   
        
        
        System.out.println(new Date()+":::执行完前置动作------------------");
    }

    @Override
	public void doEnd(ReportRequest rrequest,ReportBean rbean)
    {
        
         
    	
    	
    	System.out.println(new Date()+":::执行后置动作------------------");
    }
}
