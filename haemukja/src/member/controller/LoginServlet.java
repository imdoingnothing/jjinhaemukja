package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;
import member.model.vo.Seller;


@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
	      String pw = request.getParameter("password");
	      String userType = request.getParameter("userType");

	      HttpSession session = null;
	      if(userType.equals("member")) {
	         Member member = new Member(id, pw);
	         Member loginMember = new MemberService().loginMember(member);         
	         
	         if(loginMember != null) {
	            session = request.getSession();
	            session.setAttribute("loginMember", loginMember);
	            response.sendRedirect("index.jsp");
	         } else {
	            //404
	         }
	      } else {
	         Seller seller = new Seller(id, pw);
	         Seller loginSeller = new MemberService().loginSeller(seller);
	         
	         if(loginSeller != null) {
	            session = request.getSession();
	            session.setAttribute("loginSeller", loginSeller);
	            response.sendRedirect("index.jsp");         
	         } else {
	            //404
	         }
	      }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
