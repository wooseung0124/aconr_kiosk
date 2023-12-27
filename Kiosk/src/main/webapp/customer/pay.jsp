<%@page import="kiosk.order.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//테스트 너버
	int table_num=1;
	boolean pass=OrderDao.getInstance().delete(table_num);

%>

<script>


<%if(pass==true){%>
	alert("안녕히가세요.");
	window.location.href="test.jsp";
<% } %>

</script>