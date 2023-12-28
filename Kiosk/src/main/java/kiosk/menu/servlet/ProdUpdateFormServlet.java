package kiosk.menu.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kiosk.menu.dao.MenuDao;
import kiosk.menu.dto.UpdateMenuDto;
import kiosk.menu.dto.MenuDto;

@WebServlet("/menu/product/prod_updateform")
public class ProdUpdateFormServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//아이디는 로그인이 구현이 됬을 때 session scope에서 가져오겠다.
		String name=req.getParameter("name");
		String stoNum=(String)req.getSession().getAttribute("stoNum");
		UpdateMenuDto udto= new UpdateMenuDto();
		udto.setName(name);
		udto.setStoNum(stoNum);
		MenuDto dto=MenuDao.getInstance().getdata(udto);
		
		System.out.println("이름: "+dto.getName()+"가격: "+dto.getPrice()+"설명: "+dto.getDescription());
		
		req.setAttribute("dto", dto);
		RequestDispatcher rd=req.getRequestDispatcher("/menu/product/prod_updateform.jsp");
		rd.forward(req, resp);
	}
}
