package mypage.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import static common.JDBCTemplate.*;

import mypage.model.vo.MCart;
import mypage.model.vo.MyOrder;

public class MypageDao {
	
	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet reset =null;
		
		String query = "SELECT COUNT(*) FROM MCART";
		int listCount = 0;
		
		try {
			stmt= conn.createStatement();
			
			reset =stmt.executeQuery(query);
			
			if(reset.next()) {
				listCount = reset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(reset);
		}
		
		return listCount;
	}

	public ArrayList<MCart> selectList(Connection conn, int currentPage, int limit, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<MCart> list = new ArrayList<MCart>();
		
		String query = "SELECT * FROM MCART_VIEW WHERE ROWNUM BETWEEN ? AND ? AND MID =? ";
		int startRow = (currentPage-1)*limit+1;
		int endRow = startRow + (limit -1);
		try {
			pstmt =conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, userId);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
			
				MCart mcart = new MCart(rset.getInt("cid"),
						rset.getString("mid"),
						rset.getString("ptitle"),
						rset.getInt("camount"),
						rset.getInt("pprice"));
				list.add(mcart);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		
	
		
		return list;
	}
	
	
	public int getOrderListCount(Connection conn) {
		Statement stmt = null;
		ResultSet reset =null;
		
		String query = "SELECT COUNT(*) FROM MORDERLIST";
		int listCount = 0;
		
		try {
			stmt= conn.createStatement();
			
			reset =stmt.executeQuery(query);
			
			if(reset.next()) {
				listCount = reset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(reset);
		}
		
		return listCount;
	}

	public ArrayList<MyOrder> selectOrderList(Connection conn, int currentPage, int limit, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<MyOrder> list = new ArrayList<MyOrder>();
		
		String query = "SELECT * FROM MORDERLIST_VIEW WHERE ROWNUM BETWEEN ? AND ? AND MID =? ";
		int startRow = (currentPage-1)*limit+1;
		int endRow = startRow + (limit -1);
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, userId);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				MyOrder mo = new MyOrder(
															rset.getString("ptitle"),
															rset.getDate("odate"),
															rset.getString("shipcom"),
															rset.getInt("shipno"),
															rset.getString("mid")
															);
				list.add(mo);
			}
			System.out.println(list);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		
		return list;
	}

	public int getRefundListCount(Connection conn) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		ResultSet reset =null;
		
		String query = "SELECT COUNT(*) FROM ";
		int listCount = 0;
		
		try {
			stmt= conn.createStatement();
			
			reset =stmt.executeQuery(query);
			
			if(reset.next()) {
				listCount = reset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(reset);
		}
		
		return listCount;
	}

	public ArrayList<MyOrder> selectRefundList(Connection conn, int currentPage, int limit, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<MyOrder> list = new ArrayList<MyOrder>();
		
		String query = "SELECT * FROM REFUNDLIST_VIEW WHERE ROWNUM BETWEEN ? AND ? AND MID =? ";
		int startRow = (currentPage-1)*limit+1;
		int endRow = startRow + (limit -1);
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, userId);
			
			rset= pstmt.executeQuery();
			while(rset.next()) {
				MyOrder mo = new MyOrder(rset.getString("ptitle"),
															rset.getDate("odate"),
															rset.getDate("refdate"),
															rset.getString("o_name")
						);
				
				list.add(mo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}
	





}