<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="cp" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-2.2.4.js" ></script>
<script>

	$(document).ready(function(){
		$("#btn1").click(function(){
			location.href='${cp}/article/articleList';
		});
	});
</script>
<title>스터디카페</title>
</head>
<body>
	<h2>게시글 작성</h2>
	<form action="${cp}/article/addArticle">
	<table border="1">
		<tr>
			<th>제목</th>
		</tr>
		<tr>
			<td><input type="text" name="a_title" id="a_title"  size="28" required="required"/></td>
		</tr>
		<tr>
			<th>내용</th>
		</tr>
		<tr>
			<td>
			<textarea name="a_content" id="a_content" rows="5" cols="30" required="required"></textarea>
<!-- 			<input type="hidden" name="u_id" id="u_id" /> -->
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="글쓰기" />
				<input type="button" id="btn1" value="목록으로" />
			</td>
			
		</tr>
	</table>
	</form>
</body>
</html>