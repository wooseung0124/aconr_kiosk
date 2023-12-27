package kiosk.menu.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kiosk.menu.dao.MenuDao;
import kiosk.menu.dto.MenuDto;


@WebServlet("/menu/menu")
public class MenuServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//카테고리도 가져와야함 
		List<String> categoryList = MenuDao.getInstance().getCategory();
		System.out.println(categoryList);
		List<MenuDto> menu_list=MenuDao.getInstance().getList();
		req.setAttribute("menu_list", menu_list);
		req.setAttribute("categoryList", categoryList);
		RequestDispatcher rd= req.getRequestDispatcher("/menu/menu.jsp");
		rd.forward(req, resp);
		
				
	}
}
