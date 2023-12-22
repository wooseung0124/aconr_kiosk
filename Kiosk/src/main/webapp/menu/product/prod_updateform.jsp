<%@page import="kiosk.menu.dto.MenuDto"%>
<%@page import="kiosk.menu.dao.MenuDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/menu/product/prod_updateform</title>
</head>
<body>
<div class="container">
		<h1>상품등록페이지입니다.</h1>
	
		<h3>상품 정보를 등록해주세요</h3>
		<form action="prod_update_delete" method="post">
			<div>
				<label for="name">상품명</label>
				<input type="text" name="name" id="name" value="${dto.name} " placeholder="상품 이름 입력" />
			</div>
			<div>
				<label for="price">가격</label>
				<input type="number" name="price" id="price" value="${dto.price }" placeholder="가격 입력" />
			</div>
			<div>
				<label for="description">상품설명</label>
				<textarea name="description" id="description"  cols="30" rows="10">${dto.getDescription() }</textarea>
			</div>
			<div>
				<label for="imageUrl">상품사진</label>
				<input type="file" name="imageUrl" id="imageUrl"/>
			</div>
			<div>
				<label for="category">카테고리</label>
				<input type="text" name="category" id="category" value="${dto.getCategory()}" placeholder="카테고리 입력" />
			</div>
			<input type="submit" name="action" value="수정" />
			<input type="submit" name="action" value="삭제" />
			
		</form>
		
		<script>
		
		</script>
	</div>
</body>
</html>