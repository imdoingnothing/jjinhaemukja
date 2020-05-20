package member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;
import sun.rmi.server.Dispatcher;

/**
 * Servlet implementation class MemberSellServlet
 */
@WebServlet("/member.me")
public class MemberSellServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSellServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			 request.setCharacterEncoding("utf-8");
			 
			 
			 String [] ptitle = request.getParameterValues("product");
			
			 String[] camount=request.getParameterValues("pcount"); // 수량
			 String[] price = request.getParameterValues("price");
			
			 
			 ArrayList<String> ptitleAr= new ArrayList<String>();
			 for(int i =0 ; i<ptitle.length;i++) {
				ptitleAr.add(ptitle[i]);
			 }
			 
			 ArrayList<String> camountAr= new ArrayList<String>();
			 for(int i =0 ; i<ptitle.length;i++) {
				camountAr.add(camount[i]);
			 }
	
			 
			 
			
		
			
			 
			
			 
			 // camount[] 형변환
			int [] camount2 = new int[camount.length];
			
			for(int i = 0;i<camount.length;i++){
			
			camount2[i] = Integer.parseInt(camount [i]);	
			}
			
			int [] price2 = new int[price.length];
			
			for(int i = 0;i<price.length;i++){
			
			price2[i] = Integer.parseInt(price [i]);	
			}
		
			
			int[] amprice = new int[price.length]; //총가격
			 for(int i = 0;i<price.length;i++) {
				amprice[i] = camount2[i]*price2[i];
			 }
			
			 
			 ArrayList<Integer> ampriceAr= new ArrayList<Integer>();
			 for(int i =0 ; i<ptitle.length;i++) {
				 ampriceAr.add(amprice[i]);
			 }
			 
			 int allamprice = 0; // 총결제가격
			 for(int i = 0; i<ptitle.length; i++) {
				 	allamprice += ampriceAr.get(i);
			 }
		
		
			 
			 RequestDispatcher view = null;
			 request.setAttribute("ptitle", ptitleAr);
			 request.setAttribute("camount", camountAr);
			 request.setAttribute("amprice",ampriceAr);
			 request.setAttribute("allamprice",allamprice);
			 view= request.getRequestDispatcher("member/member.jsp");
			 view.forward(request, response);
			 
			 
			
//			 String ptitle = request.getParameter("product");
//			 int camount = Integer.valueOf(request.getParameter("pcount")); //수량
//			 System.out.println("수량:" + camount);
//			 int price = new MemberService().selectPrice(ptitle); //가격
//			 System.out.println("하나가격:"+ price);
//			 String amprice = String.valueOf(camount * price);  // 총가격
//			 System.out.println("총가격" + amprice);
//			 RequestDispatcher view = null;
//			 
//			 request.setAttribute("ptitle", ptitle);
//			 request.setAttribute("camount", camount);
//			 request.setAttribute("amprice", amprice);
//			 view= request.getRequestDispatcher("member/member.jsp");
//			 view.forward(request, response);
			 
//			int usepoint = Integer.valueOf(request.getParameter("point"));
//			int price = Integer.valueOf(request.getParameter("price"));
//			int count = Integer.valueOf( request.getParameter("count"));
			
//			
//			String email1 = request.getParameter("email1");
//			String email2 = request.getParameter("email2");
//			
//			
//			String name= request.getParameter("orderer");
//			String email = email1 +"@" + email2;
//			String payment = request.getParameter("payment");
//			int amountPrice = price*count - usepoint; 
//			String product = request.getParameter("product");
//			
//			String userId= new MemberService().findId(name, email);
//			int result = new MemberService().memOrderList(payment,count,userId,product,amountPrice);
//			
//			RequestDispatcher view = null;
//			if(result>0) {
//				
//				view = request.getRequestDispatcher("index.jsp");
//			}else {
//				
//			}
//			view.forward(request, response);
			
//			request.setAttribute("amountPrice", amountPrice);
//			request.setAttribute("usepoint", usepoint );
//			request.getRequestDispatcher("member/member.jsp").forward(request, response);
			
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
