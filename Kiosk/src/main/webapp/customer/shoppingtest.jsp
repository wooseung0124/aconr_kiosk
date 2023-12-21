<%@page import="kiosk.order.dto.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
  	request.setCharacterEncoding("utf-8");
    
    if(request.getParameter("name")!=null){
    String name=request.getParameter("name");
  	String description=request.getParameter("description");
  	int price=Integer.parseInt(request.getParameter("price"));
    
  	//테스트 데이터
  	int count=1;
  	int tableNum=22;
  	
  	//이름 ,가격 ,갯수
  	List <OrderDto> list=new ArrayList<>();
  	OrderDto dto=new OrderDto();
  	dto.setMenu(name);
  	dto.setCount(count);
  	dto.setPrice(price);
  	dto.setTableNum(tableNum);
  	
  	list.add(dto);
  	
  	session.setAttribute("shop", list);
  	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
	<h3>장바구니</h3>
	<p>
	<%=session.getAttribute("shop") %>
	</p>
	<a href="ordertest.jsp">주문하기</a>
	<a href="test.jsp">닫기</a>
</div>

</body>
</html>