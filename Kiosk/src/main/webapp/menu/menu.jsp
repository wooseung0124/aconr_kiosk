<%@page import="kiosk.menu.dao.MenuDao"%>
<%@page import="kiosk.menu.dto.MenuDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu_main_page</title>
<style>
	.product-list{
    width: 735px;
    margin-left: auto;
    margin-right: auto;
}
.products h3{
    font-size: 24px;
    color: #545454;
    margin-top:60px;
    margin-bottom: 60px;
    text-align: center;
}

.product{
    display: block;
    width: 225px;
    text-align: center;
    text-decoration:none;
    color: black;
    float:left;
    margin-left: 10px;
    margin-right: 10px;
    margin-bottom: 30px;
}

.product-name{
    margin-top: 20px;
    margin-bottom: 4px;
}

.clearfix{
    clear: both;
}
</style>
</head>
<body>
	<h1>이제 시작해봅시다</h1>
	<ul>
		<li><a href="product/prod_insertform.jsp">상품등록</a></li>
		<li>category</li>
	</ul>
	
    <div class="products">
        <h3>Our New Products</h3>

        <div class="product-list">
       
        <c:forEach var="tmp" items="${menu_list}">
        
        	<a href="product/prod_updateform?name=${tmp.name}" class="product">
        		<c:choose>
        			<c:when test="${tmp.imageUrl eq  null }">
        			<svg width="225" height="100" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg"><rect x="10" y="10" width="80" height="80" rx="15" fill="#f0f0f0"/><text x="50%" y="50%" text-anchor="middle" fill="#888888" font-size="20">이미지 준비중</text></svg>
        			</c:when>
        			<c:otherwise>${tmp.imageUrl}</c:otherwise>
        		</c:choose>
        	
        		
             
                <div class="product-name">${tmp.name }</div>
                <div class="product-price">${tmp.price }</div>
                <div class="product-description">${tmp.description }</div>
                
            </a>
        
        </c:forEach>
           
            <div class="clearfix"></div>
        </div>
	
</body>
</html>