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
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
</style>
<script>
	$(function() {
		$('#digestion').hide();
		$('#immune').hide();
		$('#fatigue').hide();
		$('#joint').hide();
		$('#woman').hide();
		$('#man').hide();
		$('#kids').hide();
		$('#btnSight').click(function() { // 버튼 클릭시
			$('#digestion').hide();
			$('#immune').hide();
			$('#fatigue').hide();
			$('#joint').hide();
			$('#woman').hide();
			$('#man').hide();
			$('#kids').hide();
			$('#sight').show();
		});
		$('#btnDigestion').click(function() { // 버튼 클릭시
			$('#sight').hide();
			$('#immune').hide();
			$('#fatigue').hide();
			$('#joint').hide();
			$('#woman').hide();
			$('#man').hide();
			$('#kids').hide();
			$('#digestion').show();

		});
		$('#btnImmune').click(function() { // 버튼 클릭시
			$('#sight').hide();
			$('#digestion').hide();
			$('#fatigue').hide();
			$('#joint').hide();
			$('#woman').hide();
			$('#man').hide();
			$('#kids').hide();
			$('#immune').show();
		});
		$('#btnFatigue').click(function() { // 버튼 클릭시
			$('#sight').hide();
			$('#digestion').hide();
			$('#immune').hide();
			$('#joint').hide();
			$('#woman').hide();
			$('#man').hide();
			$('#kids').hide();
			$('#fatigue').show();

		});
		$('#btnJoint').click(function() { // 버튼 클릭시
			$('#sight').hide();
			$('#digestion').hide();
			$('#immune').hide();
			$('#fatigue').hide();
			$('#woman').hide();
			$('#man').hide();
			$('#kids').hide();
			$('#joint').show();

		});
		$('#btnWoman').click(function() { // 버튼 클릭시
			$('#sight').hide();
			$('#digestion').hide();
			$('#immune').hide();
			$('#fatigue').hide();
			$('#joint').hide();
			$('#man').hide();
			$('#kids').hide();
			$('#woman').show();

		});
		$('#btnMan').click(function() { // 버튼 클릭시
			$('#sight').hide();
			$('#digestion').hide();
			$('#immune').hide();
			$('#fatigue').hide();
			$('#joint').hide();
			$('#woman').hide();
			$('#kids').hide();
			$('#man').show();

		});
		$('#btnKids').click(function() { // 버튼 클릭시
			$('#sight').hide();
			$('#digestion').hide();
			$('#immune').hide();
			$('#fatigue').hide();
			$('#joint').hide();
			$('#woman').hide();
			$('#man').hide();
			$('#kids').show();

		});
	});
	
</script>
</head>
<body>
</head>

<body>
<p class="fs-1" style="font-weight: bold;">&nbsp;<br>카테고리별 랭킹</p>
<div class="card text-center">
  <div class="card-header">
    <ul class="nav nav-tabs card-header-tabs" style=" background-color:white;">
      <li class="nav-item">
        <button type="button" id="btnSight" class="btn btn-raised btn-success" style="background-color: #bbdb18; color:black;">sight</button>
      </li>
      <li class="nav-item">
        <button type="button" id="btnDigestion" class="btn btn-raised btn-success" style="background-color: #bbdb18; color:black;">digestion</button>
      </li>
      <li class="nav-item">
        <button type="button" id="btnImmune" class="btn btn-raised btn-success" style="background-color: #bbdb18; color:black;">immune</button>
	 </li>
      <li class="nav-item">
        <button type="button" id="btnFatigue" class="btn btn-raised btn-success" style="background-color: #bbdb18; color:black;">fatigue</button>
      </li>
      <li class="nav-item">
        <button type="button" id="btnJoint" class="btn btn-raised btn-success" style="background-color: #bbdb18; color:black;">joint</button>
	</li>
      <li class="nav-item">
        <button type="button" id="btnWoman" class="btn btn-raised btn-success" style="background-color: #bbdb18; color:black;">woman</button>
	 </li>
      <li class="nav-item">
        <button type="button" id="btnMan" class="btn btn-raised btn-success" style="background-color: #bbdb18; color:black;">man</button>

      </li>
      <li class="nav-item">
		<button type="button" id="btnKids" class="btn btn-raised btn-success" style="background-color: #bbdb18; color:black;">kids</button>
      </li>
    </ul>
  </div>
  <div id ="sight" style="width:80%; height:50%;  float:left;">
  	  <table class="table table-sm">
		<c:forEach var="i" items="${sightList}" varStatus="status">
		<tbody>
  	  	<tr>
  	  		<td>${status.count}</td>
  			<td>
  			<a href="<c:url value='/product/view'>
					   <c:param name='productId' value='${i.productId}'/>
			 		 </c:url>">${i.name}</a>
			</td>
  			<td><fmt:formatNumber value="${i.price}" type="currency" currencySymbol="￦" maxFractionDigits="0" /></p></td>
		</tr>
		</tbody>
		</c:forEach>
  	  </table>
  	</div>
  	
  	<div id ="digestion" style="width:80%; height:50%;  float:left;">
  	  <table class="table table-sm">
		<c:forEach var="i" items="${digestionList}" varStatus="status"> 
  	  	<tr>
  	  		<td>${status.count}</td>
  			<td>
  			<a href="<c:url value='/product/view'>
					   <c:param name='productId' value='${i.productId}'/>
			 		 </c:url>">${i.name}</a>
			</td>
  			<td><fmt:formatNumber value="${i.price}" type="currency" currencySymbol="￦" maxFractionDigits="0" /></p></td>
		</tr>
		</c:forEach>
  	  </table>
  	</div>
  	
  	<div id ="immune" style="width:80%; height:50%;  float:left;">
  	  <table class="table table-sm"> 
		<c:forEach var="i" items="${immuneList}" varStatus="status"> 
  	  	<tr>
  	  		<td>${status.count}</td>
  			<td>
  			<a href="<c:url value='/product/view'>
					   <c:param name='productId' value='${i.productId}'/>
			 		 </c:url>">${i.name}</a>
			</td>
  			<td><fmt:formatNumber value="${i.price}" type="currency" currencySymbol="￦" maxFractionDigits="0" /></p></td>
		</tr>
		</c:forEach>
  	  </table>
  	</div>
  	
  	<div id ="fatigue" style="width:80%; height:50%;  float:left;">
  	  <table class="table table-sm"> 
		<c:forEach var="i" items="${fatigueList}" varStatus="status"> 
  	  	<tr>
  	  		<td>${status.count}</td>
  			<td>
  			<a href="<c:url value='/product/view'>
					   <c:param name='productId' value='${i.productId}'/>
			 		 </c:url>">${i.name}</a>
			</td>
  			<td><fmt:formatNumber value="${i.price}" type="currency" currencySymbol="￦" maxFractionDigits="0" /></p></td>
		</tr>
		</c:forEach>
  	  </table>
  	</div>
  	
  	<div id ="joint" style="width:80%; height:50%;  float:left;">
  	  <table class="table table-sm"> 
		<c:forEach var="i" items="${jointList}" varStatus="status"> 
  	  	<tr>
  	  		<td>${status.count}</td>
  			<td>
  			<a href="<c:url value='/product/view'>
					   <c:param name='productId' value='${i.productId}'/>
			 		 </c:url>">${i.name}</a>
			</td>
  			<td><fmt:formatNumber value="${i.price}" type="currency" currencySymbol="￦" maxFractionDigits="0" /></p></td>
		</tr>
		</c:forEach>
  	  </table>
  	</div>
  	
  	<div id ="woman" style="width:80%; height:50%;  float:left;">
  	  <table class="table table-sm"> 
		<c:forEach var="i" items="${womanList}" varStatus="status"> 
  	  	<tr>
  	  		<td>${status.count}</td>
  			<td>
  			<a href="<c:url value='/product/view'>
					   <c:param name='productId' value='${i.productId}'/>
			 		 </c:url>">${i.name}</a>
			</td>
  			<td><fmt:formatNumber value="${i.price}" type="currency" currencySymbol="￦" maxFractionDigits="0" /></p></td>
		</tr>
		</c:forEach>
  	  </table>
  	</div>
  	
  	<div id ="man" style="width:80%; height:50%; float:left;">
  	  <table class="table table-sm"> 
		<c:forEach var="i" items="${manList}" varStatus="status"> 
  	  	<tr>
  	  		<td>${status.count}</td>
  			<td>
  			<a href="<c:url value='/product/view'>
					   <c:param name='productId' value='${i.productId}'/>
			 		 </c:url>">${i.name}</a>
			</td>
  			<td><fmt:formatNumber value="${i.price}" type="currency" currencySymbol="￦" maxFractionDigits="0" /></p></td>
		</tr>
		</c:forEach>
  	  </table>
  	</div>
  	
  	<div id ="kids" style="width:80%; height:50%; float:left;">
  	  <table class="table table-sm"> 
		<c:forEach var="i" items="${kidsList}" varStatus="status"> 
  	  	<tr>
  	  		<td>${status.count}</td>
  			<td>
  			<a href="<c:url value='/product/view'>
					   <c:param name='productId' value='${i.productId}'/>
			 		 </c:url>">${i.name}</a>
			</td>
  			<td><fmt:formatNumber value="${i.price}" type="currency" currencySymbol="￦" maxFractionDigits="0" /></p></td>
		</tr>
		</c:forEach>
  	  </table>
  	</div>
</div>

</body>
</html>