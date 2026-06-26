/* 
 * Copyright (C) 2010-2013 星星<349446658@qq.com>
 * 
 * This file is part of Wabacus 
 * 
 * Wabacus is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package com.customer;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Map.Entry;

import com.lenovo.ebank.pub.SopIntf;
import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.component.application.report.configbean.editablereport.AbsJavaEditActionBean;

public class CustomerUpdate extends AbsJavaEditActionBean
{
   
	static {

		SopIntf.initEnv("ww");
		SopIntf.DEBUG = true;
	}
	
	@Override
	public void updateData(ReportRequest rrequest,ReportBean rbean,Map<String,String> mRowData,Map<String,String> mParamValues) throws SQLException
    {
        String updatetype=mParamValues.get("updatetype");
        String user_id=mParamValues.get("user_id");
        System.out.println("当前的操作类型："+updatetype);
        System.out.println("当前操作记录行上所有列的新旧值：");
        String KEHHAO=rrequest.getStringAttribute("KEHHAO","");
        for(Entry<String,String> entryTmp:mRowData.entrySet())
        {
            System.out.print(entryTmp.getKey()+":"+entryTmp.getValue()+";");
        }
        System.out.println("\n===============================================================================");
       
    	String fmt ="yyyyMMdd";
		SimpleDateFormat sdf = new SimpleDateFormat(fmt);
		Date now = new Date();
		String dtStr = sdf.format(now);
		System.out.println(dtStr);
        
        
		
		SopIntf sop = new SopIntf();
	
		sop.put(null, "PDSBNO", "9991"); 
		sop.put(null, "PDUSID", "99993000"); 
		sop.put(null, "SYSSADDR", "0509");
		sop.put("O77371", "TPU_StepTrcd", "7737");  
	
		sop.put("O77371", "PDTRMD", "1"); 
		sop.put("O77371", "PDQTDT", dtStr); 
		sop.put("O77371", "PDQTLS", "DW000001"); 
		byte[] val = new byte[2];
		val[0] = (byte) 0xff;
		val[1] = (byte) 0xff;
		sop.put("O77371", "PDOFF1", val);
		sop.put("O77371", "PDOFF2", val);
		
		sop.put("O77371", "KEHHAO", KEHHAO);
		sop.put("O77371", "KAZLCS", mRowData.get("KAZLCS"));
		sop.put("O77371", "ZONGED", mRowData.get("ZONGED"));
		sop.put("O77371", "ZHU1YE", mRowData.get("ZHU1YE"));
		sop.put("O77371", "SHULNG", mRowData.get("SHULNG"));
		sop.put("O77371", "CKLXRM", user_id);
		
		
		
		System.out.println("开始执行!!!!!!!!");
		if (sop.exec("O77371")) { 
			System.out.println("OK!!!!!!!!");
			
			KEHHAO = sop.getStr("O77372","KEHHAO");
			String JIOYRQ = sop.getStr("O77372","JIOYRQ");
			String GUIYLS = sop.getStr("O77372","GUIYLS");

			System.out.println("这是对公客户号："+KEHHAO);
			System.out.println(JIOYRQ);
			System.out.println(GUIYLS);

			
		} else
			
			System.out.println("Error: 0" + sop.errcode + "-" + sop.errmsg);
        
        
        
    }

}
