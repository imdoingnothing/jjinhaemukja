package mypage.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import mypage.model.dao.MypageDao;
import mypage.model.vo.MCart;
import mypage.model.vo.MyOrder;

import static common.JDBCTemplate.*;

public class MypageService {
	
	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new MypageDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	


	public ArrayList<MCart> selectList(int currentPage, int limit,String userId) {
		Connection conn = getConnection();
		
		ArrayList<MCart> list = new MypageDao().selectList(conn,currentPage,limit,userId);
		
		
		close(conn);
		
		return list;
	}


	public int getOrderListCount() {
	Connection conn = getConnection();
		
		int listCount = new MypageDao().getOrderListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}
	
	
	public ArrayList<MyOrder> selectOrderList(int currentPage, int limit, String userId) {
		Connection conn = getConnection();
		
		ArrayList<MyOrder> list = new MypageDao().selectOrderList(conn,currentPage,limit,userId);
		
		
		close(conn);
		
		return list;
	}



	public int getRefundListCount() {
		Connection conn = getConnection();
		
		int listCount = new MypageDao().getRefundListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}



	public ArrayList<MyOrder> selectRefundList(int currentPage, int limit, String userId) {
		Connection conn = getConnection();
		
		ArrayList<MyOrder> list = new MypageDao().selectRefundList(conn,currentPage,limit,userId);
		
		
		close(conn);
		
		return list;
	
	}






}
