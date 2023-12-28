<%@page import="kiosk.menu.dto.MenuDto"%>
<%@page import="kiosk.menu.dto.CategoryDto"%>
<%@page import="kiosk.menu.dao.MenuDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String stoNum = (String)session.getAttribute("stoNum");
String category = (String)request.getParameter("category");

CategoryDto cDto=new CategoryDto();
cDto.setStoNum(stoNum);
cDto.setCategory(category);

MenuDao dao=MenuDao.getInstance();
List<MenuDto> menuList=dao.getList(cDto);

// json 형식 예시들
// ["김구라","해골","원숭이","주뎅이","덩어리"]
// {"num":1, "name":"김구라", "addr":"노량진"}
// {"isSuccess": }
%>
{"menuList":<%= menuList%>}