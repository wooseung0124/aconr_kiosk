<%@page import="customer.mvc.model.dao.MenuDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String category = (String)request.getParameter("category");

MenuDao dao=MenuDao.getInstance();


%>
["김구라","해골","원숭이","주뎅이","덩어리"]
{"num":1, "name":"김구라", "addr":"노량진"}
{"isSuccess":<%=isValid%>}