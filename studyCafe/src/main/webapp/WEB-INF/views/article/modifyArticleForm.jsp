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
			if(confirm("수정하시겠습니까?") === true) {
				alert("수정하였습니다.")
		    }
		});
		$("#btn2").click(function(){
				location.href='${cp}/article/articleDetail?no=${article.a_no}';
		});
	});
		
</script>
<title>스터디카페</title>
</head>
<body>
${article.a_no}
	<h2>게시글 수정</h2>
	<form action="${cp}/article/modifyArticle">
	<table border="1">
		<tr>
			<th>제목</th>
		</tr>
		<tr>
			<td>
			<input type="text" name="a_title" id="a_title"  size="28" required="required" value="${article.a_title}">
			
			</input>
			</td>
		</tr>
		<tr>
			<th>내용</th>
		</tr>
		<tr>
			<td>
			<textarea name="a_content" id="a_content" rows="5" cols="30" required="required">${article.a_content}</textarea>
 			<input type="hidden" name="a_no" id="a_no" value="${article.a_no}" />
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="수정하기" id="btn1" />
				<input type="button" id="btn2" value="돌아가기" />
			</td>
			
		</tr>
	</table>
	</form>
</body>
</html>