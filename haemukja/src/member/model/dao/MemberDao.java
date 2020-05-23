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
                  rs.getInt("MSCORE"),
                  rs.getString("MCODE"));
         }
      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         close(rs);
         close(pstmt);
      }

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
			e.printStackTrace();
		}
		
		return result;
	}

	public String selectPwd(Connection conn, String id, String name, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String pwd = null;
		
		String query = "SELECT * FROM MEMBER WHERE MID=? AND MNAME=? AND MEMAIL=?";
		
		try {
			pstmt= conn.prepareStatement(query);
			
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				pwd = rset.getString("mpw");
			}
		} catch (SQLException e) {
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
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return productNo;
	}
	
	public int insertMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,0,?,SYSDATE,'N',SYSDATE,5,?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMid());
			pstmt.setString(2, member.getMpw());
			pstmt.setString(3, member.getMname());
			pstmt.setString(4, member.getMtel());
			pstmt.setString(5, member.getAddr());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getMno());
			pstmt.setString(8, member.getMnickname());
			pstmt.setString(9, member.getMcode());
			
			result = pstmt.executeUpdate();
			System.out.println("회원가입 결과 확인 : " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		return result;
	}
	
	public int insertMember(Connection conn, Seller seller) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO SELLER VALUES(?,?,?,?,?,?,'N',?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, seller.getSid());
			pstmt.setString(2, seller.getSpw());
			pstmt.setString(3, seller.getCompany());
			pstmt.setString(4, seller.getStel());
			pstmt.setString(5, seller.getCaddr());
			pstmt.setString(6, seller.getCno());
			pstmt.setString(7, seller.getScode());
			
			result = pstmt.executeUpdate();
			System.out.println("회원가입 결과 확인 : " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		
		return result;
	}
	
	public int updateMember(Connection conn, String mpw, String mtel, String email, String mnickname, String mid) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE MEMBER SET MPW = ?, MTEL = ?, MEMAIL = ?, MNICKNAME =? WHERE MID =?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mpw);
			pstmt.setString(2, mtel);
			pstmt.setString(3, email);
			pstmt.setString(4, mnickname);
			pstmt.setString(5, mid);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		   return result;
	}
	
	    public int deleteMember(Connection conn, String mid) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "DELETE FROM MEMBER WHERE MID =?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mid);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}


