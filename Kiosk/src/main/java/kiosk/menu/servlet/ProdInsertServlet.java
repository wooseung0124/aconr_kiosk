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


@WebServlet("/menu/product/prod_insert")
public class ProdInsertServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session =req.getSession();
		MenuDto dto = new MenuDto();
		//String stoNum=(String)session.getAttribute("stoNum");
		String name= req.getParameter("name");
		int price=Integer.parseInt(req.getParameter("price"));
		String description=req.getParameter("description");
		String imageUrl=req.getParameter("imageUrl");
		if(imageUrl.equals("null")){
			//DB의 profile 칼럼을 null로 유지하기 위해null을 넣어준다.
			imageUrl=null;
		}
		String category=req.getParameter("category");
		String stoNum = (String)req.getSession().getAttribute("stoNum");
		System.out.println(imageUrl);
		
		dto.setStoNum(stoNum); 
		dto.setName(name);
		dto.setPrice(price);
		dto.setDescription(description);
		dto.setImageUrl(imageUrl);
		dto.setCategory(category);
		
		boolean isSuccess=MenuDao.getInstance().insert(dto);
		//jstl을 사용하기 위해서는 request영역에 담는다.
		req.setAttribute("isSuccess",isSuccess);
		req.setAttribute("dto", dto);
		
		RequestDispatcher rd= req.getRequestDispatcher("/menu/product/prod_insert.jsp");
		rd.forward(req,resp);

	}
}
