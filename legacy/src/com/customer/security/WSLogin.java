package com.customer.security;

import interfaceservice.InterfaceServiceServiceStub;
import interfaceservice.InterfaceServiceServiceStub.SsoTicketValidate;
import interfaceservice.InterfaceServiceServiceStub.SsoTicketValidateResponse;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wabacus.config.Config;



public class WSLogin {

	

	public static String wsLogin(String user_id, String token,HttpServletRequest request,HttpServletResponse response) {
		HttpSession session=request.getSession();	
		InterfaceServiceServiceStub stub;
		try {
			stub = new InterfaceServiceServiceStub();

			SsoTicketValidate validate=new SsoTicketValidate();
		
			String xml2 = "<?xml version=\"1.0\" encoding=\"utf-8\"?><root><token>" +
				token
						+"</token></root>";
			validate.setXml(xml2);

			SsoTicketValidateResponse validateResponse;
	
			validateResponse = stub.ssoTicketValidate(validate);
			String getReturn = validateResponse.getSsoTicketValidateReturn();
			
			String success="success";
			
			System.out.println("返回"+getReturn);
			
			int sResult=getReturn.indexOf(success);
			System.out.println(sResult);
			if(sResult>0){
				System.out.println("用户"+user_id+"token验证成功");
				    session.setAttribute("user_id", user_id);
					Connection conn = Config.getInstance().getDataSource("").getConnection();
					String sql="select u.user_id, u.user_name, emp.org_id, password, u.is_enable, o.ORG_LVL from cst.sys_c_sec_user u left join ibs.T5_EMP emp on u.user_id=emp.emp_id left join pub.ORGAN o on emp.org_id=o.ORG_ID and o.ORG_STUS='1' where user_id=? ";
					
					PreparedStatement pstmt = null;
						pstmt = conn.prepareStatement(sql);
						
						pstmt.setString(1, user_id);
		              
						ResultSet rs = pstmt.executeQuery();
						System.out.println("开始查询机构号"+rs.next()+rs.getString("user_name"));
					
						//while (rs.next()) {
							String user_name = rs.getString("user_name");				           
							String org_id=rs.getString("ORG_ID");
							String org_lvl = rs.getString("ORG_LVL");
							
							System.out.println("机构号"+org_id);							
							session.setAttribute("org_id",org_id);
							session.setAttribute("user_name", user_name);
							session.setAttribute("user_id", user_id);
							session.setAttribute("org_lvl", org_lvl);
							
							System.out.println("用户ID="+user_id+"机构号="+org_id+"机构等级="+org_lvl);
							System.out.println(session.getAttribute("org_id"));
							
						//}
						rs.close();
                        conn.close();
					
				
					System.out.println("验证成功");
					return "passOK";
				}
						
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "passErr";
		}
		return "passErr";
		
	
		
	

	}
	
//	public static  void main(String[] args) throws Exception {
//		String token="9EC0EAF52AB0EDD6CD34759442C33E8E382B85ACE5AD161AD7305F1897051EC1998E8B6ADD988C9B872F610919F437CF03FE48E43DC20BDD3CBCECD10F46C852B9E603792F89556EF220854C8274BD21E251A0C787EB62605576C7C2080B0011F9593C8CD341372534C948944B829F1A2C172E6DB10C6CAD";
//		HttpSession session=null;
//		WSLogin wsLogin=new WSLogin();
//		WSLogin.wsLogin("004846",token,session) ;
//		
//		
//
//	}
	
	
}
