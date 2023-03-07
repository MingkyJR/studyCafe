<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
<%@ include file="include/header.jsp" %>
</head>
<body>
<%@ include file="include/menu.jsp" %>
<p> The time on the server is ${serverTime}.
</p>
	${result}
	
<%-- <%@ include file="include/user_header.jsp" %> 		<!-- 수정필요 -->
</head>
<body>
<%@ include file="include/user_login_menu.jsp" %>		<!-- 수정필요 -->
		<c:if test="${msg == 'success'}">
		<h2>${sessionScope.user_name}(${sessionScope.user_id})님 환영합니다.</h2>
		</c:if> --%>
</body>
</html>
