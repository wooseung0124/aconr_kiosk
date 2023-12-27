package kiosk.order.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kiosk.menu.dao.MenuDao;
import kiosk.menu.dto.MenuDto;

@WebServlet("/customer/MenuDetail")
public class MenuDetail extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String name=req.getParameter("name");
		//test 메뉴임
		MenuDto dto=MenuDao.getInstance().detaillist(name);
		
		req.setAttribute("menudto", dto);
		RequestDispatcher rd=req.getRequestDispatcher("/customer/detailTest.jsp");
		rd.forward(req, resp);
	}
}
