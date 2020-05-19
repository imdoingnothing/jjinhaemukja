package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;


/**
 * Servlet implementation class nonMemberServlet
 */
@WebServlet("/nonmember.me")
public class nonMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public nonMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("orderer");
		
		String phone1= request.getParameter("phone1");
		String phone2= request.getParameter("phone2");
		String phone3= request.getParameter("phone3");
		String phone = phone1 + "-"+ phone2 + "-" + phone3;
		
		String address1 = request.getParameter("receiverAddress1");
		String address2 =request.getParameter("receiverAddress2");
		String address = address1 + address2;
		
		String payment = request.getParameter("payment");
		
		int result= new MemberService().nMemOrder(name,phone,address,payment);
		
		RequestDispatcher view = null;
		
		if(result>0) {
			view = request.getRequestDispatcher("index.jsp");
		}else {
			
		}
		view.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
