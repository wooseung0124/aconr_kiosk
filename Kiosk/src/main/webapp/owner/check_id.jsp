<%@page import="kiosk.owner.dto.OwnerDto"%>
<%@page import="kiosk.owner.dao.OwnerDao"%>
<%@ page language="java" contentType="application/json; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String email = (String)request.getParameter("email");

	boolean canUse = true;
	
	OwnerDto dto = OwnerDao.getInstance().getData(email);
	if(dto != null) canUse = false;
%>
{"canUse" : <%=canUse %>}