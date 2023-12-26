<%@page import="kiosk.menu.dao.MenuDao"%>
<%@page import="kiosk.menu.dto.MenuDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
//HttpSession session =req.getSession();
		MenuDto dto = new MenuDto();
		
		
		//String stoNum=(String)session.getAttribute("stoNum");
		String name= request.getParameter("name");
		int price=Integer.parseInt(request.getParameter("price"));
		String description=request.getParameter("description");
		String imageUrl=request.getParameter("imageUrl");
		String category=request.getParameter("category");
		
		
		//dto.setStoNum(stoNum); 
		dto.setName(name);
		dto.setPrice(price);
		dto.setDescription(description);
		dto.setImageUrl(imageUrl);
		dto.setCategory(category);
		
		
		
		
		boolean isSuccess=MenuDao.getInstance().update(dto);
		//jstl을 사용하기 위해서는 request영역에 담는다.
		
		
		System.out.println(isSuccess);
		System.out.println(dto.getName());
		System.out.println(dto.getPrice());
		System.out.println(dto.getDescription());
		System.out.println(dto.getImageUrl());
		System.out.println(dto.getCategory());

		

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/menu/prod_update_delete.jsp</title>
</head>
<body>
<script>
<%if(isSuccess){%>
	alert("성공하나연?")
	window.location.href = '${pageContext.request.contextPath}/menu/menu';
<%}else{%>
	alert("실패하였습니다.")
	window.location.href = '${pageContext.request.contextPath}/menu/product/prod_updateform?name=<%=dto.getName()%>';
<%}%>
</script>

	
</body>
</html>