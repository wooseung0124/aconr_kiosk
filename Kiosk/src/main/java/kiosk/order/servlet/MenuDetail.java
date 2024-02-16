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
import kiosk.menu.dto.UpdateMenuDto;

@WebServlet("/customer/MenuDetail")
public class MenuDetail extends HttpServlet{
	// get파라미터로 name을 통해 상세메뉴 가져오
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String stoNum=(String)req.getSession().getAttribute("stoNum");
		String name=req.getParameter("name");
		
		UpdateMenuDto udto= new UpdateMenuDto();
		udto.setName(name);
		udto.setStoNum(stoNum);
		//test 메뉴임
		MenuDto dto=MenuDao.getInstance().getdata(udto);
		
		req.setAttribute("menudto", dto);
		RequestDispatcher rd=req.getRequestDispatcher("/customer/menu.jsp");
		rd.forward(req, resp);
	}
}
