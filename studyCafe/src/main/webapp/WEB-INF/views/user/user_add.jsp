<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<title>Form Tag</title>
</head>
<body>
http://localhost:8083/app/member/add
	<h3>회원가입(addMember.jsp)</h3>
	<form:form modelAttribute="NewMember" method="post"
	           action="./add">
		<p>아이디 : <form:input path="id"  name="id" /> 
		<p>비밀번호 : <form:password path="passwd"/>
		<p>이름 : <form:input path="name"/>
 		<p>성별 : <form:radiobutton  path="gender"  value="남성"/>남성 
				<form:radiobutton   path="gender"  value="여성"/>여성
		<p>가입일 <form:input path="regdate" />
		<p><input type="submit" value="가입하기"/> 
			<input type="reset"  value="다시쓰기"/>
	</form:form> 
</body>

<html>






