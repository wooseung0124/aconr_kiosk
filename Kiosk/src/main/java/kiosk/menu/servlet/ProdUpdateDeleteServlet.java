package kiosk.menu.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kiosk.menu.dao.MenuDao;
import kiosk.menu.dto.MenuDto;

@WebServlet("/menu/product/prod_update_delete")
public class ProdUpdateDeleteServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//HttpSession session =req.getSession();
		MenuDto dto = new MenuDto();
		String action = req.getParameter("action");
		
		//String stoNum=(String)session.getAttribute("stoNum");
		String name= req.getParameter("name");
		int price=Integer.parseInt(req.getParameter("price"));
		String description=req.getParameter("description");
		String imageUrl=req.getParameter("imageUrl");
		String category=req.getParameter("category");
		
		
		//dto.setStoNum(stoNum); 
		dto.setName(name);
		dto.setPrice(price);
		dto.setDescription(description);
		dto.setImageUrl(imageUrl);
		dto.setCategory(category);
		
		System.out.println(dto.getName());
		System.out.println(dto.getPrice());
		System.out.println(dto.getDescription());
		System.out.println(dto.getImageUrl());
		System.out.println(dto.getCategory());
		
		
		//jstl을 사용하기 위해서는 request영역에 담는다.
		req.setAttribute("dto", dto);
	
		
		

		
	
		if(action.equals("수정")) {
			boolean isSuccess=MenuDao.getInstance().update(dto);
			//jstl을 사용하기 위해서는 request영역에 담는다.
			req.setAttribute("isSuccess",isSuccess);
			req.setAttribute("action", action);
			System.out.println(isSuccess);
			
		}else if(action.equals("삭제")) {
			boolean isSuccess=MenuDao.getInstance().delete(name);
			
			req.setAttribute("isSuccess",isSuccess);
			req.setAttribute("action", action);
			System.out.println(isSuccess);
		}

		
		RequestDispatcher rd= req.getRequestDispatcher("/menu/product/prod_update_delete.jsp");
		rd.forward(req,resp);
	}
}
