<%@page import="kiosk.menu.dao.MenuDao"%>
<%@page import="kiosk.menu.dto.MenuDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/menu/product/insert.jsp</title>
</head>
<body>


	<c:choose>
		<c:when test="${isSuccess}"> 
			<script>
				alert("상품 등록이 완료되었습니다.")
				window.location.href = '${pageContext.request.contextPath}/menu/menu';
			</script>	
		</c:when>
		<c:otherwise>
			<script>
				alert("상품등록을 실패하였습니다.")
			 	window.location.href='${pageContext.request.contextPath}/menu/product/prod_reg.jsp';
			</script>
		</c:otherwise>
	</c:choose>


</body>
</html>