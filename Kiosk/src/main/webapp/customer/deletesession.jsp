<%@page import="java.util.Iterator"%>
<%@page import="kiosk.order.dto.OrderDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String name=request.getParameter("name");

	List<OrderDto> shoplist = (List<OrderDto>) session.getAttribute("shoplist");
	
	Iterator<OrderDto> iter=shoplist.iterator();

	while(iter.hasNext()){
		OrderDto order=iter.next();
		 if (order.getMenu().equals(name)) {
				if(order.getCount() == 1) {
					iter.remove();	
			}
				 order.setCount(order.getCount() - 1);
		 }
		
	
	}
	 
    String url = request.getContextPath();
    response.sendRedirect(url + "/customer/");
		

%>
