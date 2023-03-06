<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html><title>Home</title>
<head>
</head>
<body>
<a href="${path}/board/list.do">게시판</a> <!-- 게시판 수정필요 -->
<c:choose>
<c:when test="${sessionScope.user_id == null}">
	<a href ="${path}/user/user_login.do">로그인</a> <!-- 수정필요 -->
</c:when>
	<c:otherwise>
	${sessionScope.user_name}님이 로그인중입니다.
	<a href="${path}/user/user_logout.do">로그아웃</a>
	</c:otherwise>
</c:choose>
<hr>
</body>
</html>