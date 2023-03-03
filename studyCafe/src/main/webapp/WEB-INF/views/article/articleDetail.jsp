<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-2.2.4.js" ></script>
<script>

	$(document).ready(function(){
		$("#btn1").click(function(){
				location.href='${cp}/article/modifyArticleForm?a_no=${article.a_no}';
		});
	});
	$(document).ready(function(){
		$("#btn2").click(function(){
			if(confirm("삭제하시겠습니까?") === true) {
				location.href='${cp}/article/deleteArticle?a_no=${article.a_no}';
				alert("삭제하였습니다.")
		    }
		});
	});
	$(document).ready(function(){
		$("#btn3").click(function(){
			location.href='${cp}/article/articleList';
		});
	});
	$(document).ready(function(){
		$("#btn4").click(function(){
			location.href='${cp}/article/modiCommSDSADASASDASDAS';
		});
	});
		
	
</script>
<title>스터디카페</title>
</head>
<body>
	<h2>articleDetail</h2>
	${AUTHUSER }
	<table border="1">
		<tr>
			<th>제목</th><td colspan="5">${article.a_title}</td>
		</tr>
		<tr>
			<th>작성아이디</th><td>${article.u_id}</td>
			<c:if test="${article.a_regdate eq article.a_modidate}">
			<th>작성일</th>
			<td><fmt:formatDate pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${article.a_regdate}" /></td>
			</c:if>
			<c:if test="${article.a_regdate ne article.a_modidate}">
			<th>수정일</th>
			<td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${article.a_modidate}" /></td>
			</c:if>
			<th>조회수</th><td>${article.a_cnt}</td>
		</tr>

		<tr>
			
		</tr>
		<tr>
			<th>내용</th><td colspan="5">${article.a_content}</td>
			<input type="hidden" id="a_no" name="a_no" value="${article.a_no}" />
		</tr>
		<tr>
			<td colspan="6" >
				<input type="button" id="btn1" value="수정"/>
				<input type="button" id="btn2" value="삭제"/>
				<input type="button" id="btn3" value="목록보기"/>
			</td>
		</tr>
	</table>
	<br/><br/><br/>
	<form action="${cp}/article/addComment">
		<textarea name="ac_content" id="ac_content" rows="5" cols="30" required="required"></textarea> 
		<input type="hidden" id="a_no" name="a_no" value="${article.a_no}" />
		<br/>
		<input type="submit" value="댓글등록"/>
	</form>
		<table border="1">
		<c:if test="${not empty commemt }">
			<tr>
				<th>내용</th><th>작성자아이디</th><th>날짜</th><th>수정</th>		
			</tr>
			<c:forEach items="${commemt}" var="commemt">
				<tr>
					<td>${commemt.ac_content}</td>
					<td>${commemt.u_id}</td>
					<td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${commemt.ac_modidate}" /></td>
					<td><input type="button" value="수정" id="btn4" /></td>
			</c:forEach>
		</c:if>
		<c:if test="${empty commemt }">
			<tr><th>댓글이 없습니다</th></tr>
		</c:if>
		</table>
		
</body>
</html>