<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>
<%@ include file="../user/user_login.jsp" %> <!-- 걍로문제--> 
<script>

	$(document).ready(function(){
		$("#btnLogin").click(function({
			//태그.val() : 태그에 입력된 값
			// 태그.val("값") : 태그 값을 변경
			var user_id = $("#user_id").val();
			var user_pass = $("#user_pass").val();
		if(user_id==""){
			alert("아이디를 입력하세요.") //팝업창
				$("#user_id").focus(); //입력 포커스(커서)이동
				return; //종료
			}
		if(user_pass == ""){
			alert("#user_pass").foucs();
			return;
		}
		//폼 내부의 데이터를 전송할 주소
		document.form1.action="${path}/user/loginCheck.do"
		
		//제출
		document.form1.submit(); //form1에 맞는 jsp주소로 수정할 것.
		});
	});
</script>
</head>
<body>
<%@ include file="../user/user_login_menu.jsp" %>
<h2>로그인</h2>
	<form name="form1" method="post">
		<table border="1" width="400px"> 
			<tr>
				<td>아이디</td>
				<td><input name="user_id" id="user_id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="user_pass" id="user_pass"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" id="btnLogin">로그인</button>
				<c:if test="${msg == 'failure'}">
					<div style="color: red">
						아이디 또는 비밀번호가 일치하지 않습니다.
					</div>
				</c:if>
				<c:if test="${msg == 'logout'}">
					<div style="color: red">
						로그아웃 되었습니다.
					</div>
				</c:if>	
				</td>
			</tr>
		</table>
	</form>
</body>
</html>