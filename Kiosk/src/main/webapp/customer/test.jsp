
<%@page import="kiosk.menu.dao.MenuDao"%>
<%@page import="kiosk.menu.dto.MenuDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
  		List <MenuDto> list=MenuDao.getInstance().menulist();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<style>
body{
	display:flex;
}
	.list{
		list-style-type: none;
		margin: 0;
		padding: 0;
		
	}
	.list a{
		text-decoration: none;
		padding: 10px;
	}
	.menu{
		display: flex;

	}
	.sub{
	width:100px;
	height:100px;
	margin:5px;
	padding: 10px;	
	}
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
				<a href="detailTest.jsp?name=<%=data.getName()%>">
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
	<a href="ordertest.jsp">주문내역</a>
	<a href="shoppingtest.jsp">장바구니</a>
	<br />

</body>
</html>
