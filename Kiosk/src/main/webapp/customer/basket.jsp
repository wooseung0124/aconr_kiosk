<%@page import="kiosk.menu.dto.MenuDto"%>
<%@page import="kiosk.order.dto.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    int total=0;
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
	<%if(shoplist.size()!=0){ %>
		<table>
			<thead>
				<th>메뉴</th>
				<th>수량</th>
				<th>가격</th>
				<th>삭제</th>
			</thead>
		<tbody>
	<%
	for(OrderDto tmp:shoplist){ 
	total +=tmp.getPrice() *tmp.getCount();%>
	<tr>
		<td><%=tmp.getMenu() %></td>
		<td>
		<a href="${pageContext.request.contextPath}/customer/session?menu=<%=tmp.getMenu()%>&msg=minus"><button type="button">-</button></a>
		<%= tmp.getCount() %>
		<a href="${pageContext.request.contextPath}/customer/session?menu=<%=tmp.getMenu()%>&msg=plus"> <button type="button">+</button></a>
		</td>
		<td><%=tmp.getPrice() %></td>
		<td>
		 <a href="${pageContext.request.contextPath}/customer/delete?menu=<%=tmp.getMenu()%>">삭제</a>
		</td>
	</tr>
	<%}%>
	</tbody>
	<tfoot>
		<tr>
			<td>합계</td>	
			<td><%=total %></td>
		</tr>
	</tfoot>
	</table>
	<%}if(total!=0){ %>
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