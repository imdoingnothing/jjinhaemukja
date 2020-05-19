package qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.service.QnaService;
import qna.model.vo.Qna;

/**
 * Servlet implementation class QnaDetailServlet
 */
@WebServlet("/detail.qn")
public class QnaDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qid = Integer.valueOf(request.getParameter("qid"));
//		System.out.println(qid);
		Qna qna = new QnaService().selectQna(qid);
		
		//댓글
		
		if(qna != null) {
			request.setAttribute("qna", qna);
			// 댓글
			request.getRequestDispatcher("qna/qnaboard_detail.jsp").forward(request, response);
		} else {
			//404
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
