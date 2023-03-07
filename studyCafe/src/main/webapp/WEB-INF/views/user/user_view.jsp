<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content=Type"	content="text/html; charset=UTF-8">
<title>회원정보 상세조회</title>
<%@ include file="../include/user_header.jsp" %>
<script>
	$(document).ready(function(){
		$("#btnUpdate").click(function(){
			if(confirm("수정하시겠습니까?")){
			document.form1.action = "${path}/user/user_update.do";
			document.form1.submit();
			}
		});
	});
	$(document).ready(function(){
		$("#btnUpdate").click(function(){
			if(confirm("삭제하시겠습니까?")){
			document.form1.action = "${path}/user/user_delete.do";
			document.form1.submit();
			}
		});
	});
</script>
</head>
<body>
<%@ include file="../include/user_menu.jsp" %>
		<h2>회원정보 상세</h2>
		<form name="form1" method="post">
			<table border="1">
			<tr>
					<td>회원번호</td>
					<!-- readonly : 회원번호 수정불가처리 -->
					<td><input name="u_number" value="${dto.u_number}" readonly="readonly"></td>
				</tr>
				<tr>
					<td>아이디</td>
					<!-- readonly : 회원 아이디 수정불가처리 -->
					<td><input name="u_id" value="${dto.u_id}" readonly="readonly"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="u_pass"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input name="u_name" value="${dto.u_name}"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="u_tell"></td> <!-- text타입 select box등으로 수정 필요 -->
				</tr>	
					<tr>
				<td>성별</td>
					<td><label><input type="radio" name="u_gender" value="men"> 남</label>
					<label><input type="radio" name="u_gender" value="women"> 여</label></td>
				</tr>
				<tr>
					<td>회원가입일</td>
					<td>
						<fmt:formatDate value="${dto.u_credate}" pattern="yyyy-MM-dd HH:mm:ss"/> <!-- <@~fmt추가필요 -->
					</td>
				</tr>
				<tr>
					<td>회원 정보 수정일</td>
					<td>
						<fmt:formatDate value="${dto.u_upDate}" pattern="yyyy-MM-dd HH:mm:ss"/> <!-- <@~fmt추가필요 -->
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="button" value="수정" id="btnUpdate">
					<input type="button" value="삭제" id="btnDelete">
					<div style="color : red;">${msg}</div>
			</table>
		</form>
</body>
</html>