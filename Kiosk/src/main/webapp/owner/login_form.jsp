<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/login_form.jsp</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<body>
	<div class="container">
		<form action="login.jsp" method="post">
			<div>
				<label for="email">이메일</label>
				<input type="text" class="form-control" id="email" name="email" placeholder="example@example.com"/>
			</div>
			<div>
				<label for="pwd ">비밀번호</label>
				<input type="text" class="form-control" id="pwd " name="pwd " placeholder="비밀번호 입력..."/>
			</div>
			<div>
				<input type="checkbox" name=saveUser value="no" id="userMemory" />
				<label for="userMemory">자동 로그인</label>
			</div>
			<button class="btn btn-primary w-100 py-2" type="submit">로그인</button>
		</form>
	</div>
</body>
</html>