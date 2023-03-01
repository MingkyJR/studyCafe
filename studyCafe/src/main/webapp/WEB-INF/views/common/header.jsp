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
			<div class="inline_section_left"><div style="text-align: left;"><img src="<%= request.getContextPath() %>/resources/assets/images/main/pencil.png" style="width: 40px; height: 40px;" />스터디 카페</div></div>
			<div class="inline_section_right">
				<span>로그인</span><span> | </span><span>회원가입</span>
			</div>
			<div class="naviVar">
				<div>
					<span><a href="#">공지사항</a></span>
					<span><a href="#">이용안내</a></span>
					<span><a href="#">공간소개</a></span>
					<span><a href="#">스터디룸 예약</a></span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>