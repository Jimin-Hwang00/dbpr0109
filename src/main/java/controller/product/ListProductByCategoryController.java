package controller.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.Product;
import model.service.ProductManager;

public class ListProductByCategoryController implements Controller{
	

	@Override
	 public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String category = request.getParameter("category");
		
		ProductManager manager = ProductManager.getInstance();
		List<Product> categoryList = manager.findProductListByCategory(category);  

		request.setAttribute("categoryList", categoryList);

		return "/product/categoryList.jsp";
	}
}