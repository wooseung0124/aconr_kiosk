<%@page import="kiosk.menu.dto.MenuDto"%>
<%@page import="kiosk.menu.dao.MenuDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name=request.getParameter("name");
	MenuDto dto=MenuDao.getInstance().detaillist(name);
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
	<form action="sessiontest.jsp" method="post">
	<img src="<%=dto.getImageUrl() %>" alt="메뉴이미지" />
	<div>
	<label for="name"><%=dto.getName() %></label>
	<input type="hidden"  name="name" value="<%=dto.getName() %>" >
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