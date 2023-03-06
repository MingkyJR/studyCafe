<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>

 <title>QnaReadDetail</title>
 <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

    
    
    <script src="<%=request.getContextPath()%>/assets/js/jquery-2.1.0.min.js"></script>

    
    <!-- Global Init -->
       <style>
		table {
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

        	});
        	
        	function mdAuthCheck(gr){
        		//gr=999;
        		if(gr=null || gr=='1'){
        			alert("권한이 없습니다.");
        			location.href='<%=request.getContextPath()%>/qna/read?no=${noticeData.notice.number}&pageNo=${pageNo}&rowSize=${rowSize}';
        		}else{
        			location.href='<%=request.getContextPath()%>/qna/modify?no=${noticeData.notice.number}&pageNo=${pageNo}&rowSize=${rowSize}';
        		}
        	}
        	
        	
        	function rmAuthCheck(gr){
        		//gr=999;
        		if(gr=null || gr=='1'){
        			alert("권한이 없습니다.");
        			location.href='<%=request.getContextPath()%>/qna/read?no=${noticeData.notice.number}&pageNo=${pageNo}&rowSize=${rowSize}';
        		}else{
        			location.href='<%=request.getContextPath()%>/qna/delete?no=${noticeData.notice.number}&pageNo=${pageNo}&rowSize=${rowSize}';
        		}
        	}
        	
        	
        	function rmAuthCheck2(gr){
        		//gr=999;
        		if(gr=null || gr=='1'){
        			alert("권한이 없습니다.");
        			location.href='<%=request.getContextPath()%>/qna/read?no=${noticeData.notice.number}&pageNo=${pageNo}&rowSize=${rowSize}';
        		}else{
        			location.href='<%=request.getContextPath()%>/qna/delete2?no=${noticeData.notice.number}&pageNo=${pageNo}&rowSize=${rowSize}';
        		}
        	}
        	
        	
        	
        	function deleteConfirm(){
       		 if (confirm("삭제를 진행하시겠습니까?")) {
       	            alert("삭제가 완료되었습니다.");
       				location.href='<%=request.getContextPath()%>/qna/delete?no=${qna.q_no}';
       	        } else {
       	            alert("삭제가 취소되었습니다.");
       	        	location.href='<%=request.getContextPath()%>/qna/read?no=${qna.q_no}&pageNo=${pageNo}&rowSize=${rowSize}';

       	        }
       	}
        	

        </script>
        

</head>
<body>

<%-- 컨트롤러에 의해 아래와 같이 Model 받았다.
		request.setAttribute("qna", qna);//notice테이블과 notice_content테이블
		request.setAttribute("pageNo", pageNo);//요청페이지
		request.setAttribute("rowSize", rowSize);//1페이지당 게시글수
*내용:${noticeData}<br/><br/>
*요청페이지:${pageNo}<br/><br/>
*1페이지당 게시글수:${rowSize}<br/><br/>--%>


<p class="home" style="margin:0 auto; max-width: 950px;">
<a href="<%=request.getContextPath()%>/qna/list">HOME</a>
</p>
 <hr/>

<br/><br/>
 <table border="1" style="text-align:center;">
<!--  <table border="1"> -->
 	<tr style="height:50px;">
 		<th class="h">게시글 번호</th>
 		<td class="c">${qna.q_no}</td>
 	</tr>
 	
 	 <tr style="height:50px;">
 		<th class="h">작성자</th>
 		<td class="c">${qna.q_writer}</td>
 	</tr>
 	
 	 <tr style="height:50px;">
 		<th class="h">최초 작성일</th>
 		<td class="c"><fmt:formatDate pattern="yyyy년 MM월 dd일  HH:mm:ss" type="date" value="${qna.q_regdate}" /></td>
 	</tr>
 	
 	<tr style="height:50px;">
 		<th class="h">마지막 수정일</th>
 		<td class="c"><fmt:formatDate pattern="yyyy년 MM월 dd일  HH:mm:ss" type="date" value="${qna.q_moddate}" /></td>
 	</tr>
 	
 	
 	 <tr style="height:50px;">
 		<th class="h">제목</th>
 		<td class="c">${qna.q_title}</td>
 	</tr>
 	
 	 <tr>
 		<th class="h">내용</th>
 		<td class="c" style="white-space: pre-wrap;"><u:pre value="${qna.q_content}"/>
 		<br/>
 		<br/>
 		<br/>
 		<br/>
 		<br/>
 		<br/>
 		<br/></td>
 	</tr>
 

 	 <tr style="height:50px;">
 		<td colspan="2" style="text-align:center;" class="c">
 		<%--pp662 29라인 
 		<c:set var="변수명" value="변수값"/> 
 		<%--
 		<c:set var="pageNo" value="${조건?조건참일경우:거짓일경우}"/>
 		
 		result="조건?"1":"100"
 		String result=null;
 		if(조건){
 			조건참일경우
 			result="1";
 		}else{
 			거짓일경우
 			result="100";
 		}
 		syso(result);--%>
 		
 		<c:set var="pageNo" value="${(empty param.pageNo)?'1':param.pageNo}"/>
 		<!--파라미터 pageNo값이 비어있으면 1로 세팅하고 그것이 아니면 (비어있지 않고 값이 있다면) 그 값으로 세팅해라~~
 		 * ListNoticeHandler에 이미 있지만 안정성을 위해서 한번 더 해준다.
		 * pageNo.isEmpty() = empty param.pageNO 와 같은 문법 -->
		 
		<%--pageNo=${pageNo}<br/> --%>

 		

 		
<%--  		<a href="<%=request.getContextPath()%>/notice/list.do?pageNo=${pageNo}&rowSize=${rowSize}">목록보기</a> --%>
		<button type="button" id="list" onclick="location.href='<%=request.getContextPath()%>/qna/list?pageNo=1&rowSize=5'">처음 목록보기</button>
 		<button type="button" id="list" onclick="location.href='<%=request.getContextPath()%>/qna/list?pageNo=${pageNo}&rowSize=${rowSize}';">이전 목록보기</button>
 		<%--수정과 삭제기능은 로그인한 유저의 id와 작성자의 id가 일치하는 경우에만 노출하도록 한다. --%>
 		<%-- <c:if test="${AUTHUSER.memberid==noticeData.notice.writer.writer_id}"> --%>
 		<c:if test="${AUTHUSER.u_id==qna.q_writer}">
<%--  		<a href="<%=request.getContextPath()%>/notice/modify.do?no=${noticeData.notice.number}&pageNo=${pageNo}&rowSize=${rowSize}">게시글 수정</a> --%>
<%--  		<button type="button" id="mod" onclick="mdAuthCheck(${AUTHUSER.u_grade});">게시글 수정</button> --%>
 		<button type="button" id="mod" onclick="location.href='<%=request.getContextPath()%>/qna/modifyForm?no=${qna.q_no}&pageNo=${pageNo}&rowSize=${rowSize}';">게시글 수정</button>
<%--  		<a href="<%=request.getContextPath()%>/notice/delete.do?no=${noticeData.notice.number}">글삭제(delete용)</a> --%>
<%--  		<button type="button" id="del" onclick="rmAuthCheck(${AUTHUSER.u_grade});">게시글 삭제</button> --%>
<%--  		<button type="button" onclick="rmAuthCheck(${AUTHUSER.grade});">게시글 삭제(delete)</button> --%>
<%--  		</c:if> --%>
<%--  		<a href="<%=request.getContextPath()%>/notice/delete2.do?no=${noticeData.notice.number}">글삭제(update용)</a> --%>
<%--  		<button type="button" id="del" onclick="location.href='<%=request.getContextPath()%>/qna/delete?no=${qna.q_no}'">게시글 삭제</button> --%>
		<button type="button" id="del" onclick="deleteConfirm()">게시글 삭제</button>
 		</c:if>
 		</td>
 	</tr>
 </table>
 
 <%-- 댓글등록 ----------------------------------%>
<!--  <form name = "frmInsReply" id="frmInsReply"  -->
<%--  		action="<%=request.getContextPath()%>/reply/writeReply.do" method="post"> --%>
<%--  <input type="hidden" name="pageNo" id="pageNo" value="${pageNo}"/> --%>
<%--  <input type="hidden" name="oriNo" id="oriNo" value="${reboard.no}"/> --%>
<%--  <input type="hidden" name="writer" id="writer" value="${sessionScope.AUTHUSER.memberid}"/>  --%>
<!--  <table border="1"> -->
<!-- 	 <tbody> -->
<!-- 		 <tr> -->
<!-- 			<th>댓글제목</th> -->
<!-- 			<td colspan="3"> -->
<!-- 			<input type="text" name="qr_title" id="qr_title" onclick="loginChk()"/> -->
<!-- 			</td> -->
<!-- 		</tr> -->
			 
<!-- 		<tr> -->
<!-- 			<th>댓글내용</th> -->
<!-- 			<td colspan="3"> -->
<!-- 			<textarea name="qr_content" id="qr_content" cols="50" rows="10" onclick="loginChk()" placeholder="타인을 배려하는 마음을 담아 댓글을 작성해주세요.&#10;내용에 따라 이용약관 및 관련 법률에 의해 임의 조치를 수행 할 수 있습니다."></textarea> -->
<!-- 			</td> -->
<!-- 		</tr> -->
			 
<!-- 		<tr> -->
<!-- 			 <th>비밀번호</th> -->
<!-- 			 <td colspan="3"> -->
<!-- 			 <input type="password" name="rPassword" id="rPassword" onclick="loginChk()"/> -->
<!-- 			 </td> -->
<!-- 		</tr> -->

<!-- 		<tr> -->
<!-- 			 <td colspan="4" class="center"> -->
<!-- 			 <button type="button" id="btnInsReply_ajax">댓글쓰기(ajax)</button> -->
<!-- 			 </td> -->
<!-- 		</tr> -->

<!-- 	 </tbody> -->
<!--  </table> -->
 
<!--  </form> -->
 
 
 
<!--  <table> -->
<!--     <tr> -->
<!--         <th colspan="2">댓글 목록</th> -->
<!--     </tr> -->
<%--     <c:choose> --%>
<%--         <c:when test="${message != null }"> --%>
<!--             <tr> -->
<%--                 <td>${message }</td> --%>
<!--             </tr> -->
<%--         </c:when> --%>
<%--         <c:otherwise> --%>
<%--             <c:forEach var="list" items="${list }"> --%>
<!--                 <tr> -->
<%--                     <td><font size="1.5"><b>${list.cid }</b> --%>
<%--                         ${list.ctime } --%>
<%--                         <c:if test = "${sessionId.id == list.cid }"> --%>
<!--                             <b> -->
<%--                                 <a href="javascript:open_win('BoardServlet?command=comment_edit_delete&cnum=${list.cnum }','noname')">[수정/삭제]</a> --%>
<!--                             </b> -->
<%--                         </c:if> --%>
<!--                         </font> -->
<!--                         <br> -->
<%--                             ${list.ccontent } --%>
<!--                     </td> -->
<!--                 </tr> -->
<%--             </c:forEach> --%>
<%--         </c:otherwise> --%>
<%--     </c:choose> --%>
<!-- </table> -->



<%-- <form action = "BoardServlet" method = "post" name = "check">
<input type = "hidden" name = "command" value = "comment_write">
<input type = "hidden" name = "pnum" value = "${param.num }">
<table>
    <tr>
        <th>댓글</th>
        <td><textarea rows="3" cols="40" name = "c_content"></textarea></td>
    
        <td><input type = "submit" value = "댓글달기" onclick = "return com_check()"></td>
    </tr>
</table>
</form>
 
<c:forEach var="i" begin = "1" end ="${totalCount }" step="1">
    <a href="BoardServlet?command=board_view&num=${param.num }&page=${i}">[${i}]</a>
</c:forEach>
 
<br><br>
<input type = "button" value = "목록" onclick = "location.href='BoardServlet?command=board_list'">
<c:if test = "${sessionId.id == sVo.mid }">
<input type = "button" value = "수정" onclick = "open_win('BoardServlet?command=board_pass&num=${sVo.num}','update')">
<input type = "button" value = "삭제" onclick = "open_win('BoardServlet?command=board_pass&num=${sVo.num}','delete')">
<input type = "button" value = "답글" onclick = "open_win('BoardServlet?command=board_reply_form&num=${sVo.num}','reply')">
</c:if> --%>
 
 
 

</body>
</html>






