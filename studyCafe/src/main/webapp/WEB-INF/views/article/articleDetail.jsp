<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
	$(document).ready(function(){
		$("textarea").keyup(function(e){
			$(this).css('height', 'auto');
			$(this).height(this.scrollHeight);
		});
	});
</script>
<style>
html, head{
			width: 100%;
			height: 100%;
		}
		.title{
		}
		.second_container{
			width: 800px;
			margin: 30px auto;
			padding: 10px;
			border: 1px solid #bbbbbb;
			border-radius: 10px;
		}
		.comment_option{
			border-top: 1px solid #979797;
			padding: 10px 0;
		}
		.comment_area{
			font-size: 13px;
			border-top: 1px solid #e5e5e5;
			padding: 5px 0;
		}
		button {
			margin: 5px 5px;
			background-color: #505D93;
			color: white;
			padding: 6px 20px;
			border: none;
			border-radius: 4px;
			cursor: pointer;
		}
		button:hover {
			background-color: #788AD0;
		}
		img{
			max-width: 100%;
		}
		.commentWriter{
			padding: 5px;
			border: 2px solid #e5e5e5;
			border-radius: 8px;
			height: auto;
		}
		textarea{
			width: 97%; 
			border: none; 
			outline: none; 
			resize: none;
		}
		#btnList{
			background-color: #ebad34;
		}
		#btnList:hover{
			background-color: #ffc500;
		}
</style>
</head>
<body>
<div class="second_container">
		<div>
			<div class="title"><h3>${content.title}</h3></div>
			<div class="writer">작성자: ${content.empID}</div>
			<div>작성일자: ${content.regDate} 조회수: ${views}</div>
		</div>
		<div style="margin: 10px 0;">공지사항 내용</div>
		<div class="comment_option">댓글</div>
		<c:forEach var="re" items="${ reply }">
			<div class="comment_area">
				<div style="font-weight:450; margin: 3px 0; font-size: medium;">${ re.empID }</div>		
				<div style="margin-bottom: 3px;">${ re.reContent }</div>
				<span style="font-style: italic;">${ re.str_Date }</span>
					<%-- <c:if test="${ re.empID==AUTHUSER.emp_id }">
						<a href="#" style="text-decoration: none; color: black;">
							<span class="replyDel" style="float: right; margin-right: 5px;" param="${ re.reNo }">댓글삭제</span>
						</a>
						<a href="#" style="text-decoration: none; color: black;">
							<span class="replyModi" style="float: right; margin-right: 5px;" param="${ re.reNo }">댓글수정 | </span>
						</a>
					</c:if> --%>
				</div>
			<div class="commentWriter" id="commentModify${ re.reNo }" style="display: none;">
				<div style="margin: 5px 0;">${AUTHUSER.emp_id}</div>
				<textarea rows="" cols="" id="reModiContent${ re.reNo }" name="recontent" >${ re.reContent }</textarea>
				<div style="text-align: right;"><button id="btnReplyModi" param="${ re.reNo }" class="reModi" >수정</button></div>
			</div>
		</c:forEach>
		<div class="commentWriter">
			<div style="margin: 5px 0;">${AUTHUSER.emp_id}</div>
				<textarea rows="" cols="" placeholder="댓글을 입력해주세요." id="recontent" name="recontent" ></textarea>
			<div style="text-align: right;"><button id="btnReply">등록</button></div>
		</div>
		<button id="btnList"><a href="<%=request.getContextPath()%>/secondHand/list.do?pageNo=${currentPage}" style="text-decoration: none; color: white;">목록보기</a></button>
		<c:if test="${content.empID==AUTHUSER.emp_id}">
			<button id="btnDelete">삭제</button>
			<button id="btnUpdate">수정</button>
		</c:if>
	</div>
</body>
</html>