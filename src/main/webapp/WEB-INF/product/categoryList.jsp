<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*, model.*" %>  
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	Product product = (Product)request.getAttribute("product");
	
	@SuppressWarnings("unchecked") 
	List<Product> productList = (List<Product>)request.getAttribute("productList");
	String productId = (String)request.getAttribute("productId");
%>

<html>
<head>
<title>상품 상세</title> 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<html>
<head>
<title>제품</title>
</head>

<body>
<%@include file="/WEB-INF/basicBar.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/category.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!-- Section-->
<section>
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4">
			<c:forEach var="product" items="${categoryList}">
				<div class="col mb-5">
					<div class="card h-100">
					
					<!-- Product image-->
					<a href="<c:url value='/product/view'>
					 <c:param name='productId' value='${product.productId}'/>
			 		 </c:url>"><img class="card-img-top" src="<c:url value='${product.image}'/>"
								width="100" height="100" /></a>
								
					<!-- Product details-->
					<div class="card-body p-4">
					<div class="text-center">
					
					<!-- Product name-->
					<h5 class="fw-bolder">${product.name}</h5>
					
					<!-- Product price-->
					<fmt:formatNumber value="${product.price}" type="currency" currencySymbol="￦" maxFractionDigits="0" /></p>
					</div>
				</div>
				<!-- Product actions-->
                     <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                     <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="<c:url value='/product/view'>
					 <c:param name='productId' value='${product.productId}'/>
			 		 </c:url>">더보기</a></div>
                 </div>
			</div>
		</div>
	</c:forEach>
	</div>
</div>
</section>
</body>
</html>