<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("id", null);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/owner/logout.jsp</title>
</head>
<body>
	<script>
		alert("로그아웃 되었습니다. 감사합니다.");
		// javascript로 페이지 이동시키기
		location.href = "${pageContext.request.contextPath}/owner/login_form.jsp";
	</script>
</body>
</html>