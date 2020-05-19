package member.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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

}
