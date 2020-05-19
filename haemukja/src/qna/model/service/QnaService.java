package qna.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import qna.model.dao.QnaDao;
import qna.model.vo.Qna;
public class QnaService {

	public int getListCount() {
		Connection conn = getConnection();
		int listCount = new QnaDao().getListCount(conn);
		close(conn);
		return listCount;
	}

	public ArrayList<Qna> selectList(int currentPage, int displayRow) {
		Connection conn = getConnection();
		ArrayList<Qna> list = new QnaDao().selectList(conn, currentPage, displayRow);
		close(conn);
		return list;
	}

	public Qna selectQna(int qid) {
		Connection conn = getConnection();
		Qna qna = new QnaDao().selectQna(conn, qid);
		close(conn);
		return qna;
	}

	public int deleteQna(int qid) {
		Connection conn = getConnection();
		int result = new QnaDao().deleteQna(conn, qid);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int insertQna(Qna qna) {
		Connection conn = getConnection();
		int result = new QnaDao().insertQna(conn, qna);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int updateQna(int qid, String title, String content) {
		Connection conn = getConnection();
		int result = new QnaDao().updateQna(conn, qid, title, content);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public ArrayList<Qna> searchNickname(String searchContent) {
		Connection conn = getConnection();
		ArrayList<Qna> list = new QnaDao().searchNickname(conn, searchContent);
		close(conn);
		return list;
	}

	public ArrayList<Qna> searchTitle(String searchContent) {
		Connection conn = getConnection();
		ArrayList<Qna> list = new QnaDao().searchTitle(conn, searchContent);
		close(conn);
		return list;
	}

	public ArrayList<Qna> searchContent(String searchContent) {
		Connection conn = getConnection();
		ArrayList<Qna> list = new QnaDao().searchContent(conn, searchContent);
		close(conn);
		return list;
	}


}