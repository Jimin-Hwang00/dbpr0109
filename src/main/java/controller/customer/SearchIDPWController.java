package controller.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.service.CustomerManager;

public class SearchIDPWController implements Controller {
	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equals("GET")) {
    		return "/customer/searchForm.jsp";
	    }
			
		//POST
		CustomerManager manager = CustomerManager.getInstance();
		
		if(request.getParameter("customerId") != null) {
			String customerId = request.getParameter("customerId");
			boolean existId = manager.idCheck(customerId);
			if(existId) {
				String password = manager.findPasswordById(customerId);
				request.setAttribute("password", password);
			}
			else {
				request.setAttribute("isExist", "unexist");
			}
		}
		else {
			String phoneNumber = request.getParameter("phoneNum1") + "-" 
					+ request.getParameter("phoneNum2") + "-" 
					+ request.getParameter("phoneNum3");
			String id = manager.findIdByPhoneNumber(phoneNumber);
			request.setAttribute("customerId", id);
		}
		
        return "/customer/searchResult.jsp";			
			
    }
}