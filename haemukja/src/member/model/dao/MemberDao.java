package member.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.model.vo.Member;
import member.model.vo.Seller;

public class MemberDao {

   public Member loginMember(Connection conn, Member member) {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      Member loginMember = null;
      String sql = "SELECT * FROM MEMBER WHERE MID = ? AND MPW = ?";
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, member.getMid());
         pstmt.setString(2, member.getMpw());
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
            loginMember = new Member(rs.getString("MID"),
                  rs.getString("MPW"),
                  rs.getString("MNAME"),
                  rs.getString("MTEL"),
                  rs.getString("MADDR"),
                  rs.getString("MEMAIL"),
                  rs.getString("MNO"),
                  rs.getInt("MPOINT"),
                  rs.getString("MNICKNAME"),
                  rs.getDate("INFOUPDATE"),
                  rs.getString("MOUT"),
                  rs.getDate("DATE"),
                  rs.getInt("MSCORE"));
         }
      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         close(rs);
         close(pstmt);
      }
      System.out.println("[LoginService]"+loginMember);

      
      return loginMember;
   }
   
   public Seller loginSeller(Connection conn, Seller seller) {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      Seller loginSeller = null;
      String sql = "SELECT * FROM SELLER WHERE SID = ? AND SPW = ?";
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, seller.getSid());
         pstmt.setString(2, seller.getSpw());
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
            loginSeller = new Seller(rs.getString("SID"),
                  rs.getString("SPW"),
                  rs.getString("COMPANY"),
                  rs.getString("STEL"),
                  rs.getString("COMPANYADDR"),
                  rs.getString("COMPANYNO"),
                  rs.getString("SOUT"));
         }
      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         close(rs);
         close(pstmt);
      }
      
      return loginSeller;
   }
   
   public String findId(Connection conn, String name, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String id = null;
		
		String query = "SELECT * FROM MEMBER WHERE MNAME = ? AND MEMAIL = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				id = rset.getString("mid");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		System.out.println("Dao���� id : " + id);
		return id;
	}

	public int findPwd(Connection conn, String id, String name, String email) {
		PreparedStatement pstmt = null;
		int result = 0;
		String pwd = String.valueOf((int)(Math.random() * 10000 + 1));
	
		String query = "UPDATE MEMBER SET MPW=? WHERE MID = ? AND MNAME=? AND MEMAIL=?";
		try {
			pstmt= conn.prepareStatement(query);
			pstmt.setString(1, pwd);
			pstmt.setString(2, id);
		
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}

	public String selectPwd(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String pwd = null;
		
		String query = "SELECT * FROM MEMBER WHERE MID=?";
		
		try {
			pstmt= conn.prepareStatement(query);
			
			pstmt.setString(1, id);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				pwd = rset.getString("mpw");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return pwd;
	}

	public int nonMember(Connection conn ,String name, String phone, String address) {
		PreparedStatement pstmt = null;
		int result =0;
		
		
		String query = "INSERT INTO NONMEMBER VALUES(NMNO_SEQ.NEXTVAL, ?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			pstmt.setString(3, address);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public int nMOrderList(Connection conn, String payment) {
		PreparedStatement pstmt = null;
		int result =0;
		int shipno = (int)(Math.random() * 1000000 + 1);
		
		String query = "INSERT INTO NMORDERLIST VALUES(OID_SEQ.NEXTVAL, SYSDATE , ? , SYSDATE, 'Y','CJ�������',?,'N',5)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, payment);
			pstmt.setInt(2, shipno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}

	public int mOrderList(Connection conn, String payment, int count, String userId,int productNo, int amountPrice) {
		PreparedStatement pstmt = null;
		int result =0;
		int shipno = (int)(Math.random() * 1000000 + 1);
		
		String query= "INSERT INTO MORDERLIST VALUES(OID_SEQ.NEXTVAL, SYSDATE, ? , SYSDATE, 'Y', 'CJ�������', ?, 'N' ,? , ? , ?, ? ";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, payment);
			pstmt.setInt(2, shipno);
			pstmt.setInt(3, count);
			pstmt.setString(4, userId);
			pstmt.setInt(5, productNo);
			pstmt.setInt(6, amountPrice);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		
		}
		
		return result;
	}

	public int selectProdeuctNo(Connection conn, String product) {
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		int productNo = 0;
		
		String query = "SELECT PID FROM PRODUCT WHERE PTITLE=?";
		try {
			pstmt= conn.prepareStatement(query);
			pstmt.setString(1, product);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				productNo = rset.getInt("pid");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return productNo;
	}


	


	
	


	



}


