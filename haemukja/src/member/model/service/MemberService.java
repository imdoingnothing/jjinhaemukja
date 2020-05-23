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
		System.out.println("Service���� id : " + id);
		
		close(conn);
		
		return id;
	}

	public String findPwd(String id, String name, String email) {
		Connection conn = getConnection();
		
		MemberDao mDao = new MemberDao();
		int result = mDao.findPwd(conn,id,name,email);
		String changePwd = mDao.selectPwd(conn,id);

		
	
		if(result>0) {
			commit(conn);
			
			System.out.println("service : " + changePwd);
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

	

	public int selectPid(String ptitle) {
		Connection conn = getConnection();
		int pid = new MemberDao().selectPid(conn,ptitle);
		close(conn);
		return pid;
	}

	public int oIdInsert(int allPrice) {
		Connection conn = getConnection();
		int result = new MemberDao().oIdInsert(conn, allPrice);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int selectOid() {
		Connection conn =getConnection();
		int oid = new MemberDao().selectOid(conn);
		close(conn);
		return oid;
	}

	public int memOrder(int oid, String payment, String count, String userId, Integer pid) {
		Connection conn = getConnection();
		int result = new MemberDao().memOrder(conn,oid,payment,count,userId,pid);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int updatePoint(int resultPoint, String userId) {
		Connection conn = getConnection();
		int result = new MemberDao().updatePoint(conn,resultPoint,userId);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteCart(String cid) {
		Connection conn = getConnection();
		int result= new MemberDao().deleteCart(conn,cid);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	




}
