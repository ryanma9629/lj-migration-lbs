<%@ page contentType="text/html; charset=UTF-8"
	import="com.customer.security.Login,com.customer.security.WSLogin,com.wabacus.system.ReportRequest,org.apache.log4j.Logger"%>
<%! public static final String QUERY_PARAM="queryParam"; %>
<%
    Logger log=Logger.getLogger(this.getClass());
	//获取login.html提交来的信息
	String user_id = request.getParameter("TxtUserID");
	String password = request.getParameter("TxtPassword");
	//从单点登录中获得验证
	String ICMS_SSO_USER_TOKEN=request.getParameter("ICMS_SSO_USER_TOKEN");
	String user_id2=request.getParameter("UserId");
//	out.print("token and userid:"+user_id2+ICMS_SSO_USER_TOKEN);
//	WSLogin wsl=new WSLognin();
    String isLegal = "passErr";
    if(""==ICMS_SSO_USER_TOKEN||null==ICMS_SSO_USER_TOKEN){
	Login login = new Login();
	 isLegal= login.checkPrivilege(user_id, password,  request,response);
	}else{
    //log.info(user_id2+ICMS_SSO_USER_TOKEN);
    log.info(user_id2);
    log.info(ICMS_SSO_USER_TOKEN);
   isLegal=com.customer.security.WSLogin.wsLogin(user_id2,ICMS_SSO_USER_TOKEN, request,response);
    }
	if (isLegal.equals("passOK")) {//request.getContextPath()
		String continue_url=(String)session.getAttribute("continue_url");
		response.sendRedirect(continue_url==null?request.getContextPath():continue_url);
		System.out.print("continue_url============"+continue_url);
		//out.print("<script>window.parent.location.href='"+request.getContextPath()+"'</script>");
	} else if(isLegal.equals("relNO"))
	//登录失败,或者没设置登录权限，回到首页。
	{
		out.print("<script>window.location.href='loginRelError.html'</script>");
	}else{
		out.print("<script>window.location.href='loginError.html'</script>");
	}
%>