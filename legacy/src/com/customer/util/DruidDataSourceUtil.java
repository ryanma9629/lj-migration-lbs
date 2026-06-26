package com.customer.util;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;

import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Element;

import com.wabacus.config.database.datasource.AbsDataSource;
import com.wabacus.exception.WabacusConfigLoadingException;
import com.wabacus.exception.WabacusRuntimeException;
import com.wabacus.util.DesEncryptTools;

public class DruidDataSourceUtil extends AbsDataSource {
	private static Log log = LogFactory.getLog(DruidDataSourceUtil.class);

	private BasicDriverManagerDataSource ds;

	@Override
	public Connection getConnection() {
		try {
			log.debug("从数据源" + this.getName() + "获取数据库连接");
			return ds.getConnection();
		} catch (SQLException e) {
			throw new WabacusRuntimeException("获取" + this.getName() + "数据源的数据库连接失败", e);
		}
	}

	@Override
	public DataSource getDataSource() {
		return this.ds;
	}

	@Override
	public void closePool() {
		super.closePool();
		this.ds = null;
	}

	@Override
	public void loadConfig(Element eleDataSource) {
		super.loadConfig(eleDataSource);
		List lstEleProperties = eleDataSource.elements("property");
		if (lstEleProperties == null || lstEleProperties.size() == 0) {
			throw new WabacusConfigLoadingException("没有为数据源：" + this.getName() + "配置alias、configfile等参数");
		}
		String driver = null;
		String url = null;
		String user = null;
		String password = null;

		Element eleChild;
		String name;
		String value;
		for (int i = 0; i < lstEleProperties.size(); i++) {
			eleChild = (Element) lstEleProperties.get(i);
			name = eleChild.attributeValue("name");
			value = eleChild.getText();
			name = name == null ? "" : name.trim();
			value = value == null ? "" : value.trim();
			if (value.equals("")) {
				continue;
			}
			if (name.equals("driver")) {
				driver = value;
			} else if (name.equals("url")) {
				url = value;
			} else if (name.equals("user")) {
				user = value;
			} else if (name.equals("password")) {
				password = value;
			}
		}
		if (driver == null || url == null || user == null || driver.equals("") || url.equals("") || user.equals("")) {
			throw new WabacusConfigLoadingException("数据源：" + this.getName() + "配置的参数不完整，必须配置driver，url，user几个参数");
		}

		password = password == null ? "" : password.trim();
		if (password.startsWith("{3DES}")) {
			password = password.substring("{3DES}".length());
			if (DesEncryptTools.KEY_OBJ == null) {
				throw new WabacusConfigLoadingException("没有取到密钥文件，无法完成数据库密码解密操作");
			}
			password = DesEncryptTools.decrypt(password);
		}

		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			throw new WabacusConfigLoadingException("无法加载数据库驱动：" + driver, e);
		}
		ds = new BasicDriverManagerDataSource(driver, url, user, password);
	}

	@Override
	protected void finalize() throws Throwable {
		closePool();
		super.finalize();
	}

	private static class BasicDriverManagerDataSource implements DataSource {
		private final String driverClassName;
		private final String url;
		private final String username;
		private final String password;
		private volatile PrintWriter logWriter;
		private volatile int loginTimeout;

		private BasicDriverManagerDataSource(String driverClassName, String url, String username, String password) {
			this.driverClassName = driverClassName;
			this.url = url;
			this.username = username;
			this.password = password;
		}

		@Override
		public Connection getConnection() throws SQLException {
			ensureDriverLoaded();
			return DriverManager.getConnection(url, username, password);
		}

		@Override
		public Connection getConnection(String username, String password) throws SQLException {
			ensureDriverLoaded();
			return DriverManager.getConnection(url, username, password);
		}

		@Override
		public PrintWriter getLogWriter() {
			return logWriter;
		}

		@Override
		public void setLogWriter(PrintWriter out) {
			this.logWriter = out;
		}

		@Override
		public void setLoginTimeout(int seconds) {
			this.loginTimeout = seconds;
			DriverManager.setLoginTimeout(seconds);
		}

		@Override
		public int getLoginTimeout() {
			return loginTimeout;
		}

		@Override
		public Logger getParentLogger() {
			return Logger.getGlobal();
		}

		@Override
		public <T> T unwrap(Class<T> iface) throws SQLException {
			if (iface.isInstance(this)) {
				return iface.cast(this);
			}
			throw new SQLException("Unsupported unwrap target: " + iface.getName());
		}

		@Override
		public boolean isWrapperFor(Class<?> iface) {
			return iface.isInstance(this);
		}

		private void ensureDriverLoaded() throws SQLException {
			try {
				Class.forName(driverClassName);
			} catch (ClassNotFoundException e) {
				throw new SQLException("Unable to load JDBC driver " + driverClassName, e);
			}
		}
	}
}
