package com.customer.personalize;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.wabacus.config.component.application.report.ReportBean;
import com.wabacus.system.ReportRequest;
import com.wabacus.system.commoninterface.IReportPersonalizePersistence;

public class TestReportPersonalizePersistenceImpl implements IReportPersonalizePersistence
{
    /**
     * 加载本报表保存的上次列拖动操作后的列顺序
     */
    @Override
	public String loadColOrderData(ReportRequest rrequest,ReportBean rbean)
    {
    	String user_id=(String)rrequest.getRequest().getSession().getAttribute("user_id");
    	Connection conn = rrequest.getConnection();
    	String page_id=rbean.getPageBean().getId();
    	String report_id=rbean.getId();
    	String personalize_value=null;
    	try {
    		personalize_value=getUserPersonalizeData(user_id,conn,page_id,report_id,"列拖动");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return personalize_value;
    }

    /**
     * 存储此报表列拖动后的顺序
     */
    @Override
	public void storeColOrderData(ReportRequest rrequest,ReportBean rbean,String colOrder)
    {
    	String user_id=(String)rrequest.getRequest().getSession().getAttribute("user_id");
    	Connection conn = rrequest.getConnection();
    	String page_id=rbean.getPageBean().getId();
    	String report_id=rbean.getId();
    	try {
    		setUserPersonalizeData(user_id, conn, page_id, report_id, colOrder,"列拖动");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

    /**
     * 加载用户对本报表进行列选择后显示的列
     */
    @Override
	public String loadColSelectedData(ReportRequest rrequest,ReportBean rbean)
    {
    	String user_id=(String)rrequest.getRequest().getSession().getAttribute("user_id");
    	Connection conn = rrequest.getConnection();
    	String page_id=rbean.getPageBean().getId();
    	String report_id=rbean.getId();
    	String personalize_value=null;
    	try {
    		personalize_value=getUserPersonalizeData(user_id,conn,page_id,report_id,"列选择");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return personalize_value;
        //return (String)rrequest.getRequest().getSession().getAttribute(rbean.getPageBean().getId()+rbean.getId()+"_colselecteddata");
    }

    /**
     * 存储此报表列选择后显示的列
     */
    @Override
	public void storeColSelectedData(ReportRequest rrequest,ReportBean rbean,String colSelectedData)
    {
    	String user_id=(String)rrequest.getRequest().getSession().getAttribute("user_id");
    	Connection conn = rrequest.getConnection();
    	String page_id=rbean.getPageBean().getId();
    	String report_id=rbean.getId();
    	try {
    		setUserPersonalizeData(user_id, conn, page_id, report_id, colSelectedData,"列选择");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        //rrequest.getRequest().getSession().setAttribute(rbean.getPageBean().getId()+rbean.getId()+"_colselecteddata",colSelectedData);
    }

    /**
     * 加载用户上次点击列标题进行列排序后的列及排序类型
     */
    @Override
	public String loadOrderByCol(ReportRequest rrequest,ReportBean rbean)
    {
    	String user_id=(String)rrequest.getRequest().getSession().getAttribute("user_id");
    	Connection conn = rrequest.getConnection();
    	String page_id=rbean.getPageBean().getId();
    	String report_id=rbean.getId();
    	String personalize_value=null;
    	try {
    		personalize_value=getUserPersonalizeData(user_id,conn,page_id,report_id,"列排序");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return personalize_value;
        //return (String)rrequest.getRequest().getSession().getAttribute(rbean.getPageBean().getId()+rbean.getId()+"_orderbycol");
    }

    /**
     * 当用户点击本报表列标题进行列排序后的排序列及排序类型
     */
    @Override
	public void storeOrderByCol(ReportRequest rrequest,ReportBean rbean,String orderByCol)
    {
    	String user_id=(String)rrequest.getRequest().getSession().getAttribute("user_id");
    	Connection conn = rrequest.getConnection();
    	String page_id=rbean.getPageBean().getId();
    	String report_id=rbean.getId();
    	try {
    		setUserPersonalizeData(user_id, conn, page_id, report_id, orderByCol,"列排序");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        //rrequest.getRequest().getSession().setAttribute(rbean.getPageBean().getId()+rbean.getId()+"_orderbycol",orderByCol);
    }

    /**
     * 从数据库中获取用户个性化信息
     */
    public String getUserPersonalizeData(String user_id,Connection conn,String page_id,String report_id,String personalize_type) throws SQLException{
		String sql = " select personalize_value from cst.sys_c_per_dspl where personalize_type=? and user_id=? and page_id=? and report_id=? ";
		PreparedStatement pstmt = null;
		String personalize_value=null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, personalize_type);
			pstmt.setString(2, user_id);
			pstmt.setString(3, page_id);
			pstmt.setString(4, report_id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				personalize_value = rs.getString("personalize_value");
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		}
    	return personalize_value;
    }

	/**
	 * 保存用户个性化信息到数据库
	 */
    public void setUserPersonalizeData(String user_id,Connection conn,String page_id,String report_id,String colOrder,String personalize_type) throws SQLException{
    	String deleteSql="delete from cst.sys_c_per_dspl where personalize_type=? and user_id=? and page_id=? and report_id=? ";
		String insertSql = " insert into cst.sys_c_per_dspl(user_id,page_id,report_id,personalize_type,personalize_value) values (? ,? ,? ,? ,?)";
		PreparedStatement pstmt = null;
		//System.out.println(insertSql);
		PreparedStatement pstmt2 = null;
		try {
			pstmt = conn.prepareStatement(deleteSql);
			pstmt.setString(1, personalize_type);
			pstmt.setString(2, user_id);
			pstmt.setString(3, page_id);
			pstmt.setString(4, report_id);
			pstmt.executeUpdate();

			pstmt2 = conn.prepareStatement(insertSql);
			pstmt2.setString(1, user_id);
			pstmt2.setString(2, page_id);
			pstmt2.setString(3, report_id);
			pstmt2.setString(4, personalize_type);
			pstmt2.setString(5, colOrder);
			System.out.println(insertSql+user_id);
			System.out.println("colOrder"+colOrder+"personalize"+personalize_type+"report_id"+report_id+"page_id"+page_id);
			pstmt2.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		}
    }
    
}
