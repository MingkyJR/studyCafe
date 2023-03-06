<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<title>회원가입(등록)</title>
<%@ include file="../include/user_header.jsp" %>
</head>

<body>
<%@ include file="../include/user_menu.jsp" %>
	<h3>회원가입(user_add.jsp)</h3>
	<form name="form1" method="post" action="${path}/user/user_insert.do">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input name="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input name="pass"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input name="name"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input name="tell"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="radio" name="gender"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="확인">
					<input type="submit" value="취소">
			</tr>
		</table> 
	</form>
</body>
<html>






