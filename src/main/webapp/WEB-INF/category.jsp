<%@page contentType="text/html; charset=utf-8" %>
<%-- <%@page import="java.util.*, model.*" %> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<script>
function search() {
	if (searchForm.keyword.value == "") {
		alert("검색어를 입력하십시오.");
		searchForm.keyword.focus();
		return false;
	}
	searchForm.action="<c:url value='/product/search'/>";
	searchForm.submit();
};
function change(category) {
	document.getElementById("c").value=category;
	searchForm.submit();
}

</script>
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    background-color: #333;
}
ul:after{
    content:'';
    display: block;
    clear:both;
}
li {
    float: left;
}
li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}
li a:hover:not(.active) {
    background-color: #111;
}
</style>
</head>

<body>
<form name="searchForm" method="POST" action="<c:url value='/product/category'/>">
 <ul>
	<li><input type="hidden" id="c" name="category" value="sight">
      	<input type="button" class="btn text-white" value="sight" onClick=change("sight")></li>
      <li>
      	<input type="button" class="btn text-white" value="digestion" onClick=change("digestion")></li>
      <li>
      	<input type="button" class="btn text-white" value="immune" onClick=change("immune")></li>
      <li>
      	<input type="button" class="btn text-white" value="fatigue" onClick=change("fatigue")></li>	
      <li>
      	<input type="button" class="btn text-white" value="joint" onClick=change("joint")></li>
      <li>
      	<input type="button" class="btn text-white" value="woman" onClick=change("woman")></li>
      <li>
      	<input type="button" class="btn text-white" value="man" onClick=change("man")></li>
      <li>
      	<input type="button" class="btn text-white" value="kids" onClick=change("kids")></li>
      
      <div style="float:right">
    	<table>
      	<tr>
 	   		<td><input type="text" style="width:240" name="keyword"></td>
       		<td><input type="button" value="검색" onClick="search()">
       		</td>
  		</tr>
  		</table>
  	  </div>
  </ul>
</form>
</body>
</html>