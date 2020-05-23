package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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
//	  String ch = request.getParameter("rememberId");
//	  Cookie idCookie = null;
//	  Cookie typeCookie = null;
	  HttpSession session = null;

	  
	  if(userType.equals("member")) {
		  Member member = new Member(id, pw);
		  Member loginMember = new MemberService().loginMember(member);         
	 
			 if(loginMember != null) {	//일반회원일때
//				 if(ch != null) {
//					 idCookie = new Cookie("ch", id);
//					 idCookie.setMaxAge(60*60*24*7);
//					 typeCookie = new Cookie("type", userType);
//					 typeCookie.setMaxAge(60*60*24*7);
//					 response.addCookie(idCookie);
//					 response.addCookie(typeCookie);
//				 } else {
//					 idCookie = new Cookie("ch", id);
//					 idCookie.setMaxAge(0);
//					 typeCookie = new Cookie("type", userType);
//					 typeCookie.setMaxAge(0);
//					 response.addCookie(idCookie);
//					 response.addCookie(typeCookie);
//				 }
				 session = request.getSession();
				 session.setAttribute("loginMember", loginMember);
			    
				 response.sendRedirect("index.jsp");
			 } else {
			    //404
			 }
	  } else {	//판매회원일때
	     Seller seller = new Seller(id, pw);
	     Seller loginSeller = new MemberService().loginSeller(seller);
	     
		     if(loginSeller != null) {
//		    	 if(ch != null) {
//					 idCookie = new Cookie("ch", id);
//					 idCookie.setMaxAge(60*60*24*7);
//					 typeCookie = new Cookie("type", userType);
//					 typeCookie.setMaxAge(60*60*24*7);
//					 response.addCookie(idCookie);
//					 response.addCookie(typeCookie);
//				 } else {
//					 idCookie = new Cookie("ch", id);
//					 idCookie.setMaxAge(0);
//					 typeCookie = new Cookie("type", userType);
//					 typeCookie.setMaxAge(0);
//					 response.addCookie(idCookie);
//					 response.addCookie(typeCookie);
//				 }
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
