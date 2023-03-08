<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
	li {list-style: none; display:inline; padding: 6px;}
</style>
<ul>
	<!-- <li><a href="/article/list">목록</a></li> 수정예정
	<li><a href="/aritlce/writeView">글 작성</a></li> 수정예정 -->
	<li>
		<c:if test="${user != null}"><a href="/user/user_logout.do">로그아웃</a></c:if>
		<c:if test="${user == null}"><a href="/">로그인</a></c:if>
	</li>
	<li>
		<c:if test="${user != null}">
			<p>${user_info.u_id}이 로그인 중입니다.</p>
		</c:if>
	</li>
</ul>