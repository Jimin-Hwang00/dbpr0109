package controller.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.customer.CustomerSessionUtils;
import model.Cart;
import model.service.CartManager;

public class ViewCartItemsController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CartManager cartManager = CartManager.getInstance();
		
		HttpSession session = request.getSession();
		List<Cart> cartItems = null;
		
		if (CustomerSessionUtils.hasLogined(session)) {
			String customerId = CustomerSessionUtils.getLoginCustomerId(session);
			cartItems = cartManager.findCartItems(customerId);
		}
		else { // 로그인하지 않은 상태로 장바구니 확인하기
			cartItems = (List<Cart>)session.getAttribute("cartItems");
		}
		request.setAttribute("cartItems", cartItems);
		return "/cart/view.jsp";
	}
}
