package customer.mvc.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import customer.mvc.model.dto.CategoryDto;
import customer.mvc.model.dto.MenuDto;
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
	
	// 메뉴 카테고리 중복없이 가져오기
	public List<CategoryDto> getList(String stoNum){
		List<CategoryDto> list=new ArrayList<CategoryDto>();
		 
		Connection conn = null; // oracle scott 사용자 접속에 필요한 참조값 공간확보 
		PreparedStatement pstmt = null; // sql문을 대신 실행해줄 preparedStatement 객체의 참조값 공간확보 
		ResultSet rs = null; // DB 결과 값을 얻어내기 위한 공간확보 
		
		
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT distinct category" // distinct: 데이터 중복방
					+ " FROM menu_info"
					+ " WHERE sto_num = ?"; // 로그인한 사장님의 번호를 사용하여 설정한 카테고리를 가져온다.
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 한다.
			pstmt.setString(1, stoNum);

			//query 문 수행하고 결과(ResultSet) 얻어내기
			rs = pstmt.executeQuery();
			
			//반복문 돌면서 
			while (rs.next()) {
				CategoryDto dto=new CategoryDto();
				dto.setStoNum(stoNum);
				dto.setCategory(rs.getString("category"));
				list.add(dto);
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
		
		return list;
	}
	
	// 카테고리별로 메뉴정보 가져오기 
	public List<MenuDto> getList(CategoryDto cDto){
		List<MenuDto> list=new ArrayList<MenuDto>();
		
		Connection conn = null; // oracle scott 사용자 접속에 필요한 참조값 공간확보 
		PreparedStatement pstmt = null; // sql문을 대신 실행해줄 preparedStatement 객체의 참조값 공간확보 
		ResultSet rs = null; // DB 결과 값을 얻어내기 위한 공간확보 
		try {
			
			conn = new DbcpBean().getConn();
			String sql = "select *"
					+ " from menu_info"
					+ " where sto_num = ? and category = ?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 한다.
			pstmt.setString(1, cDto.getStoNum());
			pstmt.setString(2, cDto.getCategory());

			//query 문 수행하고 결과(ResultSet) 얻어내기
			rs = pstmt.executeQuery();
			
			//반복문 돌면서 
			while (rs.next()) {
				MenuDto dto=new MenuDto();
				dto.setStoNum(cDto.getStoNum());
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setDescription(rs.getString("description"));
				dto.setImageUrl(rs.getString("imageUrl"));
				dto.setSell(rs.getString("sell"));
				dto.setCategory(cDto.getCategory());
				list.add(dto);
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
		
		return list;
	}
	
	


}
