package com.customer;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.wabacus.system.ReportRequest;

public class Servervalidate_customerupdate {
	/**
	 * 校验输入的部门编号是否为四位字符
	 * 
	 * @param rrequest
	 * @param deptno
	 * @param mValues
	 * @param lstErrorMessages
	 * @return
	 */
	public static boolean isValidKAZLCS(ReportRequest rrequest, String KAZLCS,
			Map<String, String> mValues, List<String> lstErrorMessages) {
		if (KAZLCS == null || KAZLCS.trim().equals(""))
			return true;// 为空不在这里校验，而是在isNotEmpty()中校验，所以直接返回true
		System.out.println("进行isValidKAZLCS()服务器端校验时各列的新旧值为：");
		for (Entry<String, String> entryTmp : mValues.entrySet()) {
			System.out.print(entryTmp.getKey() + "=" + entryTmp.getValue()
					+ ";;");
		}
		System.out.println();
		KAZLCS = KAZLCS.trim();
		return KAZLCS.length() == 5;
	}

	public static boolean isValidCKLXRM(ReportRequest rrequest, String CKLXRM,
			Map<String, String> mValues, List<String> lstErrorMessages) {
		
		if (CKLXRM == null || CKLXRM.trim().equals(""))
			return true;// 为空不在这里校验，而是在isNotEmpty()中校验，所以直接返回true
		System.out.println("进行isValidCKLXRM()服务器端校验时各列的新旧值为：");
		for (Entry<String, String> entryTmp : mValues.entrySet()) {
			System.out.print(entryTmp.getKey() + "=" + entryTmp.getValue()
					+ ";;");
		}
		System.out.println();
		CKLXRM = CKLXRM.trim();
		return CKLXRM.length() == 6;
	}
	
	public static boolean isValidCKLXRM1(ReportRequest rrequest, String CKLXRM,
			Map<String, String> mValues, List<String> lstErrorMessages) {
		
		lstErrorMessages.clear();//清掉配置的出错提示信息，完全由自己进行提示
		String digi="0123456789";
		for(int i=1;i<CKLXRM.length();i++){
			if(digi.indexOf(CKLXRM.charAt(i))==-1) {
				lstErrorMessages.add("客户经理输入项必须是6位员工号");
				return false;
			}
		}
		  return true;
	}

	  public static boolean isHaveKAZLCS(ReportRequest rrequest,String KAZLCS,Map<String,String> mValues,List<String> lstErrorMessages)
	    {
	        if(KAZLCS==null||KAZLCS.trim().equals("")) return true;//为空不在这里校验，而是在isNotEmpty()中校验，所以直接返回true
	        System.out.println("开始验证是否存在该行业代码：");
	        for(Entry<String,String> entryTmp:mValues.entrySet())
	        {
	            System.out.print(entryTmp.getKey()+"="+entryTmp.getValue()+";;");
	        }
	        System.out.println();
	        KAZLCS=KAZLCS.trim();
	        Connection conn=rrequest.getConnection();
	        Statement stmt=null;
	        try
	        {
	            stmt=conn.createStatement();
	            ResultSet rs=stmt.executeQuery("select count(GBT4754_CD) from CST.SYS_C_GB_T4754 where GBT4754_CD='"+KAZLCS+"'");
	            rs.next();
	            int count=rs.getInt(1);
	            
	            if(count==0){
	            	rs.close();
		            return false;	
	            }else{
	            	rs.close();
	            	return true;
	            }
	            
	        }catch(SQLException e)
	        {
	            e.printStackTrace();
	            return false;
	        }finally
	        {
	            try
	            {
	            	
	                if(stmt!=null) stmt.close();
	                conn.close();
	            }catch(SQLException e)
	            {
	                e.printStackTrace();
	            }
	        }
	    }
}
