<%@page import="java.util.ArrayList"%>
<%@page import="kiosk.order.dto.OrderDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String name = request.getParameter("name");
int price = Integer.parseInt(request.getParameter("price"));
boolean isSuccess = false;
List<OrderDto> shopList = (List<OrderDto>) session.getAttribute("shopList");
System.out.println(shopList + "1��°");
if (shopList == null) {
	shopList = new ArrayList<OrderDto>();
	OrderDto dto = new OrderDto();
	dto.setCount(1);
	dto.setMenu(name);
	dto.setPrice(price);
	shopList.add(dto);
	session.setAttribute("shopList", shopList);
	isSuccess = true;
	System.out.println(shopList + "2��°");
} else {
	//�׳� �߰� �ٵ� ���� �̹� list�� �����ϸ� ������ plus
	for (OrderDto order : shopList) {
		if (order.getMenu().equals(name)) {
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
	isSuccess = true;
}
pageContext.setAttribute("isSuccess", isSuccess);

System.out.println("name:" + name + "price:" + price);
// name�� null�̰ų� ���� ���� ��쿡 ���� ���� ó��
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>customer/add.jsp</title>
</head>
<body>
	<c:choose>
		<c:when test="${isSuccess}">
			<script>
				alert("��ٱ��Ͽ� �߰��Ͽ����ϴ�.");
				window.location.href = '${pageContext.request.contextPath}/customer/order_menu.jsp?isAdded=true';
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("��ٱ��Ͽ� ���� ���Ͽ����ϴ�.");
			 	window.location.href='${pageContext.request.contextPath}/customer/order_menu.jsp';
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>