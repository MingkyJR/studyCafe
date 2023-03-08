<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path"  value="${pageContext.request.contextPath}"/>
<a href="${path}/user/user_list.do">게시판(메인화면으로 이동하도록 수정 필요or삭제필요)</a> <!-- 게시판 수정필요 -->
<c:choose>
<c:when test="${sessionScope.user_id == null}">
	<a href ="${path}/user/login.do">로그인</a> <!-- 로그아웃 상태라면 로그인이 뜨도록 -->
</c:when>
	<c:otherwise>
	${sessionScope.user_name}님이 로그인중입니다.
	<a href="${path}/user/user_logout.do">로그아웃</a> <!-- 로그인상태라면 로그아웃이 뜨도록 -->
	</c:otherwise>
</c:choose>
<hr>