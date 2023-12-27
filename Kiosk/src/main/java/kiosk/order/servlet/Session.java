package kiosk.order.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kiosk.order.dto.OrderDto;

@WebServlet("/customer/session")
public class Session extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	req.setCharacterEncoding("utf-8");
	
	if(req.getParameter("menu")!=null) {
	String menu=req.getParameter("menu");
	String imageurl=req.getParameter("iageurl");
	String description= req.getParameter("description");
	int price = Integer.parseInt(req.getParameter("price"));
	
	//테스트 데이터 
	 int count = 1;

	 int tableNum = 22;
     
	
	 
	 List<OrderDto> shoplist = (List<OrderDto>) req.getSession().getAttribute("shoplist");
		
     // 만약 "shoplist" 속성이 없다면 새로운 리스트를 생성합니다.
     if(shoplist == null){
         shoplist = new ArrayList<OrderDto>();
         req.getSession().setAttribute("shoplist", shoplist);
     } else {
         // 세션에 동일한 이름이 있으면 
         for (OrderDto order : shoplist) {
             if (order.getMenu().equals(menu)) {
                 // 이미 존재하는경우 카운트만 1 증가시킨다.
                 order.setCount(order.getCount() + 1);
          
    			RequestDispatcher rd=req.getRequestDispatcher("/customer/shoppingtest.jsp");
    			rd.forward(req, resp);
    			return;
             }
         }
 
         
     }
             OrderDto dto = new OrderDto();
         dto.setMenu(menu);
         dto.setCount(count);
         dto.setPrice(price);
         dto.setTableNum(tableNum);

         shoplist.add(dto);
         
         req.setAttribute("shoplist", shoplist);
         RequestDispatcher rd=req.getRequestDispatcher("/customer/shoppingtest.jsp");
         rd.forward(req, resp);
    
     //여기있떤코드
   
		}
	}
}
