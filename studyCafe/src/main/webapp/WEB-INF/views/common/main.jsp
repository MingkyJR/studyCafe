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
	<div class="banner_wrap">
		<div class="banner">
			<div class="banner_image">
				<img src="<%=request.getContextPath()%>/resources/assets/images/main/studycafe3.jpg">
			</div>
			<div class="btn1"><a href="#">예약하러가기</a></div>
		</div>
	</div>
	<div class="summary">
		<div style="display: inline-block; border-bottom: 2px solid black;"><h3 style="display: inline-block;">스터디룸 예약</h3></div>
	</div>
	<div class="summary">
		<h4>홈페이지 예약제(전화예약 불가)</h4>
		<p>▲ 위 '예약하러가기' 버튼 클릭 하시면 예약 가능한 시간대를 확인할 수 있습니다.</p>
	</div>
	<div class="summary" style="padding-bottom: 13px;">
		<ul>
			<li style="color: #aaa;"><span style="color: black;">지금부터 3시간 후 시간대 부터 예약 가능합니다.</span></li>
			<li style="color: #aaa;"><span style="color: black;">결제 시 예약이 바로 확정됩니다.</span></li>
		</ul>
	</div>
	<br /><br /><br />
	<div class="summary">
		<div style="display: inline-block; border-bottom: 2px solid black;"><h3 style="display: inline-block;">공간 소개</h3></div>
	</div>
	<div class="summary" style="padding-bottom: 15px;">
		<div style="text-align: center;">
			<div style="display:inline-block; width: 353px; height: 353px; border: 1px solid black; margin: 0 20px;">
				<img src="<%=request.getContextPath() %>/resources/assets/images/main/space1.jpeg" />
			</div>
			<div style="display:inline-block; width: 353px; height: 353px; border: 1px solid black; margin: 0 20px;">
				<img src="<%=request.getContextPath() %>/resources/assets/images/main/space2.jpeg" />
			</div>
			<div style="display:inline-block; width: 353px; height: 353px; border: 1px solid black; margin: 0 20px;">
				<img src="<%=request.getContextPath() %>/resources/assets/images/main/space3.jpeg" />
			</div>
		</div>
		<h4 style="margin: 8px 18px;">86평 규모 넓고 쾌적한 프리미엄 스터디카페</h4>
		<p style="margin: 8px 18px;">✔ 전좌석 USB콘센트(3구), WIFI 5회선</p>
		<h4 style="margin: 8px 18px;">▶ 셀프-스터디존</h4>
		<p style="margin: 8px 18px;">✔ 대화 /노트북 타이핑/ 마우스 클릭 불가 → 몰입 공간</p>
	</div>
</body>
</html>