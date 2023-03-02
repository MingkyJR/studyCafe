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
			location.href='${cp}/article/addArticleForm';
		});
	});
		
</script>
<title>스터디카페</title>
</head>
<body>
${AUTH_USER}
	<h2>공지사항 리스트(articleList.jsp)</h2>
	<table border="1">
		<tr>
			<th>번호</th><th>제목</th><th>아이디</th><th>날짜</th><th>조회수</th>
		</tr>
 	<c:forEach items="${articlePage.content}" var="article">
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
     <c:if test="${articlePage.startPage>5}">
       <a href="${cp}/article/articleList?pageNo=${articlePage.startPage-5}">prev</a>
     </c:if>  
     <%-- JSTL forEch조건문: 페이지번호출력 --%>  
     <c:forEach var="pNo"                       
     			begin="${articlePage.startPage}" 
     			end="${articlePage.endPage}">
      <a href="${cp}/article/articleList?pageNo=${pNo}">${pNo}</a> 
     </c:forEach>  
                                      
     <%-- JSTL if조건문: 다음출력 --%>  
     <c:if test="${articlePage.endPage<articlePage.totalPages}">
       <a href="${cp}/article/articleList?pageNo=${articlePage.startPage+5}">next</a>
     </c:if> 
   </td>
   </tr>
	</table>

	<form method="get" action="${cp}/article/searchTitle">
		*제목검색
		<input type="text" id="searchTitle" name="searchTitle" />
		<input type="submit" value="찾기" />
	</form>
	<input type="button" value="글쓰기" id="btn1" name="btn1" />
</body>
</html>