package kiosk.owner.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kiosk.owner.dto.OwnerDto;
import kiosk.util.DbcpBean;

public class OwnerDao {
	private static OwnerDao dao;
	private OwnerDao() {}
	public static OwnerDao getInstance() {
		if(dao == null){
			dao = new OwnerDao();
		}
		return dao;
	}
	public boolean insert(OwnerDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "INSERT INTO owner_info"
					+ " (sto_num, sto_name, o_name, email, pwd)"
					+ " VALUES (?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 내용이 있으면 바인딩
			pstmt.setString(1, dto.getSto_num());
			pstmt.setString(2, dto.getSto_name());
			pstmt.setString(3, dto.getO_name());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getPwd());

			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	public OwnerDto getData(String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OwnerDto dto = null;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "SELECT sto_num, sto_name, o_name, pwd"
					+ " FROM owner_info"
					+ " WHERE email=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 한다.
			pstmt.setString(1, email);
			//query 문 수행하고 결과(ResultSet) 얻어내기
			rs = pstmt.executeQuery();
			//반복문 돌면서 
			if (rs.next()) {
				String sto_num = rs.getString("sto_num");
				String sto_name = rs.getString("sto_name");
				String o_name = rs.getString("o_name");
				String pwd = rs.getString("pwd");
				dto = new OwnerDto(email, sto_num, sto_name, o_name, pwd);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection 객체의 close() 메소드를 호출하면 Pool 에 반납된다.
			} catch (Exception e) {
			}
		}
		return dto;
	}
}
