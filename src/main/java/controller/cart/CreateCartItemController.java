package controller.cart;

import java.util.ArrayList;
import java.util.List;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.customer.CustomerSessionUtils;
import model.service.CartManager;
import model.service.ProductManager;
import model.Cart;
import model.Product;

public class CreateCartItemController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CartManager cartManager = CartManager.getInstance();
		ProductManager productManager = ProductManager.getInstance();
		
		HttpSession session = request.getSession();
		
		String productId = request.getParameter("productid");
		 
		 if (CustomerSessionUtils.hasLogined(session)) {
				String customerId = CustomerSessionUtils.getLoginCustomerId(session);
				cartManager.createCartItem(productId, customerId);
		} else {
			Product product = productManager.findProduct(productId);
			
			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			Date date = new Date();
			String cartId = dateFormat.format(date);
			
			Cart cart = new Cart();
			cart.setCartId(cartId);
			cart.setPrice(product.getPrice());
			cart.setProductId(productId);
			cart.setProductImage(product.getImage());
			cart.setProductName(product.getName());
			cart.setQuantity(1);
			
			List<Cart> cartItems = (List<Cart>)session.getAttribute("cartItems");
			
			if (cartItems == null) {
				cartItems = new ArrayList<Cart>();
			}
			cartItems.add(cart);
			
			session.setAttribute("cartItems", cartItems);
		}
		
		return "redirect:/cart/view";
	}

}
