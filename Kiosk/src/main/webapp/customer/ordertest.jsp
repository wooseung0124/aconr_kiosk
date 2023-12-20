<%@page import="java.util.List"%>
<%@page import="kiosk.order.dto.OrderDto"%>
<%@page import="kiosk.order.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String name=request.getParameter("name");
    int tablenum=1;
     List<OrderDto> list=OrderDao.getInstance().order(tablenum);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록 테스트</title>
</head>
<body>
   <%for(OrderDto tmp:list){ %>
     <p>주문 하신 음식 <%=tmp.getMenu() %></p>
     <p>수량 <%=tmp.getCount()%></p>
     <p>가격 <%=tmp.getPrice() %></p>
     <%} %>
</body>
</html>