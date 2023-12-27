<%@page import="kiosk.menu.dto.MenuDto"%>
<%@page import="kiosk.menu.dao.MenuDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	MenuDto dto=(MenuDto)request.getAttribute("menudto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 상세히 보기</title>
<style>

</style>
</head>
<body>
	<div>
	<form action="${pageContext.request.contextPath}/customer/session" method="post">
	<div>
	<img src="<%=dto.getImageUrl() %>" alt="메뉴이미지" />
	<input type="hidden"  name="imageurl" value="<%=dto.getImageUrl() %>" >
	</div>
	<div>
	<!-- name 을 menu로 바꾸기 -->
	<label for="menu"><%=dto.getName() %></label>
	<input type="hidden"  name="menu" value="<%=dto.getName()%>" >
	</div>
	<div>
	<label for="description"><%=dto.getDescription() %></label>
	<input type="hidden"  name="description" value="<%=dto.getDescription() %>" />
	</div>
	<div>
	<label for="price"><%=dto.getPrice() %></label>
	<input type="hidden" name="price" value="<%=dto.getPrice() %>" />	
	</div>
	
	<button type="submit">장바구님에 담기</button>
	</form>
	
	</div>
</body>
</html>