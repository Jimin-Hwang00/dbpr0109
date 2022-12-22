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
</head>
<body>
<%@include file="/WEB-INF/basicBar.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/category.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

	<div class="row gx-4 gx-lg-5 align-items-center">
		<div class="col-md-6">
			<img class="card-img-top mb-5 mb-md-0"
				src="<c:url value='${product.image}'/>"width="400" height="400" />
		</div>
		<div class="col-md-6">
			<div class="small mb-1">${product.category}</div>
			<h1 class="display-5 fw-bolder">${product.name}</h1>
			<div class="fs-5 mb-5">
				<span class="text-decoration-line-through"><fmt:formatNumber value="${product.price}" type="currency" currencySymbol="￦" maxFractionDigits="0" /></p></span>
			</div>
			<p class="lead">${product.description}</p>
			<div class="d-flex">
				<input type="button" value="구매하기" class="btn btn-raised btn-success" style="background-color: #bbdb18; color:black;" onClick="location.href='<c:url value="/order/form?productid=${product.productId }"/>'"> &nbsp;
			<input type="button" value="장바구니 담기" class="btn btn-raised btn-success" style="background-color: #bbdb18; color:black; " onClick="location.href='<c:url value="/cart/addCartItem?productid=${product.productId }"/>'">
			</div>
		</div>
	</div>

</body>
</html>