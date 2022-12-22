<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>아이디/비밀번호 찾기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function switchDiv(v, id) {
	if(v == 'id') {
		document.getElementById('id').style.display = "";
		document.getElementById('password').style.display = "none";
	}
	else {
		document.getElementById('password').style.display = "";
		document.getElementById('id').style.display = "none";
	}
}

function searchId() {
	if (idSearchFrm.phoneNum1.value == "") {
		alert("전화번호를 입력하십시오.");
		idSearchFrm.phoneNum1.focus();
		return false;
	}
	if (idSearchFrm.phoneNum2.value == "") {
		alert("전화번호를 입력하십시오.");
		idSearchFrm.phoneNum2.focus();
		return false;
	}
	if (idSearchFrm.phoneNum3.value == "") {
		alert("전화번호를 입력하십시오.");
		idSearchFrm.phoneNum3.focus();
		return false;
	}
	idSearchFrm.submit();
}

function searchPW() {
	if (pwSearchFrm.customerId.value == "") {
		alert("아이디를 입력하시오.");
		pwSearchFrm.customerId.focus();
		return false;
	}
	pwSearchFrm.submit();
}
</script>
</head>
<body>
<%@include file="/WEB-INF/basicBar.jsp" %>
<%@include file="/WEB-INF/category.jsp" %>

<div style="position:absolute; top:50%; left:50%; transform:translate(-50%,-50%);" align="center">
	<input type="radio" name="type" value="id" onclick="switchDiv(this.value,'id')" checked> 아이디 찾기
	<input type="radio" name="type" value="password" onclick="switchDiv(this.value,'password')"> 비밀번호 찾기
	<br><br>
	
	<div id="id">
		<form name="idSearchFrm" method="POST" action="<c:url value='/customer/search'/>">
			<h6><b>&lt;전화번호를 입력해주세요&gt;</b></h6>
			<div class="d-flex" style="width:350px;">
				<input class="form-control" type="text" name="phoneNum1">
				&nbsp;-&nbsp;
				<input class="form-control" type="text" name="phoneNum2">
				&nbsp;-&nbsp;
				<input class="form-control" type="text" name="phoneNum3">
			</div>
			<br>
			<input class="btn btn-dark" style="color:#bbdb18;" type="button" value="아이디 찾기" onClick="searchId()">
			<a class="btn btn-dark" style="color:#bbdb18;" href="<c:url value='/customer/login'/>">취소</a>
		</form>
	</div>
	<div id="password" style="display:none;">
		<form name="pwSearchFrm" method="POST" action="<c:url value='/customer/search'/>">
			<h6><b>&lt;아이디를 입력해주세요&gt;</b></h6>
			<input class="form-control" type="text" name="customerId" placeholder="아이디">
			<br>
			<input class="btn btn-dark" style="color:#bbdb18;" type="button" value="비밀번호 찾기" onClick="searchPW()">
			<a class="btn btn-dark" style="color:#bbdb18;" href="<c:url value='/customer/login'/>">취소</a>
		</form>
	</div>
</div>
</body>
</html>