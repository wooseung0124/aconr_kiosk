<%@page import="kiosk.menu.dao.MenuDao"%>
<%@page import="kiosk.menu.dto.MenuDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	MenuDto dto = new MenuDto();
	String stoNum=(String)session.getAttribute("stoNum");
	String name= request.getParameter("name");
	int price=Integer.parseInt(request.getParameter("price"));
	String description=request.getParameter("description");
	String imageUrl=request.getParameter("imageUrl");
	String category=request.getParameter("category");
	System.out.println(imageUrl);
	
	dto.setStoNum("123-45-6789"); 
	dto.setName(name);
	dto.setPrice(price);
	dto.setDescription(description);
	dto.setImageUrl(imageUrl);
	dto.setCategory(category);
	
	boolean isSuccess=MenuDao.getInstance().insert(dto);
	//jstl을 사용하기 위해서는 request영역에 담는다.
	request.setAttribute("isSuccess",isSuccess);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/menu/product/insert.jsp</title>
</head>
<body>

	<c:choose>
		<c:when test="${isSuccess}"> 
			<script>
				alert("상품 등록이 완료되었습니다.")
				window.location.href = '${pageContext.request.contextPath}/menu/menu.jsp';
			</script>	
		</c:when>
		<c:otherwise>
			<script>
				alert("상품등록을 실패하였습니다.")
			 	window.location.href='${pageContext.request.contextPath}/menu/product/prod_reg.jsp';
			</script>
		</c:otherwise>
	</c:choose>


</body>
</html>