<%@page import="java.util.List"%>
<%@page import="kiosk.order.dto.OrderDto"%>
<%@page import="kiosk.order.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//test data
int tableNum = 1;


//세션이 null이면 test.jsp 로 보낸다.
if(session.getAttribute("shoplist")==null){
	String url = request.getContextPath();
    response.sendRedirect(url + "/customer/test.jsp");
    return;
}

//list 타입으로 세션을 얻어온다.
List<OrderDto> shoplist = (List<OrderDto>) session.getAttribute("shoplist");

boolean success=false;


//session 에 shoplist 반복문 돌면서 orderdto 에 값 넣고 DB에 insert 하기
for(OrderDto tmp:shoplist){
	List<String> list=OrderDao.getInstance().select(tableNum);
	//
	boolean pass=false;
	//dto에 session에 있는 정보 담기
	OrderDto dto=new OrderDto();
	dto.setMenu(tmp.getMenu());
	dto.setPrice(tmp.getPrice());
	dto.setCount(tmp.getCount());
	dto.setTableNum(tableNum);
	
	
	for(String menu:list){
		if(menu != null&&tmp.getMenu().equals(menu)){
			OrderDao.getInstance().update(menu);
			pass=true;
			success=true;
			break;
		}else if(menu==null){
			success=OrderDao.getInstance().insert(dto);
			break;
		}
	}
	if(!pass){
		success=OrderDao.getInstance().insert(dto);
	}
}

	session.removeAttribute("shoplist");

%>
<script>

   <% if (success) { %>
        alert("주문이 완료되었습니다.");
        window.location.href = "test.jsp";
    <% } %>
</script>