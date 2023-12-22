package kiosk.signup.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kiosk.owner.dao.OwnerDao;
import kiosk.owner.dto.OwnerDto;
@WebServlet("/signup")
public class SignupServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String email =req.getParameter("email");
		String pwd =req.getParameter("pwd");
		String o_name=req.getParameter("o_name");
		OwnerDto dto=new OwnerDto();
		boolean isSuccess = OwnerDao.getInstance().insert(dto);
		req.setAttribute("isSucess", isSuccess);
		RequestDispatcher rd=req.getRequestDispatcher("owner/signup.jsp");
		rd.forward(req, resp);
	}
}
