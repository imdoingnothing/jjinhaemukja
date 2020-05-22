package product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.Attachment;
import product.model.dao.ProductDao;
import product.model.vo.Product;
import product.model.vo.Sale;

import static common.JDBCTemplate.*;

public class ProductService {

	public int insertProudct(ArrayList<Product> plist) {
		Connection conn = getConnection();
		
		int result = new ProductDao().insertProduct(conn, plist);
		
		if(result > 0 && result == plist.size()) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Product selectProduct(int pId) {
		Connection conn = getConnection();
		
		Product p = new ProductDao().selectProduct(conn, pId);
		
		close(conn);
		
		return p;
	}

	public int insertSale(Sale s, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		ProductDao pd = new ProductDao();
		
		int result1 = pd.insertSale(conn, s);
		int result2 = pd.insertAttachment(conn, fileList);
		
		if(result1 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1;
	}

	public Sale selectSale(int sbNo) {
		Connection conn = getConnection();
		
		Sale s = new ProductDao().selectSale(conn, sbNo);
		
		close(conn);
		
		return s;
	}

	public int updateSale(Sale s, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		ProductDao pd = new ProductDao();
		
		int result1 = pd.updateSale(conn, s.getSbNo(), s);
		int result2 = pd.deleteAttachment(conn, s.getSbNo());
		int result3 = pd.insertAttachment2(conn, fileList, s.getSbNo());
		
		if(result1 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1;
	}

	public Sale selectSale2(int pId) {
		Connection conn = getConnection();
		
		Sale s = new ProductDao().selectSale2(conn, pId);
		
		close(conn);
		
		return s;
	}

	public int getAllCount() {
		Connection conn = getConnection();
		
		int result = new ProductDao().getAllCount(conn);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Sale> selectSList() {
		Connection conn = getConnection();
		
		ArrayList<Sale> slist = new ProductDao().selectSList(conn);
		
		close(conn);
		
		return slist;
	}

	public Attachment selectThumbnail(int sbNo) {
		Connection conn = getConnection();
		
		Attachment at = new ProductDao().selectThumbnail(conn, sbNo);
		
		close(conn);
		
		return at;
	}

	public ArrayList<Product> selectPlist(int currentPage, int limit, String sId) {
		Connection conn = getConnection();
		
		ArrayList<Product> plist = new ProductDao().selectPlist(conn, currentPage, limit, sId);
		
		close(conn);
		
		return plist;
	}

	public int updateProduct(int pId) {
		Connection conn = getConnection();
		ProductDao pd = new ProductDao();
		int result = 0;
		
		Product p = pd.selectProduct(conn, pId);
		
		if(p.getSoldout().equals("N")) {
			result = new ProductDao().updateProduct(conn, pId, 1);			
		} else {
			result = new ProductDao().updateProduct(conn, pId, 2);
		}
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteProduct(int pId) {
		Connection conn = getConnection();
		
		int result = new ProductDao().deleteProduct(conn, pId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int getListCount(String sId) {
		Connection conn = getConnection();
		
		int count = new ProductDao().getListCount(conn, sId);
		
		close(conn);
		
		return count;
	}

}
