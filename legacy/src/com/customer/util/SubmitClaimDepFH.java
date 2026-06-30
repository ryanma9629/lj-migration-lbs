package com.customer.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

/*分行存款业绩认领提交按钮方法
 * 大堂经理认领存款衍生变更页面 “存量储蓄存款认领” 此页面用于解决资源类客户经理老业绩认领以及公司业务部其他问题
 * 分行管理员可以登录此页面对业绩进行调整认领
 * 直接认领2018-01-01年之前的业绩
 */
public class SubmitClaimDepFH implements IServerAction {
	/**
	 * 与框架无关的ajax调用
	 */
	@Override
	public String executeServerAction(HttpServletRequest request, HttpServletResponse response, List<Map<String, String>> lstData) {

		System.out.println("executeServerAction(HttpServletRequest request,HttpServletResponse response,List<Map<String,String>> lstData)方法...");
		return null;
	}

	/**
	 * 针对组件通过ajax调用服务器端方法
	 */
	@Override
	public String executeSeverAction(ReportRequest rrequest, IComponentConfigBean ccbean, List<Map<String, String>> lstData,
			Map<String, String> mCustomizedData) {
		System.out.println("调用executeSeverAction(ReportRequest rrequest,IComponentConfigBean ccbean,List<Map<String,String>> lstData)方法...");
		// printLstParams(lstData);//打印客户端传过来的参数
		String user_id = (String) rrequest.getRequest().getSession().getAttribute("user_id");
		String vuch_nbr = rrequest.getStringAttribute("VUCH_NBR", "");// 取出凭证号
		String input_per_id = rrequest.getStringAttribute("EMP_NM", ""); //取出输入的员工号
		
		//

		Date date = new Date();
		/* dt认领时间 CLAIM_DT */
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
		String dt = dateformat.format(date);
		/* dts认领时间戳，用于填写在备注时间上 */

		SimpleDateFormat dateformat1 = new SimpleDateFormat("yyyy-MM-dd-HH.mm.ss");// 认领时间戳，用于填写在备注时间上
		String dts = dateformat1.format(date);

		System.out.println("user_id=" + user_id + ";vuch_nbr=" + vuch_nbr + ";dt=" + dt + ";dts=" + dts + " ; 输入的员工号为input_per_id = "+ input_per_id) ;

		Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置

		try { // 提交按钮补充校验判断凭证认领剩余比例
			String sqlvalidate = "SELECT COALESCE(SUM(CASE WHEN EMP_ID=? THEN ratio ELSE 0 END ),0) AS ro, 100-COALESCE(SUM(CASE WHEN EMP_ID<>?  and CLAIM_STATUS_ID in ('1','2','5','6') THEN ratio ELSE 0 END),0) AS inratio FROM IBS.T1_VUCH_EMP_RELA WHERE VUCH_NBR=?";
			PreparedStatement pstmt0 = null;
			pstmt0 = conn.prepareStatement(sqlvalidate);
			pstmt0.setString(1, user_id);
			pstmt0.setString(2, user_id);
			pstmt0.setString(3, vuch_nbr);
			ResultSet rs = pstmt0.executeQuery();

			rs.next();

			int inratio = rs.getInt("inratio");
			System.out.println("剩余可以认领的比例inratio============" + inratio);
			int ro = rs.getInt("ro");
			System.out.println("页面输入的认领比例ro============" + ro);
			if (ro > inratio) {
				pstmt0.close();
				rs.close();
				rrequest.getWResponse().getMessageCollector().error("提交前请核对认领比例！请调整认领比例后，再试。", "", false);
				return "提交失败！";
			} else {

//				 存款业绩填写完成后，点击提交按钮将刷新CLAIM_STATUS_ID="1-待审核"
//				 【认领状态（0-暂存；1-待审核；2-已审核；3-未通过；4-撤销; 5-超时自动审批）】，并填写提交时间
				String sql1 = "update IBS.T1_VUCH_EMP_RELA set  CLAIM_DT=?, REMARK=CONCAT('认领时间',?,'认领工号',?,'认领理由',COALESCE(REMARK1,'')), REMARK1=''  where VUCH_NBR=? and EMP_ID=? and coalesce(CLAIM_STATUS_ID,'0')='0' ";

				PreparedStatement pstmt = null;
				pstmt = conn.prepareStatement(sql1);
				pstmt.setString(1, dt);
				pstmt.setString(2, dts);
				pstmt.setString(3, user_id);
				pstmt.setString(4, vuch_nbr);
				pstmt.setString(5, user_id);
				pstmt.executeUpdate();
				System.out.println("======step1: 点击提交按钮将刷新CLAIM_STATUS_ID='1-待审核'==============");
				rrequest.getWResponse().getMessageCollector().success("提交成功！", false);// 向前台提示一条信息，这里还可以终止后续处理
//				rrequest.authorize("dtl", Consts.BUTTON_PART, "type{save}", "disabled", "true");
//				rrequest.authorize("dtl", Consts.BUTTON_PART, "sub", "disabled", "true");
//				rrequest.setAttribute("dtl_ACCESSMODE", "readonly");
				pstmt0.close();
				pstmt.close();
				rs.close();
				 conn.close();
				return "提交成功！";
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			return "执行数据库操作失败";
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
