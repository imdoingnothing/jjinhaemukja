package recipe.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import common.Attachment;
import recipe.model.dao.RecipeDao;
import recipe.model.vo.Recipe;

public class RecipeService {

	public int insertRecipe(Recipe r, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		RecipeDao rd = new RecipeDao();
		
		int result1 = rd.insertRecipe(conn,r);
		int result2 = rd.insertAttachment(conn,fileList);
		
		close(conn);
		
		return result1;
	}

	public Recipe selectRecipe(int bNo) {
		Connection conn = getConnection();
		
		RecipeDao rd = new RecipeDao();
		
		int result = rd.updateViews(conn, bNo);
		
		Recipe r = null;
		if(result > 0) {
			commit(conn);
			r = rd.selectRecipe(conn, bNo);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return r;
	}

	public ArrayList<Attachment> selectFiles(int bNo) {
		Connection conn = getConnection();
		
		ArrayList<Attachment> files = new RecipeDao().selectFiles(conn, bNo);
		
		close(conn);
		
		return files;
	}

	public Attachment selectThumbnail(int bNo) {
		Connection conn = getConnection();
		
		Attachment thumbnail = new RecipeDao().selectThumbnail(conn, bNo);
		
		close(conn);
		
		return thumbnail;
	}

	public int selectBNo(Recipe r) {
		Connection conn = getConnection();
		
		int bNo = new RecipeDao().selectBNo(conn, r);
		
		close(conn);
		
		return bNo;
	}

	public int plusUp(int bNo) {
		Connection conn = getConnection();
		
		int result = new RecipeDao().plusUp(conn, bNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int plusDown(int bNo) {
		Connection conn = getConnection();
		
		int result = new RecipeDao().plusDown(conn, bNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public String selectMNickname(int bNo) {
		Connection conn = getConnection();
		
		String nickname = new RecipeDao().selectMNickname(conn, bNo);
		
		close(conn);
		
		return nickname;
	}

	public int getListCount(String nCode) {
		Connection conn = getConnection();
		
		int listCount = new RecipeDao().getListCount(conn, nCode);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Recipe> selectRList(int currentPage, int limit, String nCode) {
		Connection conn = getConnection();
		
		ArrayList<Recipe> rlist = new RecipeDao().selectRList(conn, currentPage, limit, nCode);
		
		close(conn);
		
		return rlist;
	}

	public int deleteRecipe(int bNo) {
		Connection conn = getConnection();
		RecipeDao rd = new RecipeDao();
		
		int result1 = 0;
		int result2 = 0;
		
		result1 = rd.deleteAttachment(conn, bNo);
		if(result1 > 0) {
			commit(conn);
			result2 = rd.deleteRecipe(conn, bNo);			
		} else {
			rollback(conn);
		}
		
		if(result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result2;
	}

}
