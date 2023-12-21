<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/login_form.jsp</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/owner_assets/css/main.css" />
</head>
<body class="is-preload">

		<!-- Header -->
			<header id="header">
				<h1>Acorn Kiosk</h1>
				<p>사장님 전용 회원가입 페이지에 오신 것을 환영합니다.<br> 이곳에서는 가게 운영에 필요한 모든 관리 기능에 접근하실 수 있습니다. </p>
			</header>

		<!-- Signup Form -->
			<form id="signup-form" action="signup.jsp" method="post" >
				<div>
					<label for="stoNum">사업자 번호</label>
					<input type="text"  name="stoNum" id="stoNum" placeholder="사업자 번호"/>
				</div>
				<div>
					<label for="stoName">가게 이름</label>
					<input type="text" name="stoName" id="stoName" placeholder="가게 이름" />
				</div>
				<div>
					<label for="oNmae">사장님 이름</label>
					<input type="text" name="oNmae" id="oName" placeholder="사장님 이름" />
				</div>
				<div>
					<label for="email">이메일</label>
					<input type="email" name="email" id="email" placeholder="Email Address" />
				</div>
				<div>
					<label for="pwd">비밀번호</label>
					<input type="password" name="pwd" id="pwd" placeholder="비밀번호" />
				</div>
				<div style="margin-top : 1em;">
					<button type="submit">회원 가입</button>
				</div>
			</form>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/owner_assets/js/main.js"></script>

	</body>
	<script>
		document.querySelector("[type=submit]").addEventListener("click",()=>{
			console.log("눌림");
		});
	</script>
</html>