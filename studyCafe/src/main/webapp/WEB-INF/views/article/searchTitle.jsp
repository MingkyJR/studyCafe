<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="cp" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>SearchArticle</h2>
	<table border="1">
		<tr>
			<th>번호</th><th>제목</th><th>아이디</th><th>날짜</th><th>조회수</th>
		</tr>
 	<c:forEach items="${articleList}" var="article">
		<tr>
			<td>${article.a_no}</td>
			<td><a href="${cp}/article/articleDetail?no=${article.a_no}">${article.a_title}</a></td>
			<td>${article.u_id}</td>
			<td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${article.a_regdate}" /></td>
			<td>${article.a_cnt}</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>