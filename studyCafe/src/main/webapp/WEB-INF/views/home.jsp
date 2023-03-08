<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<title>Home</title>	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<a href="user/user_list">회원 목록</a><br/> <!-- 임시 -->
<script type="text/javascript">
$(document).reday(function(){
	$("#logoutBtn").on("click",function(){
		location.href="user/logout";
	})
	$("#user_addBtn").on("click",function(){
		location.href="user/user_add";
	})
	
	$("#user_updateBtn").on("click",function(){
		location.href="user/user_updateView";
	})
	
})
</script>
<body>
	<form name='homeForm' method="post" action="/user/user_login">
		<c:if test="${user == null}">
			<div>
				<label for="user_id"></label>
				<input type="text" id="user_id" name="user_id">
			</div>
			<div>
				<label for="user_pass"></label>
				<input type="password" id="user_pass" name="user_pass">
			</div>
			<div>
				<button type="submit">로그인</button>
				<button id="registerBtn" type="button">회원가입</button>
			</div>
		</c:if>
		<c:if test="${member != null }">
			<div>
				<p>${member.userId}님 환영 합니다.</p>
				<button id="user_addBtn" type="button">회원정보수정</button>
				<button id="logoutBtn" type="button">로그아웃</button>
			</div>
		</c:if>
		<c:if test="${message == false}">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
		</c:if>
	</form>
</body>
</html>