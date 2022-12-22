<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>장바구니</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@include file="/WEB-INF/basicBar.jsp" %>
<%@include file="/WEB-INF/category.jsp" %>

<div style="width:1000px; padding: 50px;">
<h1>Cart</h1><br>
<table class="table" style="width:1000px; vertical-align:middle;">
	<thead class="table-secondary">
		<tr>
			<th width="10%">상품</th>
			<th width="40%">상품명</th>
			<th>금액</th>
			<th>수량</th>
			<th>적립금</th>
			<th>배송비</th>
			<th>합계</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="cartItem" items="${cartItems}">
			<tr>
				<td>
					<img src="<c:url value='${cartItem.productImage}'/>" width="100" height="100"/>
				</td>
				<td>${cartItem.productName}</td>
				<td>${cartItem.price * cartItem.quantity}원</td>
				<td>${cartItem.quantity}</td>
				<td>
					<fmt:parseNumber value="${cartItem.price * cartItem.quantity / 100}" integerOnly="true"/>원
				</td>
				<td>2500원</td>
				<td>${cartItem.price * cartItem.quantity + 2500}원</td>
				<td>
					<a class="btn btn-secondary btn-sm" style="font-size:xx-small;" href="<c:url value='/cart/deleteCartItem'>
						<c:param name='cartId' value='${cartItem.cartId}'/>
					</c:url>" onclick="">취소</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<a class="btn btn-dark" style="color:#bbdb18; float:right;" href="<c:url value='/order/form' />">주문하기</a>
</div>
</body>
</html>