package kiosk.order.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kiosk.order.dao.OrderDao;
import kiosk.order.dto.OrderDto;

@WebServlet("/customer/orderlist")
public class OrderList extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		//test data
		int tablenum=1;
		
		List<OrderDto> list = OrderDao.getInstance().order(tablenum);
		if(list.size()==0) {
		
	         RequestDispatcher rd=req.getRequestDispatcher("/customer/menu");
	         rd.forward(req, resp);
	         return;
		}
	      	req.setAttribute("orderlist", list);
	         RequestDispatcher rd=req.getRequestDispatcher("/customer/orderlist.jsp");
	         rd.forward(req, resp);
	}
}
