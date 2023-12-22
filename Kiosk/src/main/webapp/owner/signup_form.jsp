<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/owner/signup_form.jsp</title>
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
			<form id="signup-form" action="${pageContext.request.contextPath}/owner/signup" method="post" >
				<div>
					<label for="stoNum">사업자 번호</label>
					<input type="text"  name="stoNum" id="stoNum" placeholder="사업자 번호"/>
					<small id="smallStoNum">000-00-00000로 숫자로만 10자로 입력해주세요.</small>
					<!-- 자동 대시 작성 기능 -->
				</div>
				<div>
					<label for="stoName">가게 이름</label>
					<input type="text" name="stoName" id="stoName" placeholder="가게 이름" />
					<small id="smallStoName">한글로만 30자 이내로 입력해주세요.</small>
				</div>
				<div>
					<label for="oName">사장님 이름</label>
					<input type="text" name="oName" id="oName" placeholder="사장님 이름" />
					<small id="smallOName">한글로 2~4자 이내로 입력해주세요.</small>
					
				</div>
				<div>
					<label for="email">이메일</label>
					<input type="email" name="email" id="email" placeholder="Email Address" />
					<small id="smallEmail"></small>
				</div>
				<div>
					<label class="form-label" for="pwd">비밀번호</label>
					<input class="form-control" type="password" name="pwd" id="pwd" placeholder="비밀번호" />
					<small id="smallPwd"></small>
					
				</div>
				<div>
					<label class="form-label" for="pwd2">비밀번호 확인</label>
					<input class="form-control" type="password" name="pwd" id="pwd2" placeholder="비밀번호 확인" />
					<!-- <small class="form-text">비밀번호와 비밀번호 확인란에 입력된 문자가 일치해야 합니다.</small>
					<div class="valid-feedback">비밀번호가 일치합니다.</div>
					<div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>  -->
					
				</div>
				<div style="margin-top : 1em;">
					<button type="submit">회원 가입</button>
				</div>
			</form>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/owner_assets/js/main.js"></script>
	
	</body>
	<script>
		let isStoNumValid=false;
		let isStoNameValid=false;
		let isONameValid=false;
		let isEmailValid=false;
		let isPwdValid=false;
		
		const checkForm = ()=>{
			//만일 아이디도 유효하고 그리고 비밀번호도 유효하고 그리고 비밀번호도 유효하다면
			if(isStoNumValid && isStoNameValid && isONameValid && isEmailValid && isPwdValid){
				//전송 버튼에 disabled 속성을 제거하고 
				document.querySelector("[type=submit]").removeAttribute("disabled");
			}else{
				//전송 버튼에 disabled 속성을 추가한다
				document.querySelector("[type=submit]").setAttribute("disabled", "");
			}
			console.log(isStoNumValid);
			console.log(isStoNameValid);
			console.log(isONameValid);
			console.log(isEmailValid);
			<console></console>.log(isPwdValid);
		};
		
		//사업자 번호를 검증할 정규 표현식
		const reg_stoNum =  /^[0-9]{3}-[0-9]{2}-[0-9]{5}$/;
		
		document.querySelector("#stoNum").addEventListener("input", (e) => {
		    const stoNum = e.target.value;
			const small = document.querySelector("#smallStoNum");
		    if (reg_stoNum.test(stoNum)) {
		        //유효한 사업자 번호
		        isStoNumValid = true;
		        e.target.setCustomValidity('');
		        small.innerText = "사용 가능한 사업자 번호 입니다.";
		    } else {
		        //유효하지 않은 사업자 번호
		        isStoNumValid = false;
		        e.target.setCustomValidity('사업자 번호 형태에 맞게 입력해주세요.\n000-00-00000로 숫자로만 10자로 입력해주세요.');
			    e.target.reportValidity();
			    small.innerText = "";
		    }
	
		    checkForm();
		});
		
		//상호명을 검증할 정규 표현식
		const reg_stoName = /^[가-힣]{1,30}$/;
		
		document.querySelector("#stoName").addEventListener("input", (e) => {
		    const stoName = e.target.value;
			const small = document.querySelector("#smallStoName");
		    if (reg_stoName.test(stoName)) {
		        //유효한 상호명
		        isStoNameValid = true;
		        e.target.setCustomValidity('');
		        small.innerText = "사용 가능한 가게 이름입니다.";
		    } else {
		        //유효하지 않은 상호명
		        isStoNameValid = false;
		        e.target.setCustomValidity('영문자가 포함되어 있거나 30자를 초과하셨습니다.\n한글로만 30자 이내로 입력해주세요.');
		        e.target.reportValidity();
		        small.innerText = "";
		    }
		    
		    checkForm();
		});
		
		//가입자 이름을 검증할 정규 표현식
		const reg_oName = /^[가-힣]{2,4}$/;
		
		document.querySelector("#oName").addEventListener("input", (e) => {
		    const oName = e.target.value;
		    const small = document.querySelector("#smallOName");
	
		    if (reg_oName.test(oName)) {
		        //유효한 가입자 이름
		        isONameValid = true;
		        e.target.setCustomValidity('');
		        small.innerText = "사용가능한 이름입니다.";
		    } else {
		        //유효하지 않은 가입자 이름
		        isONameValid = false;
		        e.target.setCustomValidity("한글로 2~4자 이내로 입력해주세요.");
		        e.target.reportValidity();
		        small.innerText = "";
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
			const small = document.querySelector("#smallEmail");
			
			if(reg_email.test(email)){
				isEmailValid=true;
				e.target.setCustomValidity("");
				small.innerText = "사용가능한 이메일 입니다."
			}else{
				isEmailvalid=false;
				e.target.setCustomValidity("이메일 형식에 맞게 입력해주세요.");
				e.target.reportValidity();
				small.innerText = "";
			}
			
			//fetch() 함수를 이용해서 get 방식으로 입력한 이메일을 보내고 사용가능 여부를 json 으로 응답받는다.
			//todo 이부분의 jsp를 만들어야한다.
			fetch("${pageContext.request.contextPath}/user/check_id.jsp?id="+e.target.value)
			.then(res=>res.json())
			.then(data=>{
				//data 는 {canUse:true} or {canUse:false} 형태의 object 이다.
				if(data.canUse){
					//사용할수 있는 이메일이라는 의미에서 true 를 넣어준다.
					isEmailValid=true;
					e.target.setCustomValidity("");
					small.innerText = "사용가능한 이메일 입니다."
				}else{
					//사용할수 없는 이메일이라는 의미에서 false 를 넣어준다.
					isEmailValid=false;
					e.target.setCustomValidity("중복된 이메일 입니다.");
					e.target.reportValidity();
					small.innerText = "";
				}
				checkForm();
			});
		});
	
		
		//비밀 번호를 검증할 정규 표현식(특수문자 포함여부)
		const reg_pwd=/[\W]/;
		//함수를 미리 만들어서 
		const checkPwd = ()=>{
			//양쪽에 입력한 비밀번호를 읽어와서
			let pwd=document.querySelector("#pwd");
			let pwd2=document.querySelector("#pwd2");
			
			const small = document.querySelector("#smallPwd");
			//일단 정규표현식을 만족하는지 확인해서 만족하지 않으면 함수를 여기서 종료
			//만일 첫번째 비밀번호가 정규표현식을 통과하지 못하거나 또는 두번째 비밀번호가 정규표현식을 통과하지 못한다면
			if( !reg_pwd.test(pwd.value)){
				isPwdValid = false;
				pwd.setCustomValidity("특수문자를 포함해야 합니다.");
				pwd.reportValidity();
				pwd2.setCustomValidity("");
				small.innerText="";
				checkForm();
				return;
			} else if(!reg_pwd.test(pwd2.value)) {
				isPwdValid = false;
				pwd2.setCustomValidity("특수문자를 포함해야 합니다.");
				pwd2.reportValidity();
				pwd.setCustomValidity("");
				small.innerText="";
				checkForm();
				return;
			}else {
				pwd.setCustomValidity("");
				pwd2.setCustomValidity("");
			}
			
			if(pwd.value == pwd2.value){
				//비밀번호가 유효 하다는 의미에서 true 를 넣어준다.
				isPwdValid = true;
				pwd.setCustomValidity("");
				small.innerText = "사용 가능한 비밀번호 입니다.";
			}else{
				//비밀번호가 유효 하지 않다는 의미에서 false 를 넣어준다.
				isPwdValid = false;
				pwd.setCustomValidity("비밀번호가 일치하지 않습니다.");
				pwd.reportValidity();
				small.innerText="";
			}
			checkForm();
		};
		
		document.querySelector("#pwd").addEventListener("input", checkPwd);
		
		document.querySelector("#pwd2").addEventListener("input", checkPwd);
	</script>
</html>