<%@page import="kiosk.menu.dto.MenuDto"%>
<%@page import="kiosk.order.dto.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
  	request.setCharacterEncoding("utf-8");

    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
	<h3>장바구니</h3>
	<p>
	<% 
	List<OrderDto> shoplist=(List<OrderDto>) session.getAttribute("shoplist");
	for(OrderDto tmp:shoplist){%>
	<p>
        메뉴: <%= tmp.getMenu() %>, 수량: <%= tmp.getCount() %>, 가격: <%= tmp.getPrice() %> 
        <a href="deletesession.jsp?name=<%=tmp.getMenu()%>">삭제하기</a>
    </p>
		
	<%} %>
	</p>
	<a href="ordertest.jsp">주문하기</a>
	<a href="test.jsp">닫기</a>
</div>

</body>
</html>