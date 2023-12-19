package kiosk.util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/*
 * Data Base Connection Pool 의 약자 Dbcp
 * 
 * Bean -> java 객체를 콩(bean) 이라고 부르기도 한다.
 */
public class DbcpBean {

	private Connection conn;

	public DbcpBean() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env"); 
			DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
			conn = ds.getConnection();
			System.out.println("Connection 얻어오기 성공!");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public Connection getConn() {
		return conn;
	}

}
