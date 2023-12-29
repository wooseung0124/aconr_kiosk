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
@WebServlet("/owner/signup")
public class SignupServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String sto_Num=req.getParameter("sto_Num");
		String sto_Name=req.getParameter("sto_Name");
		String email =req.getParameter("email");
		String pwd =req.getParameter("pwd");
		String o_name=req.getParameter("o_Name");
		OwnerDto dto=new OwnerDto(sto_Num, sto_Name, o_name, email, pwd);
		boolean isSuccess = OwnerDao.getInstance().insert(dto);
		req.setAttribute("isSuccess", isSuccess);
		req.setAttribute("o_Name", o_name);
		RequestDispatcher rd=req.getRequestDispatcher("/signup.jsp");
		rd.forward(req, resp);

	}
}
