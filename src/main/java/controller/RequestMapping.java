package controller;

import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import controller.product.ListProductByCategoryController;
import controller.product.ListProductController;
import controller.product.SearchController;
import controller.product.ViewProductController;
import controller.cart.*;
import controller.customer.*;
import controller.order.*;


public class RequestMapping {
    private static final Logger logger = LoggerFactory.getLogger(DispatcherServlet.class);
    
    // 각 요청 uri에 대한 controller 객체를 저장할 HashMap 생성
    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {
    	// 각 uri에 대응되는 controller 객체를 생성 및 저장
        mappings.put("/", new ForwardController("index.jsp"));
        mappings.put("/main", new ListProductController());
        
        mappings.put("/customer/login", new LoginController());
        mappings.put("/customer/logout", new LogoutController());
        mappings.put("/customer/delete", new DeleteCustomerController());
        mappings.put("/customer/update", new UpdateCustomerController());
        mappings.put("/customer/idCheck", new IdCheckController());
        mappings.put("/customer/myPage", new MyPageController());
        mappings.put("/customer/view", new ViewCustomerController());
        mappings.put("/customer/register", new RegisterCustomerController());
        mappings.put("/customer/search", new SearchIDPWController());
        
        mappings.put("/product/view", new ViewProductController());
        mappings.put("/product/search", new SearchController());
        mappings.put("/product/category", new ListProductByCategoryController());
        
        mappings.put("/order/form", new CreateOrderController());
    	mappings.put("/order/makeOrder", new CreateOrderController());
    	mappings.put("/order/orderCheck", new CheckOrderController());
    	mappings.put("/order/cancel", new OrderCancelController());
        
        mappings.put("/cart/view", new ViewCartItemsController());
        mappings.put("/cart/addCartItem", new CreateCartItemController());
    	mappings.put("/cart/deleteCartItem", new DeleteCartItemController());
        logger.info("Initialized Request Mapping!");
    }

    public Controller findController(String uri) {	
    	// 주어진 uri에 대응되는 controller 객체를 찾아 반환
        return mappings.get(uri);
    }
}