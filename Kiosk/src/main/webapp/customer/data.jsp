<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.tomcat.util.json.JSONParser"%>
<%@page import="org.apache.catalina.valves.JsonAccessLogValve"%>
<%@page import="kiosk.menu.dto.UpdateMenuDto"%>
<%@page import="kiosk.order.dto.OrderDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String name = request.getParameter("name");
	int price = Integer.parseInt(request.getParameter("price")) ;
	boolean isSuccess = false;
	List<OrderDto> shopList = (List<OrderDto>) session.getAttribute("shopList");
	System.out.println(shopList);
	if(shopList == null){
		shopList = new ArrayList<OrderDto>();
        OrderDto dto = new OrderDto();
        dto.setCount(1);
        dto.setMenu(name);
        dto.setPrice(price);
        shopList.add(dto);
        session.setAttribute("shopList", shopList);
	}else{
		//그냥 추가 근데 만약 이미 list에 존재하면 갯수만 plus
		for(OrderDto order : shopList){
			if(order.getMenu().equals(name)){
				order.setCount(order.getCount() + 1);
				break;
			}
		}
		
			OrderDto dto = new OrderDto();
	        dto.setCount(1);
	        dto.setMenu(name);
	        dto.setPrice(price);
	        shopList.add(dto);
		
		session.setAttribute("shopList", shopList);
	}
	
	
    System.out.println("name:" + name + "price:" + price);
    // name이 null이거나 값이 없는 경우에 대한 예외 처리
%>
{"isSuccess":<%=isSuccess %> }
 