package recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Attachment;
import qna.model.service.QnaService;
import qna.model.vo.Notice;
import recipe.model.service.RecipeService;
import recipe.model.vo.Recipe;

/**
 * Servlet implementation class RecipeDetailServlet
 */
@WebServlet("/detail.re")
public class RecipeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bNo = (int) request.getAttribute("bNo");
		
		RecipeService rs = new RecipeService();
		QnaService qs = new QnaService();
		
		String nickname = rs.selectMNickname(bNo);
		Recipe recipe = rs.selectRecipe(bNo);
		ArrayList<Attachment> files = rs.selectFiles(bNo);
	
		RequestDispatcher view = null;
		if(recipe != null) {
			view = request.getRequestDispatcher("recipe/recipeBoardDetail.jsp");
			request.setAttribute("recipe", recipe);
			request.setAttribute("files", files);
			request.setAttribute("nickname", nickname);
		} else {
			//404
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
