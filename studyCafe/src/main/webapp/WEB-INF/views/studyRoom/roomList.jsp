<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.room_wrap {
		margin: 70px auto;
	}
	.room {
		margin: 20px;
		display: inline-block;
		width: 550px;
		height: 270px;
		border: 1px solid black;
	}
	.room_img {
		display: inline-block;
		float: left;
		width: 60%;
		height: 100%;
		border: 1px solid black;
	}
	.room_info {
		box-sizing: border-box;
		display: inline-block;
		float: left;
		padding: 5px;
		width: 39%;
		height: 100%;
	}
	
</style>
</head>
<body>
	<div class="room_wrap">
		<div class="room">
			<div class="room_img">
			</div>
			<div class="room_info">
				<h3 style="text-align: center;">스터디룸 A (2인실)</h3>
			</div>
		</div>
		<div class="room">
			<div class="room_img">
			</div>
			<div class="room_info">
				<h3 style="text-align: center;">스터디룸 B (4인실)</h3>
			</div>
		</div>
	</div>
	<div class="room_wrap">
		<div class="room">
			<div class="room_img">
			</div>
			<div class="room_info">
				<h3 style="text-align: center;">스터디룸 C (6인실)</h3>
			</div>
		</div>
		<div class="room">
			<div class="room_img">
			</div>
			<div class="room_info">
				<h3 style="text-align: center;">스터디룸 D (8인실)</h3>
			</div>
		</div>
	</div>
</body>
</html>