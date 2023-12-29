<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
boolean isSuccess = true;

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
										<a href="#orderMenu"><h1>주문 내역서</h1></a>
										<p>주문이 성공했습니다. 소중한 주문에 감사드립니다!</p>
										<a href="${pageContext.request.contextPath}/customer/order_menu.jsp">추가 주문하러가기</a>	
									</c:when>
									<c:otherwise>
										<p>주문 과정에서 문제가 발생하여 실패되었습니다. 이용에 어려움을 드려 죄송합니다.</p>
										<a href="${pageContext.request.contextPath}/customer/order_menu.jsp">다시 주문하러가기</a>
									</c:otherwise>
								</c:choose>
								
							</div>
						</div>
						
					</header>

				<!-- Main -->
					<div id="main">
							<article id="orderMenu">
								<h2 class="major">주문 내역서</h2>

								<section>
									<h3 class="major">목록</h3>
									<div class="table-wrapper">
										<table>
											<thead>
												<tr>
													<th>Name</th>
													<th>Description</th>
													<th>Price</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>Item One</td>
													<td>Ante turpis integer aliquet porttitor.</td>
													<td>29.99</td>
												</tr>
												<tr>
													<td>Item Two</td>
													<td>Vis ac commodo adipiscing arcu aliquet.</td>
													<td>19.99</td>
												</tr>
												<tr>
													<td>Item Three</td>
													<td> Morbi faucibus arcu accumsan lorem.</td>
													<td>29.99</td>
												</tr>
												<tr>
													<td>Item Four</td>
													<td>Vitae integer tempus condimentum.</td>
													<td>19.99</td>
												</tr>
												<tr>
													<td>Item Five</td>
													<td>Ante turpis integer aliquet porttitor.</td>
													<td>29.99</td>
												</tr>
											</tbody>
											<tfoot>
												<tr>
													<td colspan="2"></td>
													<td>100.00</td>
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