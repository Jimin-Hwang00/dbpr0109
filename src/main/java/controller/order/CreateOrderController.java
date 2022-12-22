package controller.order;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.customer.CustomerSessionUtils;
import model.BillingInfo;
import model.Cart;
import model.CashReceipt;
import model.Customer;
import model.Item;
import model.NonMemCustomer;
import model.Order;
import model.Product;
import model.ShippingDetail;
import model.service.CartManager;
import model.service.CustomerManager;
import model.service.OrderManager;
import model.service.OutOfStockException;
import model.service.ProductManager;

public class CreateOrderController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(CreateOrderController.class);
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		OrderManager orderManager = OrderManager.getInstance();
		
		String customerId = null;	
		Customer customer = null;
		int totalPrice = 0;
		ArrayList<Item> items = new ArrayList<Item>();
		
		// 로그인 여부 확인
		CustomerManager customerManager = CustomerManager.getInstance();
		if (CustomerSessionUtils.hasLogined(session)) {
			customerId = CustomerSessionUtils.getLoginCustomerId(session); 
			customer = customerManager.findCustomer(customerId);
		} 
		
		// GET request: order form 요청
		if (request.getMethod().equals("GET")) {	
    		log.debug("OrderForm Request");
    		
    		// orderForm에 회원 정보를 자동으로 기입하기 위해. 
    		if (CustomerSessionUtils.hasLogined(session)) {
	    		request.setAttribute("customer", customer);
    		}
    		
    		ProductManager productManager = ProductManager.getInstance();
    		String productId = null;
    		
    		if ((productId = request.getParameter("productid")) != null) {		// 상품 상세보기 페이지에서 상품 하나만 결제하는 경우.
    			Product product = productManager.findProduct(productId);
    			
    			Item item = new Item(productId, product.getName(), 1, product.getImage());
    			items.add(item);

    			totalPrice = product.getPrice();
    			
    			request.setAttribute("items", items);
    			request.setAttribute("totalPrice", totalPrice);
    			
    			session.setAttribute("items", items);
    		} else {															// 장바구니에서 넘어온 상품들을 결제하는 경우.
    			List<Cart> cartItems;
    			CartManager cartManager = CartManager.getInstance();
    			if (CustomerSessionUtils.hasLogined(session)) {					// 로그인되어 있는 상태라면 DB에서 장바구니 상품을 가져옴.
    				customerId = CustomerSessionUtils.getLoginCustomerId(session);
    				cartItems = cartManager.findCartItems(customerId);
    			} else {														// 로그인이 안 되어 있는 상태라면 session에 담겨있는 장바구니 상품을 가져옴.
    				cartItems = (List<Cart>) session.getAttribute("cartItems");
    			}
    			
    			for (Cart cartItem : cartItems) {								// 장바구니 상품을 Item DTO에 담음.
    				Product product = productManager.findProduct(cartItem.getProductId());

    				Item item = new Item();
    				item.setImage(product.getImage());
    				item.setProductId(cartItem.getProductId());
    				item.setProductName(product.getName());
    				item.setQuantity(cartItem.getQuantity());
    				
    				items.add(item);
    			}

    			totalPrice = orderManager.calcTotalPrice(items);				// 모든 아이템의 가격 총합을 구함.
    			
    			request.setAttribute("items", items);
    			request.setAttribute("totalPrice", totalPrice);
    			
    			session.setAttribute("items", items);
    		}
		
			return "/order/orderForm.jsp";   // orderForm으로 이동.     	
	    }
		
//		order form에서 입력받은 값 가져오기
		String name = request.getParameter("name");								// 주문자 이름
		String email = request.getParameter("email");							// 주문자 이메일
		String phone = request.getParameter("phone");							// 주문자 전화번호
		String usedPoint = request.getParameter("usedPoint");					// 사용한 포인트 (회원인 경우에만)
		String address = request.getParameter("address");						// 배송 주소
		String crType = request.getParameter("cashReceiptType");				// 현금 영수증 (개인/사업자)
		String crPhone = request.getParameter("cashRecepitPhone");				// 현금 영수증 번호
		String accountHolder = request.getParameter("accountHolder");			// 입금 이름
		String bankName = request.getParameter("bankName");						// 입금 은행명
		String shippingMessage = request.getParameter("shippingMessage");		// 배송 메세지
		String finalPrice = request.getParameter("finalPrice");					// 최종 가격 
		items = (ArrayList<Item>) session.getAttribute("items");				// 주문할 상품
		
		ShippingDetail sd = new ShippingDetail(address, shippingMessage);	
		CashReceipt cr = new CashReceipt(crType, crPhone);
		BillingInfo bi = new BillingInfo(accountHolder, bankName);
		
		Order order = null;
		NonMemCustomer nmCustomer = null;
		if (CustomerSessionUtils.hasLogined(session)) {
			order = new Order(-1, new Date(), "입금 전", customerId, Integer.parseInt(usedPoint), null);
			
		} else {
			order = new Order(-1, new Date(), "입금 전", null, 0, null);
			nmCustomer = new NonMemCustomer(name, email, phone);
		}
		
		Order newOrder;
		try {
			session.removeAttribute("items");
			newOrder = orderManager.createOrder(order, nmCustomer, items, cr, bi, sd, Integer.parseInt(finalPrice));
			return "redirect:/order/orderCheck?orderid=" + newOrder.getOrderId();
		} catch (OutOfStockException e) {
			request.setAttribute("exception", e);
			return "/order/orderCheck.jsp";
		} catch (SQLException e) {
			request.setAttribute("exception", e);
			request.setAttribute("orderFailed", "true");
			return "/order/orderForm.jsp";
		} 
	}

}
