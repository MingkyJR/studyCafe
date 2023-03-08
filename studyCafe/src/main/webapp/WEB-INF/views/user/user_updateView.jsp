<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원가입</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#u_ass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#u_pass").focus();
					return false;
				}
				if($("#u_name").val()==""){
					alert("성명을 입력해주세요.");
					$("#u_name").focus();
					return false;
				}
			});
			
				
			
		})
	</script>
	<body>
		<section id="container">
			<form action="/member/memberUpdate" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="u_id">아이디</label>
					<input class="form-control" type="text" id="userId" name="u_id" value="${user_info.u_id}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="u_pass">패스워드</label>
					<input class="form-control" type="password" id="u_pass" name="u_pass" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="u_name">성명</label>
					<input class="form-control" type="text" id="u_name" name="u_name" value="${user_info.u_name}"/>
				</div>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
		</section>
		
	</body>
	
</html>