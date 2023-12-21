<%@page import="kiosk.menu.dto.MenuDto"%>
<%@page import="kiosk.order.dto.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");

    if(request.getParameter("name") != null){
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        int price = Integer.parseInt(request.getParameter("price"));

        // 테스트 데이터
        int count = 1;
        int tableNum = 22;

        // 세션에서 "shoplist" 속성을 가져옵니다.
        List<OrderDto> shoplist = (List<OrderDto>) session.getAttribute("shoplist");

        // 만약 "shoplist" 속성이 없다면 새로운 리스트를 생성합니다.
        if(shoplist == null){
            shoplist = new ArrayList<OrderDto>();
            session.setAttribute("shoplist", shoplist);
        } else {
            // 이미 동일한 name이 있는지 검사
            for (OrderDto order : shoplist) {
                if (order.getMenu().equals(name)) {
                    // 이미 있는 경우 세션에 추가하지 않고 종료
                    order.setCount(order.getCount() + 1);
                    String url = request.getContextPath();
                    response.sendRedirect(url + "/customer/shoppingtest.jsp");
                    return;
                }
            }
        }

        // "shoplist" 속성에 새로운 주문을 추가합니다.
        OrderDto dto = new OrderDto();
        dto.setMenu(name);
        dto.setCount(count);
        dto.setPrice(price);
        dto.setTableNum(tableNum);

        shoplist.add(dto);

        String url = request.getContextPath();
        response.sendRedirect(url + "/customer/shoppingtest.jsp");
    }
%>
