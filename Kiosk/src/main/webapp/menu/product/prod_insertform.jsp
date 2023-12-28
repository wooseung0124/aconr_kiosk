<%@page import="kiosk.menu.dto.MenuDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MenuDto dto = new MenuDto();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/menu/product/prod_reg.jsp</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/menu_assets/css/main.css" />
<style>
	#imageUrl{
		width:255px;
		height:150px;
	}
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
								<h2>메뉴 추가하기</h2>
							</header>

							<p>새롭게 출시된 메뉴를 손쉽게 등록하세요! 간단한 정보 입력으로 메뉴 이름, 가격, 상세 설명을 추가하고, 매력적인 이미지로 고객의 눈길을 사로잡으세요. 품절 정보와 카테고리 분류로 메뉴 관리가 한결 편리해집니다. 지금 바로 시작해 보세요.</p>

							<form method="post" action="prod_insert">
								<input type="hidden" name="imageUrl" value="<%=dto.getImageUrl() %>" />
								<div class="row">
									<div class="col-6 col-12-mobile">
										<label for="name">메뉴 이름</label>
										<input type="text" name="name" placeholder="메뉴 이름 입력" />
									</div>
									<div class="col-6 col-12-mobile">
										<label for="price">가격</label>
										<input type="text" name="price" id="price" " placeholder="메뉴 가격 입력" />
									</div>
									<div class="col-12">
										<label for="description">메뉴 설명</label>
										<textarea name="description" id="description" placeholder="메뉴 설명 입력"></textarea>
									</div>
									<div class="col-6 col-12-mobile">
										<label for="category">카테고리</label>
										<input type="text" name="category" id="category" placeholder="카테고리 입력"/>
									</div>
									<div class="col-6 col-12-moblie">
										<label for="imageUrl">상품사진</label>
										<div>
											<a href="javascript:" id="imageUrl">
												<%if(dto.getImageUrl()==null){ %>
													<svg width="225" height="100" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg"><rect x="10" y="10" width="80" height="80" rx="15" fill="#f0f0f0"/><text x="50%" y="50%" text-anchor="middle" fill="#888888" font-size="20">이미지 준비중</text></svg>
												<%}else{ %>
													<img id="imageUrl" src="${pageContext.request.contextPath}/upload/<%=dto.getImageUrl() %>" alt="상품 이미지" />
												<%} %>
											</a>
										</div>
									</div>
									<div class="col-12">
										<input type="submit" value="메뉴 등록" />
									</div>
								</div>
							</form>
							<!-- 화면에 보이지 않는 이미지 선택할 input type="file" -->
							<input type="file" id="image" accept="image/*" hidden/>
						</div>
					</section>
	</div>	
	<script>
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