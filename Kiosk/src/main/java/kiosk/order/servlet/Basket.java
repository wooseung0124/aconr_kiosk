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

import kiosk.menu.dao.MenuDao;
import kiosk.menu.dto.MenuDto;
import kiosk.menu.dto.UpdateMenuDto;
import kiosk.order.dto.OrderDto;

@WebServlet("/customer/basket")
public class Basket extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		List<MenuDto> list=new ArrayList<MenuDto>();
		if(req.getParameter("name")==null) {
			req.setAttribute("menudata", "x");
			RequestDispatcher rd=req.getRequestDispatcher("/customer/order_menu.jsp");
			rd.forward(req, resp);
			
		}else {
		String name=req.getParameter("name");
		String stoNum=(String)req.getSession().getAttribute("stoNum");
		UpdateMenuDto udto=new UpdateMenuDto(stoNum,name);
		
		MenuDto menuData=MenuDao.getInstance().getdata(udto);
		int price=menuData.getPrice();
		int count=1;
		List<OrderDto> shoplist = (List<OrderDto>) req.getSession().getAttribute("shoplist");
		if(shoplist == null){
	         shoplist = new ArrayList<OrderDto>();
	         req.getSession().setAttribute("shoplist", shoplist);
		}else {
	         // 세션에 동일한 이름이 있으면 
	         for (OrderDto order : shoplist) {
	             if (order.getMenu().equals(name)) {
	                 // 이미 존재하는경우 카운트만 1 증가시킨다.
	                 order.setCount(order.getCount() + 1);
	          
	    			RequestDispatcher rd=req.getRequestDispatcher("/customer/order_menu.jsp");
	    			rd.forward(req, resp);
	    			return;
	             }
	         }
	     }
	    OrderDto dto = new OrderDto();
        dto.setMenu(name);
        dto.setCount(count);
        dto.setPrice(price);
  
        shoplist.add(dto);
        
        req.setAttribute("shoplist", shoplist);
		RequestDispatcher rd=req.getRequestDispatcher("/customer/order_menu.jsp");
		rd.forward(req, resp);
		
		}
		
		
		
	}
}
