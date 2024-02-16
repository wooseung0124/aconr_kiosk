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
	
	//같은 메뉴 주문이 들어오면 update를 통해 count 만 1올려주기 
	public void update(String menu) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=new DbcpBean().getConn();
			String sql="update order_info"
					+ " set count=count+1"
					+ " where menu=?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, menu);
			
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null)conn.close();
				if(pstmt!=null)pstmt.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
	}
	
	
	//메뉴가 있는지?(리스트로 수정0
	public List<String> select(int tableNum) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<String> list=new ArrayList<String>();
		try {
			conn=new DbcpBean().getConn();
			String sql="select menu"
					+ " from order_info"
					+ " where table_num=?";
			pstmt=conn.prepareStatement(sql);

			pstmt.setInt(1, tableNum);	
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				String menu=rs.getString("menu");
				list.add(menu);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try{
				if(conn!=null)conn.close();
				if(pstmt!=null)pstmt.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	
	//주문 삭제하기
	public boolean delete(int table_num) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int count=0;
		try {
			conn=new DbcpBean().getConn();
			String sql="delete from order_info"
					+ " where table_num=?";
			pstmt=conn.prepareStatement(sql);

			pstmt.setInt(1, table_num);	
			
			count=pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try{
				if(conn!=null)conn.close();
				if(pstmt!=null)pstmt.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(count>0) {
			return true;
		}else {
			return false;
		}
	}
	
	
	//주문 넣기
	public boolean insert(OrderDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int count=0;
		try {
			conn=new DbcpBean().getConn();
			String sql="insert into order_info"
					+ " (menu,price,count,table_num)"
					+ "	values(?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getMenu());
			pstmt.setInt(2, dto.getPrice());
			pstmt.setInt(3, dto.getCount());
			pstmt.setInt(4, dto.getTableNum());
			count=pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try{
				if(conn!=null)conn.close();
				if(pstmt!=null)pstmt.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(count>0) {
			return true;
		}else {
			return false;
		}
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
