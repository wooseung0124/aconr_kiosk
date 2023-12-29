
<%@page import="kiosk.menu.dao.MenuDao"%>
<%@page import="kiosk.menu.dto.MenuDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List <MenuDto> list=(List<MenuDto>)request.getAttribute("menulist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<style>
.menu{
	display:flex;
	flex-wrap: wrap;
	justify-content: space-between;
	row-gap:20px;
	align-items: baseline;
}
 .sub{
	width: 200px;
	height: 200px; 
	border: 1px solid red;
	}
.t{
	align-content: center;
}
</style>
</head>
<body>


	<div class="menu">
		
			
	<%for(MenuDto data:list){ %>
		<div class="sub" >
				
<a href="${pageContext.request.contextPath}/customer/MenuDetail?name=<%=data.getName()%>"><%=data.getImageUrl() %></a>
		<p>
		<%=data.getName() %>
		</p>
		<p>
		<%=data.getPrice() %>
		</p>
		</div>	
		
	<%} %>
	

			
	</div>
	<div class="t">
	<a href="${pageContext.request.contextPath}/customer/orderlist">주문내역</a>
	<a href="${pageContext.request.contextPath}/customer/ShoppingList">장바구니</a>
	<a href="${pageContext.request.contextPath}/customer/callList.jsp">직원호출</a>
	</div>

</body>
</html>
