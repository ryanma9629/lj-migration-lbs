package com.customer;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wabacus.config.Config;
import com.wabacus.config.component.application.report.ColBean;
import com.wabacus.config.component.application.report.ReportDataSetValueBean;
import com.wabacus.system.CacheDataBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.assistant.WabacusAssistant;
import com.wabacus.system.component.application.report.abstractreport.AbsReportType;
import com.wabacus.system.dataset.IReportDataSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.text.*;

import com.lenovo.ebank.pub.SopIntf;

public class CustomerSelect implements IReportDataSet
{
    
    static
    {

        SopIntf.initEnv("ww");
        SopIntf.DEBUG=true;
    }

    
 
    
    private List<Map<String,String>> getDisplayData(ReportRequest rrequest){
        
        List<Map<String,String>> lstTestDeptData=new ArrayList<Map<String,String>>();
        
      
    	String fmt ="yyyyMMdd";
		SimpleDateFormat sdf = new SimpleDateFormat(fmt);
		Date now = new Date();
		String dtStr = sdf.format(now);
		System.out.println(dtStr);
        
        String KEHHAO=rrequest.getStringAttribute("KEHHAO","");

        String QIYEDM;
        
        System.out.println("组织机构代码证号是："+ KEHHAO);

        String KEHZWM;

        String ZZHAOM;

        String KHJGDH;

        String JGYWMC;

        String GNLISJ;

        String JIGOMC;

        String KAIHRQ;

        String KAZLCS;

        String ZONGED;

        String ZHU1YE;

        String SHULNG;

        String CKLXRM;


        SopIntf sop=new SopIntf();

        sop.put(null,"PDSBNO","9991");
        sop.put(null,"PDUSID","99993000");
        sop.put(null, "SYSSADDR", "0509");
        sop.put("O77381","TPU_StepTrcd","7738");

        sop.put("O77381","PDTRMD","1");
        sop.put("O77381","PDQTDT",dtStr);
        sop.put("O77381","PDQTLS","DW000001");
        byte[] val=new byte[2];
        val[0]=(byte)0xff;
        val[1]=(byte)0xff;
        sop.put("O77381","PDOFF1",val);
        sop.put("O77381","PDOFF2",val);

        sop.put("O77381", "KEHHAO", KEHHAO);
        sop.put("O77381", "QIYEDM", "");
        System.out.println("开始执行");
        if(sop.exec("O77381"))
        {
            System.out.println("OK!!!!!!!!");

            KEHHAO=sop.getStr("O77382","KEHHAO");
            QIYEDM=sop.getStr("O77382","QIYEDM");
            KEHZWM=sop.getStr("O77382","KEHZWM");
            ZZHAOM=sop.getStr("O77382","ZZHAOM");
            KHJGDH=sop.getStr("O77382","KHJGDH");
            JGYWMC=sop.getStr("O77382","JGYWMC");
            GNLISJ=sop.getStr("O77382","GNLISJ");
            JIGOMC=sop.getStr("O77382","JIGOMC");
            KAIHRQ=sop.getStr("O77382","KAIHRQ");
            KAZLCS=sop.getStr("O77382","KAZLCS");
            ZONGED=sop.getStr("O77382","ZONGED");
            ZHU1YE=sop.getStr("O77382","ZHU1YE");
            SHULNG=sop.getStr("O77382","SHULNG");
            CKLXRM=sop.getStr("O77382","CKLXRM");

            System.out.println(KEHZWM);
            System.out.println(KEHHAO);
            System.out.println(QIYEDM);
            System.out.println(ZZHAOM);
            System.out.println(KHJGDH);
            System.out.println(JGYWMC);
            System.out.println(GNLISJ);
            System.out.println(ZONGED);

            Map<String,String> mRowDataTmp;
            mRowDataTmp=new HashMap<String,String>();
            mRowDataTmp.put("KEHHAO",KEHHAO);
            mRowDataTmp.put("QIYEDM",QIYEDM);
            mRowDataTmp.put("KEHZWM",KEHZWM);
            mRowDataTmp.put("ZZHAOM",ZZHAOM);
            mRowDataTmp.put("KHJGDH",KHJGDH);
            mRowDataTmp.put("JGYWMC",JGYWMC);
            mRowDataTmp.put("GNLISJ",GNLISJ);
            mRowDataTmp.put("JIGOMC",JIGOMC);
            mRowDataTmp.put("KAIHRQ",KAIHRQ);
            mRowDataTmp.put("KAZLCS",KAZLCS);
            mRowDataTmp.put("ZONGED",ZONGED);
            mRowDataTmp.put("ZHU1YE",ZHU1YE);
            mRowDataTmp.put("SHULNG",SHULNG);
            mRowDataTmp.put("CKLXRM",CKLXRM);
            
            lstTestDeptData.add(mRowDataTmp);

        }else
        {

            System.out.println("Error: 0"+sop.errcode+"-"+sop.errmsg);
        }
        
        return lstTestDeptData;
        
    }
    
    public String selectLog(ReportRequest rrequest)
    {

        Connection conn=Config.getInstance().getDataSource("ds_db2").getConnection();//取DB2数据源配置
        PreparedStatement pstmt=null;
        try
        {

            String QIYEDM=rrequest.getStringAttribute("QIYEDM","");
            if(!QIYEDM.equals(""))
            {
                pstmt=conn.prepareStatement("insert into cst.select_log(CKLXRM,QIYEDM,CXRQ) values(?,?,?)");
                pstmt.setString(1,"005178");
                pstmt.setString(2,QIYEDM);
                pstmt.setTimestamp(3,new Timestamp((new Date()).getTime()));
                pstmt.executeUpdate();
                pstmt.close();

            }

            return "插入日志数据成功";
        }catch(Exception e)
        {
            e.printStackTrace();
            return "插入日志数据失败";
        }finally
        {
            WabacusAssistant.getInstance().release(conn,null);
        }

    }
    
    @Override
	public int getRecordcount(ReportRequest rrequest,AbsReportType reportTypeObj,ReportDataSetValueBean datasetbean)
    {
        List<Map<String,String>> lstTestDeptData=new ArrayList<Map<String,String>>();
        lstTestDeptData=getDisplayData(rrequest);
        System.out.println("获取记录数..........................");
        return lstTestDeptData.size();
    }

    @Override
	public Object getDataSet(ReportRequest rrequest,AbsReportType reportTypeObj,ReportDataSetValueBean datasetbean,List lstReportData)
    {

        CacheDataBean cdb=rrequest.getCdb(reportTypeObj.getReportBean().getId());
        List<Map<String,String>> lstTestDeptData=new ArrayList<Map<String,String>>();
        lstTestDeptData=getDisplayData(rrequest);
        /**
         * 处理点击列排序
         * String[] orderbys=(String[])rrequest.getAttribute(reportTypeObj.getReportBean().getId(),"ORDERBYARRAY");
         * String ordercolumn=null,ordertype=null;
         * if(orderbys!=null&&orderbys.length==2)
         * {
         *   System.out.println(orderbys[0]+" "+orderbys[1]);
         * }*/
        if(cdb.isLoadAllReportData()) return lstTestDeptData;//本次是加载所有数据（比如数据导出等操作）
        int[] startEndRownumArr=cdb.getStartEndRownumOfDataset(datasetbean.getGuid());
        if(startEndRownumArr==null||startEndRownumArr.length!=2||startEndRownumArr[0]<0||startEndRownumArr[1]<=0
                ||startEndRownumArr[0]==startEndRownumArr[1]) return null;
        if(startEndRownumArr[0]>=lstTestDeptData.size()) return null;
        System.out.println("显示的起始记录号："+startEndRownumArr[0]+"；结束记录号："+startEndRownumArr[1]);
        List<Map<String,String>> lstData=new ArrayList<Map<String,String>>();
        for(int i=startEndRownumArr[0];i<startEndRownumArr[1];i++)
        {
            if(i==lstTestDeptData.size()) break;
            lstData.add(lstTestDeptData.get(i));
        }
        
        return lstData;
    }

    /**
     * 处理列过滤
     * @param rrequest
     * @param filterColBean
     * @param datasetbean
     * @param mSelectedFilterValues
     * @return
     */
    @Override
	public Object getColFilterDataSet(ReportRequest rrequest,ColBean filterColBean,ReportDataSetValueBean datasetbean,
            Map<String,List<String>> mSelectedFilterValues)
    {

        return null;
    }

    @Override
	public Object getStatisticDataSet(ReportRequest rrequest,AbsReportType reportObj,ReportDataSetValueBean svbean,Object typeObj,String sql,
            boolean isStatisticForOnePage)
    {
        return null;
    }

   

}


