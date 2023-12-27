<%@page import="kiosk.menu.dto.MenuDto"%>
<%@page import="kiosk.order.dto.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   
    List<OrderDto> shoplist=(List<OrderDto>) session.getAttribute("shoplist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/장바구니</title>
</head>
<body>

<div class="container">
	<h3>장바구니</h3>
	<p>
	<% 
	int total=0;
	
	for(OrderDto tmp:shoplist){
	total +=tmp.getPrice() *tmp.getCount();
	%>
	<p>
        메뉴: <%= tmp.getMenu() %>, 수량: <%= tmp.getCount() %>, 가격: <%= tmp.getPrice() %> 
       <td> <a href="${pageContext.request.contextPath}/customer/delete?menu=<%=tmp.getMenu()%>">삭제</a></td>
    </p>
		
	<%}if(total!=0){ %>
	합계 :<%=total %>
	</p>
	<a href="${pageContext.request.contextPath}/customer/order">주문하기</a>
	<a href="${pageContext.request.contextPath}/customer/menu">장바구니 더 담기</a>
	<%}else if(total==0){ %>
		<p>장바구니 목록이 없어요! 메뉴를 장바구니에 넣어주세요!</p>
		<a href="${pageContext.request.contextPath}/customer/menu">메뉴 보기</a>
	<%} %>	


</div>

</body>
</html>