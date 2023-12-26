<%@page import="kiosk.menu.dto.MenuDto"%>
<%@page import="kiosk.menu.dao.MenuDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/menu/product/prod_updateform</title>

<style>
	#image{
		display: none;
	}
	
	#imageUrl{
		width: 200px;
		height: 200px;
		border: 1px solid #cecece;
	
	}
</style>
</head>
<body>
<div class="container">
		<h1>상품 수정 페이지입니다.</h1>
	
		<h3>상품 정보를 등록해주세요</h3>
		<form action="prod_update_delete" method="post">
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
			
		
		
				<input type="submit" name="action" value='수정'/>
				<input type="submit" name="action" value="삭제" />
			
			
		</form>
		<!-- 화면에 보이지 않는 이미지 선택할 input type="file" -->
		<input type="file" id="image" accept="image/*"/>
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