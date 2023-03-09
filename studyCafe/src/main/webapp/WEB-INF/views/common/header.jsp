<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/resources/assets/css/main/main.css" rel="stylesheet" />
</head>
<body>
	<div class="header_wrap">
		<div class="inline_section">
			<div class="header_top">
				<div class="inline_section_left"><div style="text-align: left;">스터디 카페 햇반점</div></div>
				<div class="inline_section_right">
					<c:if test="${AUTHUSER.u_id eq null}">
						<span><a href="<%=request.getContextPath() %>/login">로그인</a></span><span> | </span><span><a href="<%=request.getContextPath()%>/join">회원가입</a></span>
					</c:if>
					<c:if test="${AUTHUSER.u_id ne null}">
						<span>${AUTHUSER.u_name}님  </span>|
						<c:if test="${AUTHUSER.u_grade ne 999}">
						<span><a href="<%=request.getContextPath() %>/modiUserForm">회원정보수정 </a></span>|
						</c:if>
						<c:if test="${AUTHUSER.u_grade eq 999}">
						<span><a href="<%=request.getContextPath() %>/userList">회원관리 </a></span>|
						</c:if>
						<span><a href="<%=request.getContextPath() %>/logout">로그아웃</a></span>
					</c:if>
				</div>
			</div>
			<div class="naviVar">
				<div>
					<span><a href="<%=request.getContextPath()%>/article/articleList">공지사항</a></span>
					<span><a href="#">문의사항</a></span>
					<span><a href="#">음식 주문</a></span>
					<span><a href="#">좌석 예약</a></span>
					<span><a href="<%=request.getContextPath()%>/reservationMain">스터디룸 예약</a></span>
					<span><a href="<%=request.getContextPath()%>/reservationConfirm">예약 확인</a></span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>