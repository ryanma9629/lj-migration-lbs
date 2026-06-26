package com.customer.security;

import java.io.IOException;
import java.sql.*;

import javax.servlet.http.HttpSession;

import com.wabacus.system.*;
import com.wabacus.system.intercept.AbsPageInterceptor;

public class GlobalInterceptor extends AbsPageInterceptor {
	public void doStart(ReportRequest rrequest) {
		String pageid = rrequest.getPagebean().getId();
		HttpSession session = rrequest.getRequest().getSession();
		Connection conn = rrequest.getConnection();
		String user_id = (String) session.getAttribute("user_id");
		//xbs add start
//		String org_lvl="1";
//		String org_id =(String) session.getAttribute("org_id");
//		if (org_id.equals("9990")){
//			
//			session.setAttribute("org_lvl",org_lvl);
//		}
//		System.out.println("org_lvl"+org_lvl+":::"+(String) session.getAttribute("org_lvl"));
		//xbs add end
		
//		String ip= getRemoteIP(rrequest);
//		rrequest.getRequest().setAttribute("reqKey2", ip);
//	    System.out.println("getRemoteIP(rrequest)"+getRemoteIP(rrequest));
//	    System.out.println(rrequest.getRequest().getAttribute(ip));
//	    System.out.println(rrequest.getRequest().getAttribute("reqKey2"));
		if (user_id == null || "".equals(user_id)) {
			//用户没登陆则跳转到登陆页面
			session.setAttribute("continue_url", rrequest.getUrl());//ajax请求
			if (rrequest.isLoadedByAjax()) {
				rrequest.getWResponse().addOnloadMethod("wx_sendRedirect","{url:\"" +rrequest.getRequest().getContextPath() + "\"}", false);
				rrequest.getWResponse().terminateResponse(1);
			} else {
				try {
				//跳转到home页面
					rrequest.getWResponse().getResponse().sendRedirect(rrequest.getRequest().getContextPath()+"/jsp/login/login.html");
				} catch (IOException e) {
			
					e.printStackTrace();
				}
			}
		} else {
			//已登录用户，生成登陆用户菜单，把菜单代码放到session中，在page的header中调用
			if (!rrequest.isLoadedByAjax()) {
				session.setAttribute("menu_list", createMenu(user_id, conn, rrequest));
			}
		}
//对要访问的页面进行授权
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT distinct A.USER_ID");
		sql.append(",B.PRIVILEGE_ID");
		sql.append(",D.PAGE_ID");
		sql.append(",D.COMPONENT_ID");
		sql.append(",D.PART_TYPE");
		sql.append(",D.PART_ID");
		sql.append(",D.PERMISSION_TYPE");
		sql.append(",D.PERMISSION_VALUE ");
		sql.append("FROM CST.SYS_C_SEC_USER A ");
		sql.append("LEFT JOIN CST.SYS_C_SEC_USER_GROUP A1 ");
		sql.append("ON A.USER_ID=A1.USER_ID " );
		sql.append("LEFT JOIN CST.SYS_C_SEC_GPPV B " );
		sql.append("ON A1.GROUP_ID=B.GROUP_ID ");
		sql.append("AND B.SERVICE_ID='060' ");
		sql.append(" LEFT JOIN CST.SYS_C_SEC_PRIV  C ");
		sql.append("ON B.PRIVILEGE_ID=C.PRIVILEGE_ID  ");
		sql.append(" AND B.SERVICE_ID=C.SERVICE_ID  ");
		sql.append(" LEFT JOIN CST.SYS_C_SEC_PVLT D  ");
		sql.append(" ON C.PRIVILEGE_ID=D.PRIVILEGE_ID ");
		sql.append("WHERE A.USER_ID=? AND D.PAGE_ID=? AND C.SERVICE_ID='060' order by D.PAGE_ID,D.COMPONENT_ID");
		//同一页面先common_vpanel后vp
		
//		sql.append("select a.user_id,b.privilege_id ,c.page_id,c.component_id,c.part_type,c.part_id,c.permission_type,c.permission_value  ");
//		sql.append(" from cst.sys_c_sec_user a,cst.sys_c_sec_gppv b,cst.sys_c_sec_pvlt c ");
//		sql.append(" where a.group_id=b.group_id and b.privilege_id=c.privilege_id ");
//		sql.append(" and a.user_id=? and page_id=? ");
		System.out.println(sql);
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, (String) session.getAttribute("user_id"));
			pstmt.setString(2, pageid);
			ResultSet rs = pstmt.executeQuery();
			boolean hasRows = false;

			while (rs.next()) {
				hasRows = true;
				rrequest.authorize(rs.getString("component_id"),
						rs.getString("part_type"), rs.getString("part_id"),
						rs.getString("permission_type"),
						rs.getString("permission_value"));
			}
			if (!hasRows) {
				disablePage(pageid, conn, rrequest);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
		}
	}

	public void doEnd(ReportRequest rrequest) {
		if (!rrequest.isLoadedByAjax()) {
			recordHits(rrequest, rrequest.getStringAttribute("PAGEID"));
		}
	}
//禁用没有被授权过的页面
	public void disablePage(String pageid, Connection conn, ReportRequest rrequest) {
		System.out.println("disablePage+pageid="+pageid);
		rrequest.authorize("common_vpanel", null, null, "disabled", "true");
		rrequest.authorize("common_vpanel", null, null, "display", "false");
		//rrequest.authorize(pageid, null, null, "display", "false");
	}
//根据user_id生成导航菜单
	public String createMenu(String user_id, Connection conn, ReportRequest rrequest) {
		String login_user = (String) rrequest.getRequest().getSession().getAttribute("user_name");
		String sql =
				"SELECT MENU_ID, MENU_TYPE, MENU_NAME, MENU_SEQ, PAGE_ID, PAGE_NAME, URL_PARAM, MT_SEQ " +
				"FROM (" +
				" SELECT B.MENU_ID, C.MENU_TYPE, C.MENU_NAME, C.SEQ AS MENU_SEQ, B.PAGE_ID, B.PAGE_NAME, B.URL_PARAM AS URL_PARAM, B.SEQ AS MT_SEQ " +
				" FROM CST.SYS_C_SEC_USER A " +
				" LEFT JOIN CST.SYS_C_SEC_USER_GROUP A1 ON A.USER_ID=A1.USER_ID " +
				" LEFT JOIN CST.SYS_C_SEC_GROP A2 ON A1.GROUP_ID=A2.GROUP_ID " +
				" LEFT JOIN CST.SYS_C_APP_MNLT B ON A2.GROUP_ID=B.GROUP_ID " +
				" LEFT JOIN CST.SYS_C_APP_MENU C ON B.MENU_ID=C.MENU_ID " +
				" WHERE A.USER_ID=? AND A.IS_ENABLE='Y' AND C.MENU_TYPE='normal' AND B.IS_SHOW='Y' AND C.SERVICE_ID='060' AND A2.SERVICE_ID='060' " +
				" UNION " +
				" SELECT 'FAVOR' AS MENU_ID, 'normal' AS MENU_TYPE, '我的收藏' AS MENU_NAME, 999999 AS MENU_SEQ, MT.PAGE_ID, MT.PAGE_NAME, MT.URL_PARAM, MT.SEQ AS MT_SEQ " +
				" FROM CST.SYS_C_APP_MNLT MT " +
				" LEFT JOIN CST.SYS_C_SEC_GROP A ON MT.GROUP_ID=A.GROUP_ID " +
				" LEFT JOIN CST.SYS_C_SEC_USER_GROUP A1 ON MT.GROUP_ID=A1.GROUP_ID " +
				" LEFT JOIN CST.SYS_C_SEC_USER U ON U.USER_ID=A1.USER_ID AND U.IS_ENABLE='Y' " +
				" LEFT JOIN CST.SYS_C_APP_MENU M ON MT.MENU_ID=M.MENU_ID AND M.SERVICE_ID='060' " +
				" LEFT JOIN CST.SYS_C_SEC_PAGE P ON MT.PAGE_ID=P.PAGE_ID AND P.SERVICE_ID='060' " +
				" RIGHT JOIN CST.SYS_C_PER_FVOR F ON MT.PAGE_ID=F.PAGE_ID AND F.USER_ID=U.USER_ID " +
				" WHERE U.USER_ID=? AND MT.IS_SHOW='Y' AND A.SERVICE_ID='060' " +
				") LIST ORDER BY MENU_SEQ, MENU_ID, MT_SEQ, PAGE_ID";
		System.out.println("根据user_id生成导航菜单"+sql);
		PreparedStatement pstmt = null;
		StringBuffer sb = new StringBuffer();
		sb.append("	<title>XX客户经理绩效考核系统</title>\n");
		sb.append("    <link rel='shortcut icon' href='shortcut.png' />");
		sb.append("	<div id='header'>\n");
		sb.append("		<div id='masthead'>"
				+ "<table cellspacing='0' cellpadding='0' width='100%' border='0'>"
				+ "	<tbody>" 
				+ "		<tr height='46px'>"
				+ "			<td width='260' id='logo_img'>" 
				+ "			</td>    "
				+ "			<td align='left' id='logo'>XX客户经理绩效考核系统"
				+ "			</td>");

		if (user_id == null || "".equals(user_id)) {
			sb.append("			<td align='right' width='300' style='FONT-WEIGHT: bold; COLOR: #fff; padding-right:15px' > &nbsp;&nbsp;&nbsp;&nbsp;");
			sb.append("				<a style='COLOR: #fff;text-decoration: underline;' href='jsp/login/login.html'>请登录</a>");
		} else {
			sb.append("			<td align='right' width='300' style='FONT-WEIGHT: bold; COLOR: #fff; padding-right:15px' >欢迎您, " + login_user + "&nbsp;&nbsp;&nbsp;&nbsp;");
			sb.append("				<a style='COLOR: #fff;text-decoration: underline;' href='jsp/login/changePassword.jsp' target='_BLANK'>修改密码</a>");
			sb.append("				<a style='COLOR: #fff;text-decoration: underline;' href='jsp/login/logout.jsp'>退出系统</a>");
		}
		sb.append("			</td>    " + "		</tr>" + "	</tbody>" + "</table>" + "</div>\n");
		sb.append("		<div id='dd-navigation'>\n");
		sb.append("			<div id='nav-strip'>\n");
		sb.append("				<ul>\n");
		sb.append("\n");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_id);
			ResultSet rs = pstmt.executeQuery();
			String currentMenuId = null;
			boolean submenuOpen = false;
			while (rs.next()) {
				String menu_type = rs.getString("menu_type");
				String menuId = rs.getString("menu_id");
				String urlParam = rs.getString("url_param") == null ? "" : rs.getString("url_param");

				if ("url".equals(menu_type)) {
					if (submenuOpen) {
						sb.append("						</ul></div></div></li>\n");
						submenuOpen = false;
					}
					currentMenuId = menuId;
					sb.append("					<li class='nav-item no-subnav' id='nav-item_" + menuId + "'><a href='" + rs.getString("page_id").substring(4) + "'><span class='primary-link'>" + rs.getString("menu_name") + "</span></a></li>\n");
					continue;
				}

				if (!menuId.equals(currentMenuId)) {
					if (submenuOpen) {
						sb.append("						</ul></div></div></li>\n");
					}
					currentMenuId = menuId;
					sb.append("					<li class='nav-item' id='nav-item_" + menuId + "'><a href='javascript:void(0)'><span class='primary-link'>" + rs.getString("menu_name") + "</span></a>\n");
					sb.append("						<div class='subnav' id='subnav_" + menuId + "'><div class='subnav-inner'><ul class='one'>\n");
					submenuOpen = true;
				}

				if (submenuOpen) {
					sb.append("						    <li class='nav-item-li'><a href='ShowReport.wx?PAGEID=" + rs.getString("page_id") + urlParam + "'>" + rs.getString("page_name") + "</a></li>\n");
				}
			}
			if (submenuOpen) {
				sb.append("						</ul></div></div></li>\n");
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		}
		sb.append("				</ul>\n");
		sb.append("			</div>\n");
		sb.append("		</div>\n");
		sb.append("	</div>\n");
		return sb.toString();
	}

	public void recordHits(ReportRequest rrequest, String page_id) {
		String updateSql = "update cst.sys_c_sec_page set hits=(case when hits is null then 1 else hits+1 end)  where page_id=? ";
		Connection conn = rrequest.getConnection();
		PreparedStatement pstmt2 = null;
		try {
			pstmt2 = conn.prepareStatement(updateSql);
			pstmt2.setString(1, page_id);
			pstmt2.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//xbs add
	public  String getRemoteIP(ReportRequest ReportRequest){
		if(ReportRequest.getRequest().getHeader("x-forwarded-for")==null){
			//System.out.println("getRemoteIP.ReportRequest.getRequest().getRemoteAddr()"+ReportRequest.getRequest().getRemoteAddr());
			return ReportRequest.getRequest().getRemoteAddr();
		}
		
		return ReportRequest.getRequest().getHeader("x-forwarded-for");
		
	}
}
