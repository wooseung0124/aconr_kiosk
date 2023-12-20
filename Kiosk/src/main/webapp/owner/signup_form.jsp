<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h3>회원가입 폼 입니다</h3>
		<form action="" method="post">
			<div>
				<label class="form-label "for="stonum">사업자 번호</label>
				<input class="form-control" type="stonum" name="stonum" id="stonum"/>
				<div class="invalid-feedback">XXX-XX-XXXXX 형태의 10글자로 입력해주세요.</div>
			</div>
			<div>
				<label class="form-label" for="stoname">상호명</label>
				<input class="form-control" type="stoname" name="stoname" id="stoname"/>
				<div class="invalid-feedback">상호명은 한글로 30글자 이내로 작성해주세요.</div>
			</div>
			<div>
				<label class="form-label" for="username">가입자 이름</label>
				<input class="form-control" type="username" name="username" id="username"/>
				<div class="invalid-feedback">한글 이름 2~4자 이내로 작성해주세요.</div>
			</div>
			<div>
				<label class="form-label" for="email">이메일</label>
				<input class="form-control" type="email" name="email" id="email"/>
				<div class="invalid-feedback">이메일 형식에 맞게 입력하세요.</div>
			</div>
			<div>
				<label class="form-label" for="pwd">비밀번호</label>
				<input class="form-control" type="password" name="pwd" id="pwd"/>
				<small class="form-text">특수 문자를 하나 이상 조합하세요.</small>
				<div class="invalid-feedback">비밀번호를 확인 하세요.</div>
			</div>
			<div>
				<label class="form-label" for="pwd2">비밀번호 확인</label>
				<input class="form-control" type="password" id="pwd2"/>
			</div>
			<button class="btn btn-primary btn-sm" type="submit" disabled>가입</button>
		</form>
	</div>
	<script>
		let isStoNumValid=false;
		let isStoNameValid=false;
		let isUserNameValid=false;
		let isUserEmailValid=false;
		let isUserPwdValid=false;
		
		const checkForm = ()=>{
			//만일 아이디도 유효하고 그리고 비밀번호도 유효하고 그리고 비밀번호도 유효하다면
			if(isStoNumValid && isStoNameValid && isUserNameValid && isUserEmailValid && isPwdValid){
				//전송 버튼에 disabled 속성을 제거하고 
				document.querySelector("[type=submit]").removeAttribute("disabled");
			}else{
				//전송 버튼에 disabled 속성을 추가한다
				document.querySelector("[type=submit]").setAttribute("disabled", "");
			}
		};
		
		//사업자 번호를 검증할 정규 표현식
		const reg_stoNum = /([0-9]{3})-?([0-9]{2})-?([0-9]{5})/;
		
		document.querySelector("#stonum").addEventListener("input", (e) => {
		    const stoNum = e.target.value;

		    document.querySelector("#stonum").classList.remove("is-valid");
		    document.querySelector("#stonum").classList.remove("is-invalid");

		    if (reg_stoNum.test(businessNumber)) {
		        //유효한 사업자 번호
		        document.querySelector("#stonum").classList.add("is-valid");
		        isStoNumValid = true;
		    } else {
		        //유효하지 않은 사업자 번호
		        document.querySelector("#stonum").classList.add("is-invalid");
		        isStoNumValid = false;
		    }

		    checkForm();
		});
		
		//상호명을 검증할 정규 표현식
		const reg_stoName = /^[가-힣]{1,30}$/;
		
		document.querySelector("#stoname").addEventListener("input", (e) => {
		    const stoName = e.target.value;

		    document.querySelector("#stoname").classList.remove("is-valid");
		    document.querySelector("#stoname").classList.remove("is-invalid");

		    if (reg_stoName.test(stoName)) {
		        //유효한 상호명
		        document.querySelector("#stoname").classList.add("is-valid");
		        isStoNameValid = true;
		    } else {
		        //유효하지 않은 상호명
		        document.querySelector("#stoname").classList.add("is-invalid");
		        isStoNameValid = false;
		    }

		    checkForm();
		});
		
		//가입자 이름을 검증할 정규 표현식
		const reg_userName = /^[가-힣]{2,4}$/;
		
		document.querySelector("#username").addEventListener("input", (e) => {
		    const userName = e.target.value;

		    document.querySelector("#username").classList.remove("is-valid");
		    document.querySelector("#username").classList.remove("is-invalid");

		    if (reg_userName.test(userName)) {
		        //유효한 가입자 이름
		        document.querySelector("#username").classList.add("is-valid");
		        isUserNameValid = true;
		    } else {
		        //유효하지 않은 가입자 이름
		        document.querySelector("#username").classList.add("is-invalid");
		        isUserNameValid = false;
		    }

		    checkForm();
		});
		
		//이메일을 검증할 정규 표현식
		const reg_email=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		document.querySelector("#email").addEventListener("input", (e)=>{
			//이 함수에는 발생한 이벤트에 대한 정보를 가지고 있는 event 객체가 매개변수에 전달된다.
			console.log(e);
			//입력한 문자열 읽어오기  (e.target 은 이벤트가 발생한 바로 그 요소의 참조값이다)
			const email=e.target.value;
			
			//일단 is-valid 와 is-invalid 클래스를 제거를 먼저하고 
			document.querySelector("#email").classList.remove("is-valid");
			document.querySelector("#email").classList.remove("is-invalid");
			
			if(reg_email.test(email)){
				isEmailValid=true;
				document.querySelector("#email").classList.add("is-valid");
			}else{
				document.querySelector("#email").classList.add("is-invalid");
				isEmailvalid=false;
			}
			
			checkForm();
		});
			
			//fetch() 함수를 이용해서 get 방식으로 입력한 이메일을 보내고 사용가능 여부를 json 으로 응답받는다.
			fetch("${pageContext.request.contextPath}/user/check_id.jsp?id="+inputEmail)
			.then(res=>res.json())
			.then(data=>{
				//일단 클래스를 제거한 후에 
				document.querySelector("#email").classList.remove("is-valid");
				document.querySelector("#email").classList.remove("is-invalid");
				//data 는 {canUse:true} or {canUse:false} 형태의 object 이다.
				if(data.canUse){
					document.querySelector("#email").classList.add("is-valid");
					//사용할수 있는 이메일이라는 의미에서 true 를 넣어준다.
					isEmailValid=true;
				}else{
					document.querySelector("#email").classList.add("is-invalid");
					//사용할수 없는 이메일이라는 의미에서 false 를 넣어준다.
					isEmailValid=false;
				}
				checkForm();
			});
		});
		
		//비밀 번호를 검증할 정규 표현식(특수문자 포함여부)
		const reg_pwd=/[\W]/;
		
		//함수를 미리 만들어서 
		const checkPwd = ()=>{
			//양쪽에 입력한 비밀번호를 읽어와서
			let pwd=document.querySelector("#pwd").value;
			let pwd2=document.querySelector("#pwd2").value;
			
			//일단 is-valid 와 is-invalid 클래스를 제거를 먼저하고 
			document.querySelector("#pwd").classList.remove("is-valid");
			document.querySelector("#pwd").classList.remove("is-invalid");
			
			//일단 정규표현식을 만족하는지 확인해서 만족하지 않으면 함수를 여기서 종료
			//만일 첫번째 비밀번호가 정규표현식을 통과하지 못하거나 또는 두번째 비밀번호가 정규표현식을 통과하지 못한다면
			if( !reg_pwd.test(pwd) || !reg_pwd.test(pwd2)){
				document.querySelector("#pwd").classList.add("is-invalid");
				isUserPwdValid = false;
				checkForm();
				return;
			}
			
			if(pwd == pwd2){
				document.querySelector("#pwd").classList.add("is-valid");
				//비밀번호가 유효 하다는 의미에서 true 를 넣어준다.
				isUserPwdValid = true;
			}else{
				document.querySelector("#pwd").classList.add("is-invalid");
				//비밀번호가 유효 하지 않다는 의미에서 false 를 넣어준다.
				isUserPwdValid = false;
			}
			checkForm();
		};
		
		document.querySelector("#pwd").addEventListener("input", checkPwd);
		
		document.querySelector("#pwd2").addEventListener("input", checkPwd);
	</script>
</body>
</html>