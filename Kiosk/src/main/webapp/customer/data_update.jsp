<%@page import="kiosk.order.dto.OrderDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
//추가(수정)사항 : tableNum => 유저ID

int tableNum = 1; // 테이블 좌석(테스트코드)
String name = request.getParameter("name"); // 메뉴 이름
int count = Integer.parseInt(request.getParameter("count")); // 메뉴 수량

List<OrderDto> shopList = (List<OrderDto>)session.getAttribute("shopList");
System.out.println("data_update.jsp-json name : "+name+", count : "+count);

boolean isSuccess = false;
%>