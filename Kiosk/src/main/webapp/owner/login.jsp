<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	//이 페이지에 들어오게되면?? + 로그인이 성공되었을 때 
			
	//쿠키를 저장한다
			
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/owner_assets/css/main.css" />
<title>/owner/login.jsp</title>
</head>
<body class="is-preload">
		
		<!-- Header -->
			<header id="header">
			<c:choose>
				<c:when test="${isSuccess}">
					<h1>로그인 성공!</h1>
					<p>축하드립니다!<br/> 
					회원가입이 완료되었습니다. <br/>
					이제 저희 서비스를 자유롭게 이용하실 수 있습니다.<br/> 
					환영합니다!</p>
					<br />
					<a href="${pageContext.request.contextPath}/menu/menu.jsp">메뉴 관리 하러 가기</a>
				</c:when>
				<c:otherwise>
					<p>
					일시적인 오류로 서비스 접속에 실패했습니다.<br/>
					잠시 후 다시 시도해 주시기 바랍니다.<br/>
					<a href="signup_form.jsp">다시 가입하러가기</a>
					</p>
				</c:otherwise>
			</c:choose>
			</header>

		<!-- Footer -->
			<footer id="footer">
				<ul class="icons">
					<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
					<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
					<li><a href="#" class="icon brands fa-github"><span class="label">GitHub</span></a></li>
					<li><a href="#" class="icon fa-envelope"><span class="label">Email</span></a></li>
				</ul>
				<ul class="copyright">
					<li>&copy; Acorn Order. Design: Team1.</li>
				</ul>
			</footer>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/owner_assets/js/main.js"></script>
	
	<script>
		// OwnerDto를 쿠키에 저장하는 함수
	    const saveOwnerDtoToCookie = (ownerDto) => {
	        const jsonOwnerDto = JSON.stringify(ownerDto);
	        document.cookie = "ownerDto=" + encodeURIComponent(jsonOwnerDto) + "; path=/";
	    };
	
	    // 저장할 OwnerDto 객체 생성 (예시)
	    const ownerDto = {
	        email: "example@example.com"
	        // 다른 필드도 추가 가능
	    };
	
	    // OwnerDto를 쿠키에 저장
	    saveOwnerDtoToCookie(ownerDto);
	</script>
	</body>
</html>