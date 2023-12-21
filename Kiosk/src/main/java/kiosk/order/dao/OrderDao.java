package kiosk.order.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kiosk.menu.dao.MenuDao;
import kiosk.order.dto.OrderDto;
import kiosk.util.DbcpBean;

public class OrderDao {
	private static OrderDao dao;

	private OrderDao() {
	}

	public static OrderDao getInstance() {
		if (dao == null) {
			dao = new OrderDao();
		}
		return dao;
	}

	
	//주문 내역 보기
	public List<OrderDto> order(int tablenum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<OrderDto> list = new ArrayList<>();
		try {
			conn = new DbcpBean().getConn();
			String sql = "select menu,count,price" + " from order_info" + " where table_num=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, tablenum);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderDto dto = new OrderDto();
				dto.setMenu(rs.getString("menu"));
				dto.setCount(rs.getInt("count"));
				dto.setPrice(rs.getInt("price"));
			    list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

}
