<%@page contentType="text/html; charset=utf-8" %>
<%-- <%@page import="java.util.*, model.*" %> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
	@SuppressWarnings("unchecked")  
	List<User> userList = (List<User>)request.getAttribute("userList");
	String curUserId = (String)request.getAttribute("curUserId");
--%>
<html>
<title>everyHealth</title>
<body>
<%@include file="/WEB-INF/basicBar.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/category.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/product/list.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="/WEB-INF/product/bestCategoryList.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</body>
</html>