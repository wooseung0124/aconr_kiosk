<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/menu/product/prod_reg.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>상품등록페이지입니다.</h1>
	
		<h3>상품 정보를 등록해주세요</h3>
		<form action="prod_insert" method="post">
			<div>
				<label for="name">상품명</label>
				<input type="text" name="name" id="name" placeholder="상품 이름 입력" />
			</div>
			<div>
				<label for="price">가격</label>
				<input type="number" name="price" id="price" placeholder="가격 입력" />
			</div>
			<div>
				<label for="description">상품설명</label>
				<textarea name="description" id="description" cols="30" rows="10"></textarea>
			</div>
			<div>
				<label for="imageUrl">상품사진</label>
				<input type="file" name="imageUrl" id="imageUrl"/>
			</div>
			<div>
				<label for="category">카테고리</label>
				<input type="text" name="category" id="category" placeholder="카테고리 입력" />
			</div>
			
			<button type="submit">등록하기</button>
		</form>
		
		<script>
		
		</script>
	</div>
</body>
</html>	