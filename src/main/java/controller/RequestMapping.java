package controller;

import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.customer.DeleteCustomerController;
import controller.customer.IdCheckController;
import controller.customer.LoginController;
import controller.customer.LogoutController;
import controller.customer.MyPageController;
import controller.customer.RegisterCustomerController;
import controller.customer.UpdateCustomerController;
import controller.customer.ViewCustomerController;
import controller.order.CheckOrderController;
import controller.order.CreateOrderController;
import controller.product.ListProductController;
import controller.product.SearchController;
import controller.product.ViewProductController;


public class RequestMapping {
    private static final Logger logger = LoggerFactory.getLogger(DispatcherServlet.class);
    
    // 각 요청 uri에 대한 controller 객체를 저장할 HashMap 생성
    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {
    	logger.info("Initialized Request Mapping!");
    	
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
        
        mappings.put("/product/view", new ViewProductController());
        mappings.put("/product/search", new SearchController());
    	
    	mappings.put("/order/form", new CreateOrderController());
    	mappings.put("/order/makeOrder", new CreateOrderController());
    	mappings.put("/order/orderCheck", new CheckOrderController());
    }

    public Controller findController(String uri) {	
    	// 주어진 uri에 대응되는 controller 객체를 찾아 반환
        return mappings.get(uri);
    }
}