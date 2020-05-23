package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemOrderServlet
 */
@WebServlet("/order.me")
public class MemOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberService mservice = new MemberService();
		
		int allPrice = Integer.valueOf(request.getParameter("allamprice"));
		String payment = request.getParameter("payment");
		
		String[] cid = request.getParameterValues("cid");
		
		
		ArrayList<String> cidList = new ArrayList<String>();
		for(int i =0 ; i<cid.length;i++) {
			cidList.add(cid[i]);
		}
		
		
		int resultPoint = 0;
		try {
			String point = request.getParameter("resultPoint");
			resultPoint = Integer.parseInt(point);	
		} catch(NumberFormatException e) {
			e.getMessage();
		}
		
		
			
		
		String[] count = request.getParameterValues("count");
		
		ArrayList<String> countList = new ArrayList<String>();
		for(int i=0 ; i<count.length ; i++) {
			countList.add(count[i]);
		}
		
		
		String[] ptitle = request.getParameterValues("ptitle"); 
		ArrayList<Integer> pidList = new ArrayList<Integer>();
		for(int i =0; i<ptitle.length ; i++) {
			pidList.add(mservice.selectPid(ptitle[i]));
		}
	
		
		ArrayList<String> ptitleList = new ArrayList<String>();
		for(int i =0 ; i<ptitle.length ; i++) {
			ptitleList.add(ptitle[i]);
		}
	
		
		HttpSession session = request.getSession();
		Member member = (Member)(session.getAttribute("loginMember"));
		String userId = member.getMid();
		
		
		// 주문번호 생성,총가격 입력
		int result = mservice.oIdInsert(allPrice);
		if(result>0) {// 주문번호가 생성 성공시실행
			int oid = mservice.selectOid(); // 주문번호를 갖고온다
			int result1=0;
			for(int i =0; i<ptitle.length;i++) {
				result1 = mservice.memOrder(oid,payment,countList.get(i),userId,pidList.get(i)); // 주문내용 입력
			}// 갖고온 주문번호를 포함해서 주문내용(결제) 입력
			
			
			
			RequestDispatcher view = null;
			if(result1>0 ) {// 주문내용(결제) 입력 성공시 실행
				
				int result3=0;
				for(int i =0;i<cid.length;i++) {
					result3 = mservice.deleteCart(cidList.get(i));
				}
				
				
				int result2=mservice.updatePoint(resultPoint,userId);// 포인트 업데이트
				
				if(result2>0) {
				view = request.getRequestDispatcher("member/orderResult.jsp");
				request.setAttribute("msg", "결제 완료되었습니다.");
				}
				
				
			}
			view.forward(request, response);
			
		}
		
		
		
		
		
		
		
		
		
		
	
		
		
		                                                                                                                    
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
