<%@page import="kiosk.order.dao.OrderDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.tomcat.util.json.JSONParser"%>
<%@page import="org.apache.catalina.valves.JsonAccessLogValve"%>
<%@page import="kiosk.menu.dto.UpdateMenuDto"%>
<%@page import="kiosk.order.dto.OrderDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>

<%
// OrderDto 배치순
String stoNum = (String) session.getAttribute("stoNum");
int tableNum = 1; // 테이블 좌석(테스트코드)
String name = request.getParameter("name");
int price = Integer.parseInt(request.getParameter("price")) ;
int count=1; // 수량

List<OrderDto> shoplist = (List<OrderDto>)session.getAttribute("shoplist");
System.out.println("data.jsp-json => name: " + name + ", price: " + price + ", shoplist: "+shoplist);
OrderDao dao = OrderDao.getInstance(); // 혹시 모르니

if(shoplist == null){
	System.out.println("data.jsp-json => shoplist = null");
    shoplist = new ArrayList<OrderDto>();
    
 	// 첫 장바구니 작동시작(OrderDto 배치순)
    OrderDto dto = new OrderDto();
   	dto.setStoNum(stoNum);
   	dto.setTableNum(tableNum);
    dto.setMenu(name);
    dto.setPrice(price);
    dto.setCount(count);
    shoplist.add(dto);

    session.setAttribute("shoplist", shoplist);
}else{
	try {
		System.out.println("data.jsp-json => shoplist = "+shoplist);

	    for (OrderDto order : shoplist) {
	        if (order.getMenu().equals(name)) {
	            // 이미 존재하는 경우 카운트만 1 증가시킨다.
	            order.setCount(order.getCount() + 1);
	            session.setAttribute("shoplist", shoplist); // 수정 후에 세션에 다시 저장
	        }
	    } // for문

	    // 새로 추가한 거 담기(OrderDto 배치순)
		OrderDto dto = new OrderDto();
   		dto.setStoNum(stoNum);
   		dto.setTableNum(tableNum);
    	dto.setMenu(name);
    	dto.setPrice(price);
    	dto.setCount(count);
    	shoplist.add(dto);

	    session.setAttribute("shoplist", shoplist);

	} catch (Exception e) {
	    e.printStackTrace();
	}

	
} // else
%>
{"shoplist":"<%= shoplist %>"} 

<%-- =============================
git fetch + merge 이후 이전 코드들 

<%
    String name = request.getParameter("name");
	int price = Integer.parseInt(request.getParameter("price")) ;
	int count=1;

	List<OrderDto> shoplist = (List<OrderDto>) session.getAttribute("shoplist");
	
	if(shoplist == null){
        shoplist = new ArrayList<OrderDto>();
        session.setAttribute("shoplist", shoplist);
	}else{
		// 세션에 동일한 이름이 있으면 
        for (OrderDto order : shoplist) {
            if (order.getMenu().equals(name)) {
                // 이미 존재하는경우 카운트만 1 증가시킨다.
                order.setCount(order.getCount() + 1);
               
            }
            session.setAttribute("shoplist", shoplist);
        }   
		
		OrderDto dto = new OrderDto();
        dto.setMenu(name);
        dto.setCount(count);
        dto.setPrice(price);
  
        shoplist.add(dto);
        session.setAttribute("shoplist", shoplist);
	}
	
    System.out.println("name:" + name + "price:" + price);
    // name이 null이거나 값이 없는 경우에 대한 예외 처리
%> 

============================= --%>
 