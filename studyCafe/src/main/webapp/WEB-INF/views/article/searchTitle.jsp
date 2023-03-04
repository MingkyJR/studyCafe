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
${searchArticlePage}
${searchTitle }
	<h2>SearchArticle</h2>
	<table border="1">
		<tr>
			<th>번호</th><th>제목</th><th>아이디</th><th>날짜</th><th>조회수</th>
		</tr>
 	<c:forEach items="${searchArticlePage.content }" var="article">
		<tr>
			<td>${article.a_no}</td>
			<td><a href="${cp}/article/articleDetail?no=${article.a_no}">${article.a_title}</a></td>
			<td>${article.u_id}</td>
			<td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${article.a_regdate}" /></td>
			<td>${article.a_cnt}</td>
		</tr>
	</c:forEach>
	 <%-- paging출력 부분 --%>
   <tr>
  	<td colspan="5" style="text-align:center;">
     <%-- JSTL if조건문: 이전출력 --%>
     <c:if test="${searchArticlePage.startPage>5}">
       <a href="${cp}/article/searchTitle?pageNo=${searchArticlePage.startPage-5}&searchTitle=${searchTitle}">prev</a>
     </c:if>  
     <%-- JSTL forEch조건문: 페이지번호출력 --%>  
     <c:forEach var="pNo"                       
     			begin="${searchArticlePage.startPage}" 
     			end="${searchArticlePage.endPage}">
      <a href="${cp}/article/searchTitle?pageNo=${pNo}&searchTitle=${searchTitle}">${pNo}</a> 
     </c:forEach>  
                                      
     <%-- JSTL if조건문: 다음출력 --%>  
     <c:if test="${searchArticlePage.endPage<searchArticlePage.totalPages}">
       <a href="${cp}/article/searchTitle?pageNo=${searchArticlePage.startPage+5}&searchTitle=${searchTitle}">next</a>
     </c:if> 
   </td>
   </tr>
	</table>
		<form method="get" action="${cp}/article/searchTitle">
		*제목검색
		<input type="text" id="searchTitle" name="searchTitle" />
		<input type="submit" value="찾기" />
	</form>
</body>
</html>