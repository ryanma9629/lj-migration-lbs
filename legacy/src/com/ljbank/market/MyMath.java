package com.ljbank.market;

import java.math.BigDecimal;

public class MyMath {
	public static double add(double b1, double b2){//加法
		BigDecimal d1=new BigDecimal(b1);
		BigDecimal d2=new BigDecimal(b2);
		return d1.add(d2).doubleValue();
	}
	public static double sub(double b1, double b2){//减法
		BigDecimal d1=new BigDecimal(b1);
		BigDecimal d2=new BigDecimal(b2);
		return d1.subtract(d2).doubleValue();
	}
	public static double mul(double b1, double b2){//乘法
		BigDecimal d1=new BigDecimal(b1);
		BigDecimal d2=new BigDecimal(b2);
		return d1.multiply(d2).doubleValue();
	}
	public static double div(double b1, double b2,int len){//除法
		BigDecimal d1=new BigDecimal(b1);
		BigDecimal d2=new BigDecimal(b2);
		return d1.divide(d2,len,BigDecimal.ROUND_HALF_UP).doubleValue();
	}
	public static double round(double b,int len){//四舍五入
		BigDecimal d1=new BigDecimal(b);
		BigDecimal d2=new BigDecimal(1);//任何一个数字除以1都是元数字，ROUND_HALF_UP是一个常量，表示进行四舍五入的操作
		return d1.divide(d2,len,BigDecimal.ROUND_HALF_UP).doubleValue();
	}
	
}
