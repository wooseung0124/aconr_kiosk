<%@page import="kiosk.order.dto.OrderDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name=request.getParameter("name");

	List<OrderDto> shoplist = (List<OrderDto>) session.getAttribute("shoplist");
	for (OrderDto order : shoplist) {
		 if (order.getMenu().equals(name)) {
			if(order.getCount() == 1) {
			 shoplist.remove(order);	
			}
		
		
            order.setCount(order.getCount() - 1);
            String url = request.getContextPath();
            response.sendRedirect(url + "/customer/shoppingtest.jsp");
        
		 }
		}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>