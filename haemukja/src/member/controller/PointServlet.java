package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import member.model.service.MemberService;

/**
 * Servlet implementation class PointServlet
 */
@WebServlet("/point.me")
public class PointServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PointServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPoint = Integer.parseInt(request.getParameter("cureentPoint"));
		int usePoint =Integer.parseInt(request.getParameter("usePoint"));
		int allamPrice = Integer.parseInt(request.getParameter("allamprice"));
		String loginId = request.getParameter("loginId");
		
		
		
		
		
		int resultPoint=currentPoint - usePoint;
		int resultPrice = allamPrice-usePoint;
		
	
		JSONObject rlistObj = new JSONObject();
		
		rlistObj.put("resultPoint", resultPoint);
		rlistObj.put("resultPrice", resultPrice);
		
		response.setContentType("application/json; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.print(rlistObj);
		out.flush();
		out.close();
	
		
	
		
		
			
		
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
