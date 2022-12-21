<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function cancelOrder() {
	return confirm("정말 주문을 취소하시겠습니까?");
}
</script>

</head>
<body>
<%@include file="/WEB-INF/basicBar.jsp" %>
<%@include file="/WEB-INF/category.jsp" %>

<div align = "center">
	<br>
	<h3><b>My Page</b></h3>
	<br>
	<font style="vertical-align:middle;">${customer.name}님 안녕하세요</font>
	<a class="btn btn-dark btn-sm" style="color:#bbdb18; font-size:xx-small;" href="<c:url value='/customer/view' >
	    <c:param name='customerId' value='${customer.customerId}'/>
	</c:url>">내 정보 확인하기</a><br>
	<font>적립금: ${customer.point}원</font>
	<br><br>
	
	<table class="table" style="width:900px;">
	<caption style="caption-side:top;">최근 주문 정보</caption>
		<thead class="table-secondary">
			<tr>
				<th width="15%">주문일자</th>
				<th>상품명 (수량)</th>
				<th width="15%">배송상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="order" items="${customer.orders}">
				<tr>
					<td>${order.orderDate}</td>
					<td>
					<c:forEach var="item" items="${order.items}">
						${item.productName} (${item.quantity})<br>
					</c:forEach>
					</td>
					<td>
						${order.orderStatus}<br>
						<c:if test="${order.orderStatus eq '입금 전'}">
							<a class="btn btn-secondary btn-sm" style="font-size:xx-small;" href="<c:url value='/order/cancel'>
								<c:param name='orderId' value='${order.orderId}'/>
							</c:url>" onclick="return cancelOrder();">주문취소</a>
						</c:if>
					</td>
					<c:if test="${cancelFailed}">
						<script>alert("${exception.getMessage()}")</script>
				    </c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>