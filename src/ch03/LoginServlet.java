package ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ch08.RegisterMgr;


@WebServlet("/ch03/loginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=EUC-KR");
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
/*		PrintWriter out = response.getWriter();
		out.println("<h1>" + id + "님 환영합니다.</h1>");
		out.println("<h3>id : "+ id + "</h3>");
		out.println("<h3>pwd : "+ pwd + "</h3>"); */
		RegisterMgr mgr = new RegisterMgr();
		boolean result = mgr.loginRegister(id, pwd);
		HttpSession session = request.getSession();
		if(result) { // 로그인 성공
			session.setAttribute("idKey", id);
		} else {
			session.setAttribute("msg", "ID와 pwd를 다시 입력하세요.");
		}
		response.sendRedirect("Login.jsp");
	}

}
