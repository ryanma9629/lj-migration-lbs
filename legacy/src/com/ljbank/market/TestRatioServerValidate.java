package com.ljbank.market;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.wabacus.system.ReportRequest;

public class TestRatioServerValidate {
	public static boolean isValidRatio1(ReportRequest rrequest,String ratio,Map<String,String> mValues,List<String> lstErrorMessages){
		if(ratio==null||ratio.trim().equals(""))return false;

		for(Entry<String,String> entryTmp:mValues.entrySet()){
			System.out.print(entryTmp.getKey()+"="+entryTmp.getValue()+";;");
			
		}
		System.out.println();
		String otherRatio=mValues.get("SALES_RATIO");
		ratio=ratio.trim();
	
		otherRatio=otherRatio.trim();
		System.out.println(Integer.parseInt(otherRatio)+Integer.parseInt(ratio)+0);
		if(100==Integer.parseInt(otherRatio)+Integer.parseInt(ratio)+0){
			return true;
		}
		return false;
		
	}
	public static boolean isValidRatio2(ReportRequest rrequest,String ratio,Map<String,String> mValues,List<String> lstErrorMessages){
		if(ratio==null||ratio.trim().equals(""))return false;

		for(Entry<String,String> entryTmp:mValues.entrySet()){
			System.out.print(entryTmp.getKey()+"="+entryTmp.getValue()+";;");
			
		}
		System.out.println();
		String otherRatio=mValues.get("RECOMMEND_RATIO");
		ratio=ratio.trim();
		otherRatio=otherRatio.trim();
		System.out.println(Integer.parseInt(otherRatio)+Integer.parseInt(ratio)+0);
		if(100==Integer.parseInt(otherRatio)+Integer.parseInt(ratio)+0){
			return true;
		}
		return false;
		
	}
}
