
<%@page import="kiosk.menu.dao.MenuDao"%>
<%@page import="kiosk.menu.dto.MenuDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세번째, 메뉴 정보를 ui틀에 뿌림, 사진클릭시 디테일 화면으로 전환
	List <MenuDto> list=(List<MenuDto>)request.getAttribute("menulist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<style>

</style>
</head>
<body>
	<ul class="list">
		<li><a href="#">메뉴1</a></li>
		<li><a href="#">메뉴2</a></li>
		<li><a href="#">메뉴3</a></li>
	</ul>
	<br />

	<div class="menu">
		<%for(MenuDto data:list){ %>
			<div class="sub" >
				<p>
				<a href="${pageContext.request.contextPath}/customer/MenuDetail?name=<%=data.getName()%>">
				<%=data.getImageUrl() %>
				</a>
				</p>
				<div>
				<p><%=data.getName() %></a></p>
				<p><%=data.getPrice() %></p>
				</div>	
				
			</div>
			<%} %>
	</div>
	<a href="${pageContext.request.contextPath}/customer/orderlist">주문내역</a>
	<a href="${pageContext.request.contextPath}/customer/ShoppingList">장바구니</a>
	<br />

</body>
</html>
