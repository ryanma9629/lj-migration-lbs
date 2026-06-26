
package com.customer.interceptor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wabacus.config.Config;
import com.wabacus.config.component.IComponentConfigBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.serveraction.IServerAction;
import com.wabacus.util.Consts;

public class InterceptorSubmitVerifyNo  implements IServerAction{
	/**
     * 与框架无关的ajax调用
     */
    @Override
	public String executeServerAction(HttpServletRequest request,HttpServletResponse response,List<Map<String,String>> lstData)
    {
    	
        System.out.println("executeServerAction(HttpServletRequest request,HttpServletResponse response,List<Map<String,String>> lstData)方法...");
        return null;
    }

    /**
     * 针对组件通过ajax调用服务器端方法
     */
    @Override
	public String executeSeverAction(ReportRequest rrequest,IComponentConfigBean ccbean,List<Map<String,String>> lstData,Map<String,String> mCustomizedData)
    {
        System.out.println("调用executeSeverAction(ReportRequest rrequest,IComponentConfigBean ccbean,List<Map<String,String>> lstData)方法...");
        //printLstParams(lstData);//打印客户端传过来的参数
        String user_id=(String) rrequest.getRequest().getSession().getAttribute("user_id");
		String vuch_nbr = rrequest.getStringAttribute("VUCH_NBR", "");// 取出凭证号
        
        Date date=new Date();
        /*  dt认领时间 CLAIM_DT*/
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
        String dt=dateformat.format(date);
        
        
        /*  dts认领时间戳，用于填写在备注时间上*/
        SimpleDateFormat dateformat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//认领时间戳，用于填写在备注时间上
        String dts=dateformat1.format(date);
        
        System.out.println("user_id="+user_id+";vuch_nbr="+vuch_nbr+";dt="+dt+";dts="+dts);

		Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
        
//        Connection conn=rrequest.getConnection();
//        PreparedStatement pstmt=null;

        try
        {
        	  //存款业绩填写完成后，点击提交按钮将刷新CLAIM_STATUS_ID="1-待审核" 【认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销）】，并填写提交时间
            String sql1="update IBS.T1_VUCH_EMP_RELA set CLAIM_STATUS_ID='1', CLAIM_DT=?, REMARK=?||remark where VUCH_NBR=? and EMP_ID=? and coalesce(CLAIM_STATUS_ID,'0')='0' ";

	        PreparedStatement pstmt=null;
        	pstmt=conn.prepareStatement(sql1);
	        pstmt.setString(1,dt);
	        pstmt.setString(2,dts);
	        pstmt.setString(3,vuch_nbr);
	        pstmt.setString(4,user_id);
	        pstmt.executeUpdate();
	        System.out.println("======step1: 点击提交按钮将刷新CLAIM_STATUS_ID='1-待审核'==============");
	        rrequest.getWResponse().getMessageCollector().success("提交成功！", "", false);//向前台提示一条信息，这里还可以终止后续处理
			rrequest.authorize("dtl", Consts.BUTTON_PART, "type{save}",	"disabled", "true");
			rrequest.authorize("dtl", Consts.BUTTON_PART, "sub", "disabled", "true");
			rrequest.setAttribute("dtl_ACCESSMODE", "readonly");
	        pstmt.close();
//	        conn.close();
	        return "提交成功！";

        }catch(Exception e){
            e.printStackTrace();
            System.out.println(e);
            return "执行数据库操作失败";
        }finally{
        	try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	
        }
    }

}
