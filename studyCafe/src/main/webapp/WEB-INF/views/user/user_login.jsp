<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="path"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>
<%@ include file="../include/header.jsp" %>  
<script>
$(function(){
$("#btnlogin").click(function(){
	user_id=$("user_id").val();
	var pass = $("#pass").val(); 
	if(user_id == ""){
		alert("아이디를 입력하세요.");
		$("#userid").focus();//입력 포커스 이동
		
		return; //함수 종료
		}
	if(pass ==""){
		alert("비밀번호를 입력하세요.");
		$("#pass").focus();
		return;
	}
	//폼 내부의 데이터를 전송할 주소
	document.form1.action = "${path}/user/login_check.do";
	document.form1.submit();//제출
	});
});
</script>
</head>

<body>
<%@ include file="../include/menu.jsp" %>
<h2>로그인</h2>
<form name="form1" method="post">
<table border="1">
	<tr>
		<td>아이디</td>
		<td><input type="text" id="u_id" name="u_id" required/></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" id="u_pass" name="u_pass" required/></td>
	</tr>
	<tr>
	<td colspan="2" align="center">
	<button type = "submit" id ="btnlogin">로그인</button>
	<c:if test="${message == 'error'}">
	<div style = "color:red;"> 아이디 또는 비밀번호가 일치하지 않습니다
	</div>
	</c:if>
	<c:if test = "${message = 'logout' }">
	<div style="color:red;">로그아웃 되었습니다.
	</div>
	</c:if>
	</td>
	</tr>
</table>
</form>
</body>
</html>