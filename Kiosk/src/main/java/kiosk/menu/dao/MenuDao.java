package kiosk.menu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kiosk.menu.dto.MenuDto;
import kiosk.util.DbcpBean;

public class MenuDao {
	private static MenuDao dao;
	
	private MenuDao() {}
	
	public static MenuDao getInstance() {
		if(dao==null) {
			dao=new MenuDao();
		}
		
		return dao;
	}
	
	//메뉴 상세히 보기
	public MenuDto detaillist(String name){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MenuDto dto=null;
		
		try {
			conn=new DbcpBean().getConn();
			String sql="select *"
					+ " from menu_info"
					+ " where name=?";
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto=new MenuDto();
				dto.setStoNum(rs.getString("sto_num"));	//사업자 번호
				dto.setName(rs.getString("name"));	//메뉴 이름
				dto.setPrice(rs.getInt("price"));	//메뉴 가격
				dto.setDescription(rs.getString("description"));	//메뉴 상세설명
				dto.setCategory(rs.getString("category"));	//카테고리
				dto.setImageUrl(rs.getString("imageurl"));	//이미지 주소
				dto.setIsSold(rs.getString("is_sold"));	//sold out 체크
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null)conn.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return dto;
	}
	
	
	//전체 메뉴 리스트
	public List<MenuDto> menulist(){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<MenuDto> list=new ArrayList<MenuDto>();
		
		try {
			conn=new DbcpBean().getConn();
			String sql="select *"
					+ " from menu_info"
					+ " order by name";
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MenuDto dto=new MenuDto();
				dto.setStoNum(rs.getString("sto_num"));	//사업자 번호
				dto.setName(rs.getString("name"));	//메뉴 이름
				dto.setPrice(rs.getInt("price"));	//메뉴 가격
				dto.setDescription(rs.getString("description"));	//메뉴 상세설명
				dto.setCategory(rs.getString("category"));	//카테고리
				dto.setImageUrl(rs.getString("imageurl"));	//이미지 주소
				dto.setIsSold(rs.getString("is_sold"));	//sold out 체크
				
				list.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null)conn.close();
				if(pstmt!=null)pstmt.close();
				if(rs!=null)rs.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	
	
}