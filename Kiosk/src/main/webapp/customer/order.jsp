<%@page import="kiosk.order.dto.OrderDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
boolean isSuccess = true;
List<OrderDto> shopList = (List<OrderDto>)session.getAttribute("shopList");
if(shopList.isEmpty()) isSuccess = false;
int totalPrice = 0;
for(OrderDto item : shopList){
	totalPrice += item.getCount() * item.getPrice();
}
pageContext.setAttribute("totalPrice", totalPrice);
pageContext.setAttribute("isSuccess", isSuccess);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/main_assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/main_assets/css/noscript.css" />
</noscript>
<title>customer/order.jsp</title>
<style>
	h1:hover {
		color: #64CCC5;
	
	}
</style>
</head>
<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<div class="logo">
							<span class="icon fa-gem"></span>
						</div>
						<div class="content">
							<div class="inner">
								<c:choose>
									<c:when test="${isSuccess}">
										<a href="#orderMenu"><h1>�ֹ� ������</h1></a>
										<p>�ֹ��� �����߽��ϴ�. ������ �ֹ��� ����帳�ϴ�!</p>
										<a href="${pageContext.request.contextPath}/customer/order">�߰� �ֹ��Ϸ�����</a>	
									</c:when>
									<c:otherwise>
										<p>�ֹ� �������� ������ �߻��Ͽ� ���еǾ����ϴ�. �̿뿡 ������� ��� �˼��մϴ�.</p>
										<a href="${pageContext.request.contextPath}/customer/order_menu.jsp">�ٽ� �ֹ��Ϸ�����</a>
									</c:otherwise>
								</c:choose>
								
							</div>
						</div>
						
					</header>

				<!-- Main -->
					<div id="main">
							<article id="orderMenu">
								<h2 class="major">�ֹ� ������</h2>

								<section>
									<h3 class="major">���</h3>
									<div class="table-wrapper">
										<table>
											<thead>
												<tr>
													<th>�ֹ� �޴�</th>
													<th>����</th>
													<th>����</th>
													<th>�Ѱ���</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="tmp" items="${sessionScope.shopList}">
														<tr>
															<td>${tmp.menu}</td>
															<td>${tmp.count }</td>
															<td>${tmp.price}��</td>
															<td>${tmp.count * tmp.price}��</td>
														</tr>
												</c:forEach>
											</tbody>
											<tfoot>
												<tr>
													<td colspan="3"></td>
													<td>${totalPrice}��</td>
												</tr>
											</tfoot>
										</table>
									</div>
								</section>

							</article>

					</div>

				<!-- Footer -->
					<footer id="footer">
						<p class="copyright">&copy; Untitled. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
					</footer>

			</div>

		<!-- BG -->
			<div id="bg"></div>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/main_assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/main_assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/main_assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/main_assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/main_assets/js/main.js"></script>

	</body>
</html>