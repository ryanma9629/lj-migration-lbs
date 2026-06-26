package com.ljbank.market;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.wabacus.system.ReportRequest;

public class Servervalidate_ClaimRatio_claimedchange {

	  public static boolean isClaimRatio(ReportRequest rrequest,String RATIO,Map<String,String> mValues,List<String> lstErrorMessages)
	    {
		  	String vuch_nbr = rrequest.getStringAttribute("txtvuch", "");// 取出凭证号
		  	
		  	System.out.println("VUCH_NBR=="+vuch_nbr);
		  	System.out.println("**************校验方法的凭证号取出"+vuch_nbr+"*********************");
	        if(RATIO==null||RATIO.trim().equals("")) return true;//为空不在这里校验，而是在isNotEmpty()中校验，所以直接返回true
	        System.out.println("开始验证输入的认领比例是否合格");
	        String emp_id="";
	        for(Entry<String,String> entryTmp:mValues.entrySet())
	        {
	            System.out.print(entryTmp.getKey()+"="+entryTmp.getValue()+";;");
	            if(entryTmp.getKey().equals("RATIO")){
	            	RATIO=entryTmp.getValue();
	            	System.out.println("校验方法取得RATIO=="+RATIO);
	            }
	        }
	        System.out.println();
	        RATIO=RATIO.trim();
	        
//	        Connection conn=rrequest.getConnection();
//	        Statement stmt=null;
//	        try
//	        {
//	            stmt=conn.createStatement();
//	           // System.out.println("------------取出的输入的认领比例"+RATIO);
//	            String sql="select 100-coalesce(sum(RATIO),0) as inratio from IBS.T1_VUCH_EMP_RELA where VUCH_NBR="+vuch_nbr+" and CLAIM_STATUS_ID in ('1','2','5','6') and EMP_ID<>"+emp_id;
//	            
//	            ResultSet rs=stmt.executeQuery(sql);
//	            rs.next();
//	            int inratio=rs.getInt("inratio");
//	            System.out.println("剩余可以认领的比例inratio============"+inratio);
//	            int ro=Integer.parseInt(RATIO);
//	            System.out.println("页面输入的认领比例ro============"+ro);
//	            if(ro>inratio){
//	            	rs.close();
//		            return false;	
//	            }else{
//	            	rs.close();
//	            	return true;
//	            }
//	            
//	        }catch(SQLException e)
//	        {
//	            e.printStackTrace();
//	            return false;
//	        }finally
//	        {
//	            try
//	            {
//	                if(stmt!=null) stmt.close();
//	            }catch(SQLException e)
//	            {
//	                e.printStackTrace();
//	            }
//	        }
	        return true;
	    }
}
