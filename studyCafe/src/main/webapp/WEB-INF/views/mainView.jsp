<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   html, body{
      margin: 0;
      box-sizing: border-box;
   }
   .header_wrap{
      height: 150px;
   }
   .inline_section{
      width: 1200px;
      height: 100%;
      margin: 0 auto;
      border: 1px solid black;
      text-align: center;
   }
   .inline_section_left{
      box-sizing: border-box;
      display: inline-block;
      padding: 0 10px;
      width: 49.7%;
      height: 72px;
      line-height: 72px;
      border: 1px solid black;
   }
   .inline_section_right{
      box-sizing: border-box;
      display: inline-block;
      padding: 0 10px;
      width: 49.7%;
      height: 72px;
      line-height: 72px;
      text-align: right;
      border: 1px solid black;
   }
   .naviVar{
        margin-top: 5px;
      height: 70px;
      line-height: 70px;
      border: 1px solid black;
      text-align: left;
   }
   a{
      text-decoration: none;
      font-family: inherit;
      color: black;
   }
   .naviVar span{
      margin: 0 10px;
   }
   .banner_wrap{
      margin-top: 10px;
      height: 350px;
   }
   .banner{
      margin: 0 auto;
      width: 1200px;
      height: 350px;
      text-align: center;
      border: 1px solid black;
   }
   .banner_image{
      display: inline-block;
      float: left;
      height: 350px;
      border: 1px solid black;
   }
   .btn1{
      display: inline-block;
      margin-right: 50px;
      margin-top: 280px;
      float: right;
      width: 180px;
      height: 50px;
      line-height: 50px;
      border: 1px solid black;
      border-radius: 15px;
   }
   .summary{
      margin: 10px auto;
      padding: 5px 5px 0 5px;
      width: 1200px;
      border-bottom: 1px solid #ccc;
   }
   .footer{
      background: black;
      height: 220px;
   }
   .footer_section{
      margin: 0 auto;
      padding: 50px 0;
      width: 1200px;
   }
   .footer_inner{
     width: 800px;
      color: white;
   }
   .area_search{
      width: 230px;
      height: 45px;
      line-height: 45px;
      text-align: center;
      border: 1px solid white;
   }
   .area_info{
      margin-top: 10px;
      color: #999;
   }
</style>
</head>
<body>
   <div class="header_wrap">
      <div class="inline_section">
         <div class="inline_section_left"><div style="text-align: left;">스터디 카페</div></div>
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
   
   <div class="footer">
      <div class="footer_section">
         <div class="footer_inner">
            <div class="area_search">
               <a style="color: white;" href="#">스터디카페 햇반점@</a>
            </div>
            <div class="area_info">
               송준호 | 조종범 | 금도윤 | 신성주 | 변종서 | 윤원영 | 민은기
            </div>
         </div>
      </div>
   </div>
</body>
</html>