package recipe.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.Attachment;
import recipe.model.vo.Recipe;

public class RecipeDao {

	public int insertRecipe(Connection conn, Recipe r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO RECIPE VALUES(SEQ_R.NEXTVAL,?,SYSDATE,?,DEFAULT,DEFAULT,DEFAULT,?,?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getbTitle());
			pstmt.setString(2, r.getbContent());
			pstmt.setString(3, r.getmId());
			pstmt.setString(4, r.getnCode());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertAttachment(Connection conn, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO ATTACHMENT VALUES(SEQ_A.NEXTVAL,SEQ_R.CURRVAL,NULL,?,?,SYSDATE,?,'N', ?)";
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				Attachment at = fileList.get(i);
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, at.getFileName());
				pstmt.setString(2, at.getFilePath());
				pstmt.setInt(3, at.getLevel());
				pstmt.setString(4, at.getTag());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Recipe selectRecipe(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Recipe r = null;
		
		String query = "SELECT * FROM RECIPE WHERE BNO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				r = new Recipe(rset.getInt("BNO"),
						rset.getString("BTITLE"),
						rset.getDate("BDATE"),
						rset.getString("BCONTENT"),
						rset.getInt("BUP"),
						rset.getInt("BDOWN"),
						rset.getInt("BVIEWS"),
						rset.getString("MID"),
						rset.getString("NCODE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return r;
	}

	public int updateViews(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE RECIPE SET BVIEWS = BVIEWS+1 WHERE BNO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Attachment> selectFiles(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Attachment at = null;
		ArrayList<Attachment> files = new ArrayList<>();
		
		String query = "SELECT * FROM ATTACHMENT WHERE BNO=? AND FILELEVEL=1";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				at = new Attachment(rset.getInt("AID"),
						rset.getInt("BNO"),
						rset.getInt("SBNO"),
						rset.getString("FILENAME"),
						rset.getString("FILEPATH"),
						rset.getDate("UPLOADDATE"),
						rset.getInt("FILELEVEL"),
						rset.getString("STATUS"),
						rset.getString("TAG"));
				
				files.add(at);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return files;
	}

	public Attachment selectThumbnail(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Attachment thumbnail = null;
		
		String query = "SELECT * FROM ATTACHMENT WHERE BNO=? AND FILELEVEL=0";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				thumbnail = new Attachment(rset.getInt("AID"),
						rset.getInt("BNO"),
						rset.getInt("SBNO"),
						rset.getString("FILENAME"),
						rset.getString("FILEPATH"),
						rset.getDate("UPLOADDATE"),
						rset.getInt("FILELEVEL"),
						rset.getString("STATUS"),
						rset.getString("TAG"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return thumbnail;
	}

	public ArrayList selectRList(Connection conn, int currentPage, int limit, String nCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Recipe> list = new ArrayList<>();
		
//		String query = "SELECT * FROM RLIST WHERE RNUM BETWEEN ? AND ? AND NCODE = ?";
		String query = "SELECT * "
				+ "FROM (SELECT ROWNUM AS RNUM1, BNO, BTITLE, BDATE, BCONTENT, BUP, BDOWN, BVIEWS, MID, NCODE FROM RLIST WHERE NCODE=?)"
				+ "WHERE RNUM1 BETWEEN ? AND ?";
		
		int endRow = 9 * currentPage;
		int startRow = endRow - 8;
	
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nCode);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				Recipe r = new Recipe(rset.getInt("BNO"),
						rset.getString("BTITLE"),
						rset.getDate("BDATE"),
						rset.getString("BCONTENT"),
						rset.getInt("BUP"),
						rset.getInt("BDOWN"),
						rset.getInt("BVIEWS"),
						rset.getString("MID"),
						rset.getString("NCODE"));
				
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public int selectBNo(Connection conn, Recipe r) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int bNo = 0;
		
		String query = "SELECT * FROM RECIPE WHERE BTITLE=? AND BCONTENT=? AND MID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getbTitle());
			pstmt.setString(2, r.getbContent());
			pstmt.setString(3, r.getmId());
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				bNo = rset.getInt("BNO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return bNo;
	}
	
	public String selectMNickname(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String nickname = null;
		
		String query = "SELECT MNICKNAME FROM MEMBER M JOIN RECIPE R ON (M.MID=R.MID) WHERE BNO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				nickname = rset.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return nickname;
	}

	public int plusUp(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE RECIPE SET BUP = BUP+1 WHERE BNO = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int plusDown(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE RECIPE SET BDOWN = BDOWN+1 WHERE BNO = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getListCount(Connection conn, String nCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = "SELECT COUNT(*) FROM RECIPE WHERE NCODE=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nCode);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}

	public int deleteRecipe(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "DELETE FROM RECIPE WHERE BNO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteAttachment(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "DELETE FROM ATTACHMENT WHERE BNO=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	

}
