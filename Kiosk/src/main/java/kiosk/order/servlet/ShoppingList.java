package kiosk.order.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kiosk.order.dto.OrderDto;

@WebServlet("/customer/ShoppingList")
public class ShoppingList extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		List<OrderDto> shoplist=(List<OrderDto>) req.getSession().getAttribute("shoplist");
		
		if(shoplist==null) {	
			
			  RequestDispatcher rd=req.getRequestDispatcher("/customer/menu");
		      rd.forward(req, resp);
		      return;
		}
		
		  req.setAttribute("shoplist", shoplist);
		 
		  RequestDispatcher rd = req.getRequestDispatcher("/customer/shoppingtest.jsp");
	      rd.forward(req, resp);

	}
}
  