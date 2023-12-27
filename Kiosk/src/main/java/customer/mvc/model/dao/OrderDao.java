package customer.mvc.model.dao;

import java.util.List;

import customer.mvc.model.dto.OrderDto;

public class OrderDao {
	private static OrderDao dao;
	
	private OrderDao() {}
	
	public static OrderDao getInstance() {
		if(dao==null) {
			dao=new OrderDao();
		}
		return dao;
	}
	
	// 원하는 메뉴를 골라 장바구니에 넣기
	public boolean insert(OrderDto dto) {
		
		return false;
	}
	
	// 장바구니에 넣어둔 모든 메뉴 불러오기
	public List<OrderDto> getList(String stoNum, int tableNum){
		
		return null;
	}
	
	// 장바구니에 넣어둔 메뉴 불러오기
	public OrderDto getdata(String stoNum, int tableNum, String menu) {
		
		return null;
	}
	
	// 장바구니에 담겨진 각 메뉴별로 수량 선택
	public void update(OrderDto dto) {
		
	}
	
	// 장바구니에 담겨진 메뉴중에서 선택삭제
	public void delete(OrderDto dto) {
		
	}
	
	
}
