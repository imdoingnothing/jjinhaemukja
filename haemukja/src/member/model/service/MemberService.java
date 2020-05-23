package member.model.service;

import java.sql.Connection;

import member.model.dao.MemberDao;
import member.model.vo.Member;
import member.model.vo.Seller;

import static common.JDBCTemplate.*;

public class MemberService {
	
	public Member loginMember(Member member) {
		Connection conn = getConnection();
		
	    Member loginMember = new MemberDao().loginMember(conn, member);

	    close(conn);
	    
	    return loginMember;
	}

	public Seller loginSeller(Seller seller) {
		Connection conn = getConnection();
	    
		Seller loginSeller = new MemberDao().loginSeller(conn, seller);
	    
		close(conn);
	    
		return loginSeller;
	}
	
	public String findId(String name, String email) {
		Connection conn = getConnection();
		
		String id = new MemberDao().findId(conn,name,email);
		
		close(conn);
		
		return id;
	}

	public String findPwd(String id, String name, String email) {
		Connection conn = getConnection();
		
		MemberDao mDao = new MemberDao();
		
		int result = mDao.findPwd(conn,id,name,email);
		
		String changePwd = mDao.selectPwd(conn,id,name,email);

		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return changePwd;
	}

	public int nMemOrder(String name, String phone, String address, String payment) {
		Connection conn = getConnection();
		
		MemberDao mdao = new MemberDao();
		
		int result1 = mdao.nonMember(conn,name,phone,address);
		
		if(result1>0) {
			int result2 = mdao.nMOrderList(conn,payment);
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1;
	}

	public int memOrderList(String payment, int count, String userId,String product , int amountPrice) {
		Connection conn = getConnection();
		
		int productNo = new MemberDao().selectProdeuctNo(conn,product);
		
		int result = new MemberDao().mOrderList(conn,payment,count,userId, productNo,amountPrice);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int insertMember(Member member) {
        Connection conn = getConnection();
        
        int result = new MemberDao().insertMember(conn, member);
        
        if(result > 0) {
        	commit(conn);
        }else {
        	rollback(conn);
        }
		
		return result;
	}
	
	public int insertMember(Seller seller) {
		 Connection conn = getConnection();
	        
	        int result = new MemberDao().insertMember(conn, seller);
	        
	        if(result > 0) {
	        	commit(conn);
	        }else {
	        	rollback(conn);
	        }
			
			return result;
	}
	
	public int updateMember(String mpw, String mtel, String email, String mnickname, String mid) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMember(conn, mpw, mtel, email, mnickname, mid);
		
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}

	public int deleteMember(String mid) {
		
		Connection conn =getConnection();
		
		int result = new MemberDao().deleteMember(conn, mid);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		  
		return result;
	}
