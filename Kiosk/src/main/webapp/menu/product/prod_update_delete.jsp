<%@page import="kiosk.menu.dto.MenuDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
	String action=(String)request.getAttribute("action");
	System.out.println(action);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/menu/prod_update_delete.jsp</title>
</head>
<body>
	<c:choose>
		<c:when test="${action eq '수정'}"> 
				<c:when test="${isSuccess}"> 
					<script>
						alert("상품 수정이 완료되었습니다.")
						window.location.href = '${pageContext.request.contextPath}/menu/menu';
					</script>	
				</c:when>
			<c:otherwise>
					<script>
						alert("상품등록을 실패하였습니다.")
					 	window.location.href='${pageContext.request.contextPath}/menu/product/prod_updateform';
					</script>
			</c:otherwise>
		</c:when>
		<c:otherwise>
			<c:when test="${isSuccess}"> 
				<script>
					alert("상품 삭제가 완료되었습니다.")
					window.location.href = '${pageContext.request.contextPath}/menu/menu';
				</script>	
			</c:when>
			<c:otherwise>
					<script>
						alert("상품 삭제를 실패하였습니다.")
					 	window.location.href='${pageContext.request.contextPath}/menu/product/prod_updateform';
					</script>
			</c:otherwise>
		</c:otherwise>
	</c:choose>
</body>
</html>