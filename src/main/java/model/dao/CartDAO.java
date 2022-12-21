package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Cart;

public class CartDAO {
	private JDBCUtil jdbcUtil = null;
	
	public CartDAO() {
		jdbcUtil = new JDBCUtil(); // JDBCUtil 객체 생성
	}
	
	/**
	* cart 테이블에 새로운 customer 생성.
	*/
	public int createCart(Cart cart) throws SQLException {
		String sql = "INSERT INTO cart (cartid, productid, price, count, customerid) VALUES (?, ?, ?, ?, ?)";
		Object[] param = new Object[] {cart.getCartId(), cart.getProductId(), cart.getPrice(),
		cart.getQuantity(), cart.getCustomerId()};
		jdbcUtil.setSqlAndParameters(sql, param); // JDBCUtil 에 insert 문과 매개변수 설정
		
		try {
			int result = jdbcUtil.executeUpdate(); // insert 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {
			jdbcUtil.commit();
			jdbcUtil.close(); // resource 반환
		}
		return 0;
	}
	
	//customerId로 cartitem 찾기
	public List<Cart> findCartItems(String customerId) throws SQLException {
		String sql = "SELECT cartid, productid, quantity "
    			+ "FROM cart_item "
    			+ "WHERE customerid=?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {customerId});
		
		List<Cart> cartItems = new ArrayList<Cart>();
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			while (rs.next()) {
				Cart cartItem = new Cart();
				cartItem.setCartId(rs.getString("cartid"));
				cartItem.setCustomerId(customerId);
				cartItem.setProductId(rs.getString("productid"));
				cartItem.setQuantity(rs.getInt("quantity"));
				cartItems.add(cartItem);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		
		return cartItems;
	}
	
	//producId로 cartItem의 정보를 추가
	public void findItemInfo(Cart cartItem) throws SQLException {
		String sql = "SELECT name, price, image "
    			+ "FROM product "
    			+ "WHERE productid=?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {cartItem.getProductId()});
		
		try {
			ResultSet rs = jdbcUtil.executeQuery();
			if (rs.next()) {
				cartItem.setProductName(rs.getString("name"));
				cartItem.setPrice(rs.getInt("price"));
				cartItem.setProductImage(rs.getString("image"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		// resource 반환
		}
		
		return;
	}
	
	/**
	* 장바구니에 있는 item 을 삭제.
	*/
	public int removeCartItem(String productId) throws SQLException {
		String sql = "DELETE FROM Shop WHERE productId=?";
		jdbcUtil.setSqlAndParameters(sql, new Object[] {productId}); //jDBCUtil 에 delete 문과 매개 변수 설정
		try {
			int result = jdbcUtil.executeUpdate(); // delete 문 실행
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close(); // resource 반환
		}
		return 0;
	}
}