package com.customer.interceptor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.wabacus.config.Config;
import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.intercept.AbsInterceptorDefaultAdapter;

/*针对蛐蛐网活动的存款认领校验页面*/
public class InterceptorClaimDep2016QQ extends AbsInterceptorDefaultAdapter {

	@Override
	public Object beforeLoadData(ReportRequest rrequest, ReportBean rbean, Object typeObj, String sql) {
		String vuch_nbr = rrequest.getStringAttribute("VUCH_NBR", "");// 取出凭证号
		String org_id = (String) rrequest.getRequest().getSession().getAttribute("org_id");
        System.out.println(":::VUCH_NBR=" + vuch_nbr + "ORG_ID=" + org_id);
        if(!vuch_nbr.equals("")){

    		String sql1 = "AND ORG_ID="+org_id;
			sql = sql.replaceAll("%SQL%", sql1);
			
		}
        return sql;
	}
	
	@Override
	public void doStart(ReportRequest rrequest, ReportBean rbean) {
		String vuch_nbr = rrequest.getStringAttribute("VUCH_NBR", "");// 取出凭证号
		System.out.println("VUCH_NBR-----" + vuch_nbr);
		Connection conn = Config.getInstance().getDataSource("ds_db2").getConnection();// 取DB2数据源配置

		if (vuch_nbr.equals("")) {// 输入凭证号前，采用延迟加载
			rrequest.setAttribute("select_lazyload", "true");
			rrequest.setAttribute("select_lazyloadmessage", "现在是延迟读取，输入凭证号后点击查询按钮才加载相应条件的数据");
			rrequest.authorize("dtl", null, null, "display", "false");
		}

		else {
			try {
				// SQL:获取输入凭证号码的是否配卡信息+活动编号信息
				String SQL = "Select WITH_CARD_F, COALESCE(MARKETING_NO,'') as MARKETING_NO from IBS.T1_VUCH_DETAIL where VUCH_NBR=? and  VUCH_TYPE_ID in ('10','11','12','13','14','15','16','17','18')";
				PreparedStatement pstmt = conn.prepareStatement(SQL, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

				pstmt.setString(1, vuch_nbr);
				ResultSet resultSet = pstmt.executeQuery();

				int cnt = 0;
				resultSet.last();
				cnt = resultSet.getRow();

				System.out.println("cnt=" + cnt);
				if (resultSet.getRow() == 0) {//没有输入的凭证号
					rrequest.authorize("dtl", null, null, "display", "false");
					
					rrequest.getWResponse().getMessageCollector().error("不存在输入的凭证号,请核对。（由于批量原因，新开户的凭证号，请明日再试。）", "", false);
					System.out.println("结束判断输入的凭证号不存在，页面不显示。");

				} else {
					//存在输入的凭证号
					resultSet.beforeFirst();
					while (resultSet.next()) {
						if (resultSet.getString("WITH_CARD_F").equals("1")) {
							// 配卡凭证
							rrequest.authorize("dtl", null, null, "display", "false");
						
							rrequest.getWResponse().getMessageCollector().error("输入的储蓄存折(凭证号" + vuch_nbr + ")已关联银行卡，请对关联卡进行认领。", "", false);
							System.out.println("此凭证有配卡，请对配卡进行认领。");
						}

						else if (!resultSet.getString("MARKETING_NO").trim().equals("2016qq")){
							//未参加蛐蛐网活动的凭证，则不显示
							rrequest.authorize("dtl", null, null, "display", "false");
							
							rrequest.getWResponse().getMessageCollector().error("输入的凭证号" + vuch_nbr + "未参加蛐蛐网活动，不能在此认领。", "", false);
							System.out.println("未参加蛐蛐网活动，不能在此认领。");
						}

					}
				}

				resultSet.close();
				pstmt.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		System.out.println(new Date() + "蛐蛐网存款认领校验页面:::执行完前置动作------------------");
	}

	@Override
	public void doEnd(ReportRequest rrequest, ReportBean rbean) {

		System.out.println(new Date() + "蛐蛐网存款认领校验页面:::执行后置动作------------------");
	}

}
