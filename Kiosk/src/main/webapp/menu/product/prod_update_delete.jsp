<%@page import="kiosk.menu.dto.MenuDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
	String action=(String)request.getAttribute("action");
	MenuDto dto=(MenuDto)request.getAttribute("dto");
	boolean isSuccess=(boolean)request.getAttribute("isSuccess");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/menu/prod_update_delete.jsp</title>
</head>
<body>
<script>
<%if(isSuccess){%>
	alert("상품 수정이 완료되었습니다.")
	window.location.href = '${pageContext.request.contextPath}/menu/menu';
<%}else{%>
	alert("상품 수정을 실패하였습니다.")
		window.location.href='${pageContext.request.contextPath}/menu/product/prod_updateform?name=<%=dto.getName()%>';
<%}%>
</script>
<%--
	<script>
	
		<%if(action.equals("수정")){ %>
			<%if(isSuccess){%>
				alert("상품 수정이 완료되었습니다.")
				window.location.href = '${pageContext.request.contextPath}/menu/menu';
			<%}else{%>
				alert("상품 수정을 실패하였습니다.")
		 		window.location.href='${pageContext.request.contextPath}/menu/product/prod_updateform';
			<%}%>
			
		<%}else if(action.equals("삭제")){%>
			<%if(isSuccess){%>
				alert("상품 삭제가 완료되었습니다.")
				window.location.href = '${pageContext.request.contextPath}/menu/menu';
			<%}else{%>
				alert("상품 삭제를 실패하였습니다.")
		 		window.location.href='${pageContext.request.contextPath}/menu/menu';
			<%}%>
		<%}%>
		*/
	</script>
	 --%>
	
</body>
</html>