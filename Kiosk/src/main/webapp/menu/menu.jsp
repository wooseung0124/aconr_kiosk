<%@page import="kiosk.menu.dao.MenuDao"%>
<%@page import="kiosk.menu.dto.MenuDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
   //카테고리 받아옴
   
   //옆에 네비바에 이용
   
   //저 리스트를가지고 section을 생성해주면됨
   
   // list.forEach(카테고리 ->{
   //   section id=${카테고리}>
   
   //  그러면은 여기서 해당 카테고리에 맞는 sql을 통해 가져오면 됨 그러면 거기서 다시한 번 반복문
   
      
   
   //})
   //
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/menu_assets/css/main.css" />
<title>menu/menu.jsp</title>
<style>
	
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
                        <li><a href="${pageContext.request.contextPath}/index.jsp" id="top-link"><span class="icon solid fa-home">메인화면</span></a></li>
                        <li><a href="product/prod_insertform.jsp" id="portfolio-link"><span class="icon solid fa-th">메뉴 추가하기</span></a></li>
                        <!-- todo 이부분에서 가지고있는 카테고리 종류를 가져와야 함 -->
                        <c:forEach var="item" items="${categoryList}">
                           <li><a href="${'#'}${item.category}" id="${item.category}-link"><span class="icon solid fa-coffee">${item.category}</span></a></li>   
                        </c:forEach>
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

      <!-- Main -->
         <div id="main">

            <!-- Intro -->
               <section id="top" class="one dark cover">
                  <div class="container">

                     <header>
                        <h2 class="alt">카테고리별 메뉴 관리</h2>
                        <p>키오스크를 통해 카테고리별로 메뉴를 효율적으로 관리합시다. 각 메뉴의 가격, 재고, 그리고 상세 정보 등을 손쉽게 업데이트하고, 실시간으로 변경사항을 고객에게 전달할 수 있습니다.</p>
                     </header>

                     <footer>
                        <a href="product/prod_insertform.jsp" class="button scrolly">메뉴 추가하기</a>
                     </footer>

                  </div>
               </section>
            <c:forEach var="tmp1" items="${categoryList}" >
                  <section id="${tmp1.category}" class="two">
                     <div class="container">
   
                        <header>
                           <h2>${tmp1.category}</h2>
                        </header>
   
                        <p>커피 메뉴 관리 페이지에 오신 것을 환영합니다. 이곳에서는 각 커피 메뉴의 가격, 재고 상태, 그리고 상세 정보를 손쉽게 업데이트하고 관리할 수 있습니다. 효율적인 운영을 위해 활용해보세요.</p>
                         <div class="row">
                           <c:forEach var="tmp2" items="${menu_list}">
                           <c:if test="${tmp2.category eq tmp1.category and tmp2.stoNum eq tmp1.stoNum}">
                                 <div class="col-4">
                                    <article class="item">
                                       <a href="product/prod_updateform?name=${tmp2.name}" class="image fit">
                                       <c:choose>   
                                            <c:when test="${tmp2.imageUrl eq  null }">
                                               <img src="${pageContext.request.contextPath}/images/prepare.jpg" alt="" />
                                            </c:when>
                                            <c:otherwise><img id="ImageUrl" src="${pageContext.request.contextPath}/upload/${tmp2.imageUrl }" alt="상품 이미지"/></c:otherwise>
                                         </c:choose>
                                       </a>
                                       <header>
                                          <h3>${tmp2.name}</h3>
                                       </header>
                                    </article>
                                 </div>  
                           </c:if> 
                           </c:forEach>

                        </div>
                     </div>
                  </section>
               </c:forEach>        
      <!-- Scripts -->
         <script src="${pageContext.request.contextPath}/menu_assets/js/jquery.min.js"></script>
         <script src="${pageContext.request.contextPath}/menu_assets/js/jquery.scrolly.min.js"></script>
         <script src="${pageContext.request.contextPath}/menu_assets/js/jquery.scrollex.min.js"></script>
         <script src="${pageContext.request.contextPath}/menu_assets/js/browser.min.js"></script>
         <script src="${pageContext.request.contextPath}/menu_assets/js/breakpoints.min.js"></script>
         <script src="${pageContext.request.contextPath}/menu_assets/js/util.js"></script>
         <script src="${pageContext.request.contextPath}/menu_assets/js/main.js"></script>

   </body>
<!-- 
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
                 <c:otherwise><img id="ImageUrl" src="${pageContext.request.contextPath}/upload/${tmp.imageUrl }" alt="상품 이미지"  width="200px" height="200px"/></c:otherwise>
              </c:choose>
           
              
             
                <div class="product-name">${tmp.name }</div>
                <div class="product-price">${tmp.price }</div>
                <div class="product-description">${tmp.description }</div>
                
            </a>
        
        </c:forEach>
           
            <div class="clearfix"></div>
        </div>
   
</body>
-->
</html>