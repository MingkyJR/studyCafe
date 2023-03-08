<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path"  value="${pageContext.request.contextPath}"/>
<html>
	<head>
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원가입</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/login";
						    
			})//함수종료1
		
			$("#submit").on("click", function(){
				if($("#u_id").val()==""){
					alert("아이디를 입력해주세요.");
					$("#u_id").focus();
					return false;
				}//함수종료2
				if($("#u_pass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#user_pass").focus();
					return false;
				}
				if($("#u_name").val()==""){
					alert("이름을 입력해주세요.");
					$("#u_name").focus();
					return false;
				}
			});
		})//함수종료
	</script>
	<body>
		<section id="container">
					<form action="${path}/user/user_insert.do" method="post">
						  
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input name="u_id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="u_pass"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input name="u_name"></td>
			</tr>
			<tr>
				<td>성별</td>
					<td><label><input type="radio" name="u_gender" value="men"> 남</label>
					<label><input type="radio" name="u_gender" value="women"> 여</label></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input name="u_tell"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="회원가입">
					<input type="submit" value="취소">
			</tr>
		</table> 
	</form>
		</section>
		
	</body>
	
</html>