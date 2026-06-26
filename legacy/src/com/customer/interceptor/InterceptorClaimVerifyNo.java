package com.customer.interceptor;

import java.util.Date;

import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;

/*认领审核不通过弹窗页面*/
public class InterceptorClaimVerifyNo extends AbsInterceptorDefaultAdapter {
    /*
	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		String vuch_nbr = rrequest.getStringAttribute("VUCH_NBR", "");// 取出凭证号
		String emp_id = rrequest.getStringAttribute("EMP_ID", "");     // 取出认领人工号
		System.out.println("VUCH_NBR-----" + vuch_nbr + " and  EMP_ID----"	+ emp_id);
		Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置
		
		  
		if (!vuch_nbr.equals("")) {

			String SQL="Select count(1) as cnt, CLAIM_STATUS_ID from IBS.T1_VUCH_EMP_RELA where VUCH_NBR=? and EMP_ID=? and (CLAIM_STATUS_ID not in ('1','21','3','31') and coalesce(RVS_STATUS_ID,'')<>'1') group by CLAIM_STATUS_ID";


			try {

		        PreparedStatement pstmt=null;
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, vuch_nbr);
				pstmt.setString(2, emp_id);
				ResultSet resultSet = pstmt.executeQuery();
				while (resultSet.next()) {
					System.out.println("CLAIM_STATUS_ID=="+resultSet.getString("CLAIM_STATUS_ID"));
					if(resultSet.getInt("cnt") == 1){
						System.out.println("=========认领审核不通过弹窗页面disabled start===========");
						rrequest.authorize("report", Consts.BUTTON_PART, "type{save}",	"disabled", "true");
						rrequest.authorize("report", Consts.BUTTON_PART, "button2", "disabled", "true");
						rrequest.authorize("report", Consts.BUTTON_PART, "type{reset}", "disabled", "true");
						//rrequest.setAttribute("report_ACCESSMODE", "readonly");
						
						//rrequest.setAttribute("report", "closePage",true);
						System.out.println("=========认领审核不通过弹窗页面disabled end===========");
					}
					else{
						System.out.println("aaaaaaaaaaaaaaaaaaaaa");
					}
				}
				resultSet.close();
				pstmt.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
			finally{
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}

		
		}
		System.out.println(new Date() + "认领审核不通过弹窗页面:::执行完前置动作------------------");
	}
    */
	@Override
	public void doEnd(ReportRequest rrequest, ReportBean rbean) {

		System.out.println(new Date() + "认领审核不通过弹窗页面:::执行后置动作------------------");
	}
}
