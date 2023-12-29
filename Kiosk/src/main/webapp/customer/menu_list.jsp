<%@page import="kiosk.menu.dto.MenuDto"%>
<%@page import="kiosk.menu.dto.CategoryDto"%>
<%@page import="kiosk.menu.dao.MenuDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String clickCategory = (String)request.getParameter("clickCategory");
System.out.println("json - category : "+clickCategory);

// 여기서 order_menu.jsp 의 clickCategory 변수를 저장한다.
// request.setAttribute("clickCategory", clickCategory);

// 밑에 json 문자열은 잘 전달되었는지 자바스크립트로 테스트
%>
{"clickCategory":"<%= clickCategory%>"}