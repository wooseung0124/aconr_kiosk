<%@page import="kiosk.menu.dto.MenuDto"%>
<%@page import="kiosk.menu.dao.MenuDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%
	MenuDto dto=(MenuDto)request.getAttribute("dto");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/menu/product/prod_updateform</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/menu_assets/css/main.css" />
<style>
	#image{
		display: none;
	}
	
	#imageUrl{
		width: 300px;
		height: 300px;
		text-decoration:none;
	}
	
	/* 체크박스 기본 스타일 숨기기 */
	input[type="checkbox"] {
	    appearance: none; /* 대부분의 브라우저에서 기본 스타일 숨김 */
	    -webkit-appearance: none; /* WebKit 기반 브라우저에서 기본 스타일 숨김 */
	    -moz-appearance: none; /* Firefox에서 기본 스타일 숨김 */
	    /* 다른 브라우저 지원을 위한 속성 추가 */
	    /* 원하는 스타일 적용 */
	    /* 예시 스타일 - 원하는 디자인으로 변경 */
	    width: 64.33px;
	    height: 64.33px;
	    border: 2px solid #ccc;
	    border-radius: 3px;
	}
	
		/* 체크 표시 스타일 */
	input[type="checkbox"]:checked::before {
		z-index:3;
	    content: "\2713"; /* 체크 표시 유니코드 사용 */
	    display: block;
	    text-align: center;
	    line-height: 64.33px; /* 체크박스 크기에 맞게 조정 */
	    color: #2196F3; /* 체크된 상태의 색상 */
	    font-size: 40px; /* 텍스트 크기에 따라 조정 */
	}
	/*.sell{
		margin-top:5px;
	}*/
</style>
</head>
<body class="is-preload">

<!-- Header -->
	<div id="header">

		<div class="top">

			<!-- Logo -->
				<div id="logo">
					<span class="image avatar48"><img src="${pageContext.request.contextPath}/images/avatar.jpg" alt="" /></span>
					<h1 id="title">김동주</h1>
					<p>억만장자</p>
				</div>

			<!-- Nav -->
				<nav id="nav">
					<ul>
						<li><a href="${pageContext.request.contextPath}/menu/menu" id="top-link"><span class="icon solid fa-home">메뉴 화면</span></a></li>
						<li><a href="" id="portfolio-link"><span class="icon solid fa-th">메뉴 추가하기</span></a></li>
					</ul>
				</nav>

		</div>

		<div class="bottom">

			<!-- Social Icons -->
				<ul class="icons">
					<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
					<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
					<li><a href="#" class="icon brands fa-github"><span class="label">Github</span></a></li>
					<li><a href="#" class="icon brands fa-dribbble"><span class="label">Dribbble</span></a></li>
					<li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>
				</ul>
		</div>

	</div>
	
	<div id="main">
		<!-- Contact -->
		<section id="contact" class="three">
			<div class="container">

				<header>
					<h2>메뉴 수정하기</h2>
				</header>

				<p>새롭게 출시된 메뉴를 손쉽게 등록하세요! 간단한 정보 입력으로 메뉴 이름, 가격, 상세 설명을 추가하고, 매력적인 이미지로 고객의 눈길을 사로잡으세요. 품절 정보와 카테고리 분류로 메뉴 관리가 한결 편리해집니다. 지금 바로 시작해 보세요.</p>

				<form action="prod_update_delete" id="prod_update_delete" method="post">
					<div class="row">
						<input type="hidden" name="imageUrl" value="${dto.imageUrl}"/>
						<div class="col-12 ">
							<label for="imageUrl">상품사진</label>
							<div>
								<a href="javascript:" id="imageUrl">
									<c:choose>
									    <c:when test="${empty dto.imageUrl}">
									        <svg width="225" height="100" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
									            <rect x="10" y="10" width="80" height="80" rx="15" fill="#f0f0f0"/>
									            <text x="50%" y="50%" text-anchor="middle" fill="#888888" font-size="20">이미지 준비중</text>
									        </svg>
									    </c:when>
									    <c:otherwise>
									        <img id="imageUrl" src="${pageContext.request.contextPath}/upload/${dto.imageUrl}" alt="상품 이미지"/>
									    </c:otherwise>
									</c:choose>
								</a>
							</div>
						</div>
						
						<div class="col-4 col-12-mobile">
							<label for="name">상품명</label>
							<input type="text" name="name" id="name" value="${dto.name}" placeholder="상품 이름 입력" />
						</div>
						<div class="col-2 col-12-mobile">
							<label for="price">가격</label>
							<input type="text" name="price" id="price" value="${dto.price}" placeholder="가격 입력" />
						</div>
						<div class="col-4 col-12-mobile">
							<label for="category">카테고리</label>
							<input type="text" name="category" id="category" value="${dto.getCategory()}" placeholder="카테고리 입력" />
						</div>
						<div class=" col-12-mobile">
							<label for="sell" style="text-align:center;">품절여부</label>
							 <input type="checkbox" class="sell" id="sell" name="sell" value="YES" >
							 <input type="hidden" id="sellChecked" value="${dto.sell}">
						</div>
						
						<div class="col-12">
							<label for="description">상품설명</label>
							<textarea name="description" id="description"  cols="30" rows="10">${dto.getDescription() }</textarea>
						</div>
						
						
						
					
						<div class="col-6">
							<input type="submit" name="action" value='수정' onclick="handleCheckbox()"/>
						</div>		
						<div class="col-6">
							<input type="submit" name="action" value="삭제" />
						</div>	
					<div>
				</form>
				<!-- 화면에 보이지 않는 이미지 선택할 input type="file" -->
				<input type="file" id="image" accept="image/*"/>
				</div>
		</section>
	</div>	
	
	<%--
	<div class="container">
		<h1>상품 수정 페이지입니다.</h1>
	
		<h3>상품 정보를 등록해주세요</h3>
		<form action="prod_update_delete" id="prod_update_delete" method="post">
			<input type="hidden" name="imageUrl" value="${dto.imageUrl}"/>
			<div>
				<label for="name">상품명</label>
				<input type="text" name="name" id="name" value="${dto.name}" placeholder="상품 이름 입력" />
			</div>
			<div>
				<label for="price">가격</label>
				<input type="number" name="price" id="price" value="${dto.price}" placeholder="가격 입력" />
			</div>
			<div>
				<label for="description">상품설명</label>
				<textarea name="description" id="description"  cols="30" rows="10">${dto.getDescription() }</textarea>
			</div>
			<div>
				<label for="imageUrl">상품사진</label>
				<div>
					<a href="javascript:" id="imageUrl">
						<c:choose>
						    <c:when test="${empty dto.imageUrl}">
						        <svg width="225" height="100" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
						            <rect x="10" y="10" width="80" height="80" rx="15" fill="#f0f0f0"/>
						            <text x="50%" y="50%" text-anchor="middle" fill="#888888" font-size="20">이미지 준비중</text>
						        </svg>
						    </c:when>
						    <c:otherwise>
						        <img id="imageUrl" src="${pageContext.request.contextPath}/upload/${dto.imageUrl}" alt="상품 이미지" width="200px" height="200px"/>
						    </c:otherwise>
						</c:choose>
					</a>
				</div>
			</div>
			<div>
				<label for="category">카테고리</label>
				<input type="text" name="category" id="category" value="${dto.getCategory()}" placeholder="카테고리 입력" />
			</div>
			<div>
				<label for="sell">품절여부</label>
				 <input type="checkbox" id="sell" name="sell" value="YES">
				 <input type="hidden" id="sellChecked" value="${dto.sell}"/>
			</div>
			
		
		
				<input type="submit" name="action" value='수정' onclick="handleCheckbox()"/>
				<input type="submit" name="action" value="삭제" />
			
			
		</form>
		<!-- 화면에 보이지 않는 이미지 선택할 input type="file" -->
		<input type="file" id="image" accept="image/*"/>
		</div>
		 --%>
		
<script>
		// 업데이트 폼에 체크 적용부분
		let checkValue= document.querySelector("#sellChecked").value;
		console.log(checkValue);
		
		if(checkValue=="YES"){
			document.querySelector("#sell").checked=true;
		}
		
		
		function handleCheckbox() {
		    const checkbox = document.getElementById('sell');
		    if (!checkbox.checked) {
		        const form = document.getElementById('prod_update_delete');
		        const hiddenInput = document.createElement('input');
		        hiddenInput.type = 'hidden';
		        hiddenInput.name = 'sell';
		        hiddenInput.value = 'NO';
		        form.appendChild(hiddenInput);
		    }
		}
		//링크를 클릭했을때 
		document.querySelector("#imageUrl").addEventListener("click", ()=>{
			// input type="file" 요소를 강제 클릭해서 파일 선택 창을 띄운다.
			document.querySelector("#image").click();
		});
		//새로운 이미지가 선택되었을때
		document.querySelector("#image").addEventListener("change", (e)=>{
			//전송할 file 데이터를 FormData 객체에 담는다.
			const fileData=e.target.files[0];
			const data=new FormData();
			// myImage 라는 파라미터명으로 fileData 를 담는다. 
			data.append("myImage", fileData);
			//fetch() 함수를 이용해서 페이지 전환없이 업로드
			fetch("upload_profile.jsp",{
				method:"post",
				body:data
			})
			.then(res=>res.json())
			.then(data=>{
				console.log(data);
				//img 요소를 만들 문자열 구성
				let img=`<img id="imageUrl" 
					src="${pageContext.request.contextPath}/upload/\${data.saveFileName}">`;
				//링크안에 출력하면서 html 형식으로 해석되도록 한다.
				document.querySelector("#imageUrl").innerHTML=img;
				//서버에 저장된 프로필 이미지의 이름을 input type="hidden" 의 value 로 넣어준다
				document.querySelector("[name=imageUrl]").value = data.saveFileName;
			});
		});
</script>
	
</body>
</html>