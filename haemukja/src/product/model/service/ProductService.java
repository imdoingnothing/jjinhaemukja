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

}
