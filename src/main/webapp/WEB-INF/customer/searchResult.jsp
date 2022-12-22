<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>아이디/비밀번호 찾기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@include file="/WEB-INF/basicBar.jsp" %>
<%@include file="/WEB-INF/category.jsp" %>

<div style="position:absolute; top:50%; left:50%; transform:translate(-50%,-50%);" align="center">
	
	<c:choose>
		<c:when test="${customerId ne null}">
			<h5>회원님의 아이디는 <font style="color:red;">${customerId}</font>입니다.</h5>
		</c:when>
		<c:when test="${password ne null}">
			<h5>회원님의 비밀번호는 <font style="color:red;">${password}</font>입니다.</h5>
		</c:when>
		<c:when test="${customerId eq null && isExist ne 'unexist'}">
			<h5>입력한 전화번호에 해당되는 회원정보가 없습니다.</h5>
		</c:when>
		<c:otherwise>
			<h5>존재하지 않는 아이디입니다.</h5>
		</c:otherwise>
	</c:choose>
	<br>
	<a class="btn btn-dark" style="color:#bbdb18;" href="<c:url value='/customer/login'/>">로그인</a>
	<a class="btn btn-dark" style="color:#bbdb18;" href="<c:url value='/customer/search'/>">다시 찾기</a>
</div>
</body>
</html>