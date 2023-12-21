<%@page import="java.util.List"%>
<%@page import="kiosk.order.dto.OrderDto"%>
<%@page import="kiosk.order.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String name = request.getParameter("name");
int tablenum = 1;
List<OrderDto> list = OrderDao.getInstance().order(tablenum);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록 테스트</title>
<style>
 .container{
    text-align: center;
    
 }
</style>
</head>
<body>
    <div class="container">
    
	<table>
	 <caption>주문내역  <a href="test.jsp">닫기</a></caption>
		<thead>
			<tr>
				<th>상품명</th>
				<th>수량</th>
				<th>가격</th>
			</tr>
		</thead>
		<tbody>
			<%
			int total=0;
			for (OrderDto tmp : list) {
			int price=tmp.getPrice();
			total +=price;
			System.out.println(total);
			%>
			<tr>
				<td><%=tmp.getMenu()%></td>
				<td><%=tmp.getCount()%></td>
				<td><%=tmp.getPrice()%></td>
			</tr>
			<%}%>
		
		
		<tfoot>
			<tr>
				<th>합계</th>
				
				<td><%=total%></td>
			</tr>
		</tfoot>

		</tbody>

	</table>
</div>
</body>
</html>