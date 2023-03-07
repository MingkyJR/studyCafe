<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<c:set var="cp" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-2.2.4.js" ></script>
       <style>
		#t1 {
	    width: 800px;
	    height: 600px;
	    margin-left: auto;
	    margin-right: auto;
	 	}
	 	th {
	    text-align: center;
/* 	    border: 1px solid #EFEFEF; */
	    background: #C5CAD7;
	    width : 190px;
	 	}
	 	
	 	.c {
	    text-align: left;
/* 	    border: 1px solid #EFEFEF; */
/* 	    background: #C5CAD7 */
		padding-left : 5px; 
	 	}
	 	
	 	
	 	#list{
	 	  color: white;
		  text-align: center;
		  background: #7C8EBF;
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
	 	#mod{
	 	  color: white;
		  text-align: center;
		  background: #7C8EBF;
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
	 	#del{
	 	  color: white;
		  text-align: center;
		  background: #7C8EBF;
		  border: solid 1px #191970;
		  border-radius: 3px;
	 	}
        </style>
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
		$("#btn6").click(function(){
			alert("자신글만 수정 가능합니다.");
		});
	});
	$(document).ready(function(){
		$("#btn7").click(function(){
			alert("자신글만 삭제 가능합니다.");
		});
	});
		
	
</script>
<title>스터디카페</title>
</head>
<body>
 <table border="1" style="text-align:center;" id="t1">
		<tr tr style="height:50px;">
			<th class="h">글 번호</th>
			<td class="c">${article.a_no}</td>
		</tr>
		<tr tr style="height:50px;">
			<th class="h">아이디</th>
			<td class="c">${article.u_id}</td>
		</tr>
		<c:if test="${article.a_regdate eq article.a_modidate}">
		<tr tr style="height:50px;">
			<th class="h">최초 작성일</th>
			<td class="c"><fmt:formatDate pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${article.a_regdate}" /></td>
		</tr>
		</c:if>
		<c:if test="${article.a_regdate ne article.a_modidate}">
		<tr tr style="height:50px;">
			<th class="h">마지막 수정일</th>
			<td class="c"><fmt:formatDate pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${article.a_modidate}" /></td>
		</tr>
		</c:if>
		<tr tr style="height:50px;">
			<th class="h">조회수</th>
			<td class="c">${article.a_cnt}</td>
		</tr>
		<tr tr style="height:50px;">
			<th class="h">제목</th>
			<td class="c">${article.a_title}</td>
		</tr>
		<tr tr style="height:50px;">
			<th class="h">내용</th>
			<td class="c" style="white-space: pre-wrap;"><u:pre value="${article.a_content}"/>
		</tr>
	</table>
	<br/>
		<div style="text-align:center;">
				<c:if test="${AUTHUSER.u_number eq article.u_number }">
				<input type="button" id="btn1" value="수정"/>
				<input type="button" id="btn2" value="삭제"/>
				</c:if>
				<input type="button" id="btn3" value="목록보기"/>
		</div>
	<br/><br/><br/>
	<form action="${cp}/article/addComment">
	<div style="text-align:center;">
		<textarea name="ac_content" id="ac_content" rows="5" cols="90" required="required"></textarea> 
	</div>
		<input type="hidden" id="a_no" name="a_no" value="${article.a_no}" />
		<input type="hidden" id="u_number" name="u_number" value="${AUTHUSER.u_number}" />
		<input type="hidden" id="u_id" name="u_id" value="${AUTHUSER.u_id}" />
		<br/>
		<input type="submit" value="댓글등록" style="margin-left:900px;"/>
	</form>
	<br/>
	<br/>
		<table border="1" style="text-align:center;" id="t2">
		<c:if test="${not empty commemt }">
			<tr>
				<th>내용</th><th>작성자아이디</th><th>날짜</th><th>수정</th><th>삭제</th>		
			</tr>
			<c:forEach items="${commemt}" var="commemt">
				<tr>
					<td><u:pre value="${commemt.ac_content}"/></td>
					<td>${commemt.u_id}</td>
					<td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${commemt.ac_modidate}" /></td>
					<c:if test="${AUTHUSER.u_id eq commemt.u_id}">
					<td><input type="button" value="수정" id="btn4"
					onclick="location.href='${cp}/article/modiCommentForm?no=${article.a_no}&ac_no=${commemt.ac_no}'"/>
					 </td>
					<td><input type="button" value="삭제" id="btn5" 
					onclick="location.href='${cp}/article/deleteComment?no=${article.a_no}&ac_no=${commemt.ac_no}'"/></td>
					</c:if>
					<c:if test="${AUTHUSER.u_id ne commemt.u_id}">
					<td><input type="button" value="수정" id="btn6" /></td>
					<td><input type="button" value="삭제" id="btn7" /></td>
					</c:if>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty commemt }">
			<tr><th>댓글이 없습니다</th></tr>
		</c:if>
		</table>
		
</body>
</html>