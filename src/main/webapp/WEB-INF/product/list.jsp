<%@page contentType="text/html; charset=utf-8" %>
<%-- <%@page import="java.util.*, model.*" %> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--
	@SuppressWarnings("unchecked") 
	List<User> userList = (List<User>)request.getAttribute("userList");
	String curUserId = (String)request.getAttribute("curUserId");
--%>
<html>
<head>
</head>
<body>
<p class="fs-1" style="font-weight: bold;">&nbsp;오늘의 best!</p>
<div class="card-group">
<c:forEach var="product" items="${prodList}">
  <div class="card">
    <a href="<c:url value='/product/view'>
					   <c:param name='productId' value='${product.productId}'/>
			 		 </c:url>">
			 		 <img src="<c:url value='${product.image}'/>" class="card-img-top" style="height: 150px;"/></a>
    <div class="card-body">
      <h5 class="card-title">${product.name}</h5>
      <p class="card-text"><fmt:formatNumber value="${product.price}" type="currency"
								currencySymbol="￦" maxFractionDigits="0" /></p>
    </div>
  </div>
 </c:forEach>
</div>
</body>
</html>