package controller.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.customer.CustomerSessionUtils;
import model.Cart;
import model.service.CartManager;

public class DeleteCartItemController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CartManager cartManager = CartManager.getInstance();
		
		HttpSession session = request.getSession();
		
		String cartId = request.getParameter("cartId");
		if (CustomerSessionUtils.hasLogined(session)) {
			cartManager.deleteCartItem(cartId);
		} else {
			List<Cart> cartItems = (List<Cart>) session.getAttribute("cartItems");
			
			for(int i = 0; i < cartItems.size(); i++) {
				if (cartItems.get(i).getCartId().equals(cartId)) {
					cartItems.remove(i);
				}
			}
			
			session.setAttribute("cartItems", cartItems);
		}
		
		return "redirect:/cart/view";
	}

}
