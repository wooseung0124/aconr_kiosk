<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/owner/login_form.jsp</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/owner_assets/css/main.css" />
</head>
<body class="is-preload">

	<!-- Header -->
	<header id="header">
		<h1>Acorn Kiosk</h1>
		<p>사장님 로그인 페이지에 오신 것을 환영합니다.<br> 이곳에서는 가게 운영에 필요한 모든 관리 기능에 접근하실 수 있습니다.<br>
			<strong><a href="signup_form.jsp">회원가입 하러 가기</a></strong>
		</p>
	</header>

	<!-- Signup Form -->
	<form id="signup-form" action="${pageContext.request.contextPath}/owner/login" method="post" >
		<div>
			<label for="email">이메일</label>
			<input type="email" name="email" id="email" placeholder="Email Address" />
		</div>
		<div>
			<label class="form-label" for="pwd">비밀번호</label>
			<input class="form-control" type="password" name="pwd" id="pwd" placeholder="비밀번호" />
		</div>
		<div style="margin-top : 1em;">
			<button type="submit" disabled>로그인</button>
		</div>
	</form>

	<!-- Scripts -->
	<script src="${pageContext.request.contextPath}/owner_assets/js/main.js"></script>

</body>
<script>
	// OwnerDTO를 쿠키에 저장하는 함수
	const saveOwnerDtoToCookie = (ownerDto) => {
		const jsonOwnerDto = JSON.stringify(ownerDto);
		document.cookie = "savedDto=" + encodeURIComponent(jsonOwnerDto) + "; path=/";
	};

	// 쿠키에서 OwnerDTO 정보 읽어오기
	const readOwnerDtoFromCookie = () => {
		const savedDto = readCookie('savedDto');
		return savedDto ? JSON.parse(savedDto) : null;
	};

	// 쿠키에서 정보를 읽어오는 함수
	const readCookie = (name) => {
		const cookies = document.cookie.split(';');
		for (let i = 0; i < cookies.length; i++) {
			const cookie = cookies[i].trim();
			if (cookie.startsWith(name + '=')) {
				return decodeURIComponent(cookie.substring(name.length + 1));
			}
		}
		return null;
	};

	document.addEventListener('DOMContentLoaded', () => {
		// 쿠키에서 OwnerDTO 읽어오기
		const savedDto = readOwnerDtoFromCookie();

		// OwnerDTO 정보가 있으면 화면에 표시
		if (savedDto) {
			document.getElementById('email').value = savedDto.email;
			// 다른 필드에 대한 처리도 추가 가능
		}

		let emailNN = false;
		let pwdNN = false;
		document.querySelector("#email").addEventListener("input",(e)=>{
			emailNN = true;
			if(e.target.value == "") emailNN = false;
			checkNN();
		});
		document.querySelector("#pwd").addEventListener("input",(e)=>{
			pwdNN = true;
			if(e.target.value == "") pwdNN = false;
			checkNN();
		});

		// 아이디와 비밀번호가 입력이 되어있을 때만 로그인 버튼 활성화하기 위한 함수
		const checkNN = () =>{
			if(emailNN && pwdNN) document.querySelector("[type=submit]").removeAttribute("disabled");
			else document.querySelector("[type=submit]").setAttribute("disabled","");
		}
	});
</script>
</html>