package com.ljbank.market;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.wabacus.system.ReportRequest;

//ReportRequest ReportRequest
public class Util {
	public String getRemoteIP(ReportRequest ReportRequest) {
		if (ReportRequest.getRequest().getHeader("x-forwarded-for") == null) {
			return ReportRequest.getRequest().getRemoteAddr();
		}

		return ReportRequest.getRequest().getHeader("x-forwarded-for");

	}

	//使用HttpServletRequest作为输入获得客户端IP
	public String getRemoteIP(HttpServletRequest request){
		if(request.getHeader("x-forwarded-for")==null){
			return request.getRemoteAddr();
		}
		
		
		return request.getHeader("x-forwarded-for");
		
	}
	
	@SuppressWarnings("deprecation")
	public String getDate() {
		Date date = new Date();

		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
		String date7 = dateformat.format(date);

		// Date date1=dateformat.parse(date7);
		Calendar c = Calendar.getInstance();
		c.setTime(date);

		Date today = c.getTime();
		c.add(Calendar.DAY_OF_YEAR, -1);
		// String date7=dateformat.format(date);

		Date today_plus1 = c.getTime();

		String d = dateformat.format(today_plus1);
		return d;
	}

	public String getDate7() {
		Date date = new Date();

		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
		String date7 = dateformat.format(date);

		// Date date1=dateformat.parse(date7);
		Calendar c = Calendar.getInstance();
		c.setTime(date);

		Date today = c.getTime();
		c.add(Calendar.DAY_OF_YEAR, -7);
		// String date7=dateformat.format(date);

		Date today_plus7 = c.getTime();

		String d = dateformat.format(today_plus7);
		return d;

	}

	// 字符串换行 added by 王旭 2015-03-13 此方法用于个人理财统计证书时，换行输入
	public String turnStr(String str) {
		String s = "";
		char[] c = str.toCharArray();
		for (int i = 0; i < c.length; i++) {

			int k = i + 1;
			int j = 0;

			if (k % 10 == 0) {
				s += str.substring(k - 10, k) + "<br/>";
				j = k;// 获得插入字符的位置
				// System.out.println(s);
				// System.out.println(j);
			}

			if (k == c.length) {
				// System.out.println(j+":"+str.substring(k-k%10,k));
				s += str.substring(k - k % 10, k);
				// System.out.println(s);
			}
		}

		return s;
	}

	// 字符串换行 每六个字长换行
	public String turnStr6(String str) {
		String s = "";
		char[] c = str.toCharArray();
		for (int i = 0; i < c.length; i++) {

			int k = i + 1;
			int j = 0;

			if (k % 6 == 0) {
				s += str.substring(k - 6, k) + "<br/>";
				j = k;// 获得插入字符的位置
				// System.out.println(s);
				// System.out.println(j);
			}

			if (k == c.length) {
				// System.out.println(j+":"+str.substring(k-k%10,k));
				s += str.substring(k - k % 6, k);
				// System.out.println(s);
			}
		}

		return s;
	}

	// 字符串换行 added by 王旭 此方法用于认领信息备注的换行输入
	public String turnStrREMARK(String str) {
		String s = str;
		int i=0;// = str.indexOf("审批时间");
		int j=str.indexOf("审批时间");
		int k=str.indexOf("认领时间");
		if(k<j&&k!=-1){
			String substr=str.substring(i);//第二条记录 开始审核信息
			System.out.println("原str"+str);
			substr=substr.replace("审批时间", "<br/>审批时间");
			//System.out.println("substr2"+substr);
			substr=substr.replace("认领时间", "<br/>认领时间");
			//System.out.println("substr3"+substr);
			s=str.substring(0, i)+substr;

			System.out.println("新str"+s);
		}
		//s=str.substring(0, i);//第一条记录 关于认领信息
		


		return s;
	}
	// 获得上月最后一天的日期
	public String getPreviousMonthEnd() {
		String str = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Calendar lastDate = Calendar.getInstance();
		lastDate.add(Calendar.MONTH, -1);// 减一个月
		lastDate.set(Calendar.DATE, 1);// 把日期设置为当月第一天
		lastDate.roll(Calendar.DATE, -1);// 日期回滚一天，也就是本月最后一天
		str = sdf.format(lastDate.getTime());
		return str;
	}
	
	// 获取当月
	public String getStringMonth() {
		String str = "";
		Date date = new Date();
		Calendar lastDate = Calendar.getInstance();
		lastDate.setTime(date);

		lastDate.add(Calendar.DAY_OF_YEAR, -1);
		Date today_plus1 = lastDate.getTime();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		str = sdf.format(today_plus1);
		
		return str.substring(0, 7);
	}

	public static void main(String[] args) {
		Util u = new Util();

		String str = "认领时间2015-12-28-15.20.24.000000认领人005960认领理由父母。审批时间2015-12-30-10.31.24.000000审批人004451审批理由请出示证明。认领时间2015-12-31-15.20.24.000000认领人005960认领理由户口本。审批时间2015-12-31-16.31.24.000000审批人004451审批理由哦哦。";
		String strturn = u.turnStrREMARK(str);
		String aa="我咕咕咕啊打发士大夫";
		String turn=u.turnStrREMARK(aa);
		System.out.println(turn);
		System.out.println(aa.indexOf("审批时间"));
		
	//	System.out.println("str==" + str);
	//	System.out.println("strturn==" + strturn);
	}
	// public static void main(String[] args) {
	// Util u=new Util();
	// System.out.println(getRemoteIP);
	//
	// }
	

}
