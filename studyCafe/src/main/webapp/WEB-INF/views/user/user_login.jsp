<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<title>로그인 페이지</title>
<%@ include file="../user/user_login.jsp" %> <!-- 걍로문제--> 
<script>

	$(document).ready(function(){
		$("#btnLogin").click(function({
			//태그.val() : 태그에 입력된 값
			// 태그.val("값") : 태그 값을 변경
			ver user_id = $("#user_id").val();
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
		}
		//제출
		document.form1.submit(); //form1에 맞는 jsp주소로 수정할 것.
	}

</script>
</head>
<body>

</body>
</html>