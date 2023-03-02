<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<span><a href="#">로그인</a></span><span> | </span><span><a href="#">회원가입</a></span>
				</div>
			</div>
			<div class="naviVar">
				<div>
					<span><a href="#">공지사항</a></span>
					<span><a href="#">문의사항</a></span>
					<span><a href="#">음식 주문</a></span>
					<span><a href="#">좌석 예약</a></span>
					<span><a href="<%=request.getContextPath()%>/room">스터디룸 예약</a></span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>