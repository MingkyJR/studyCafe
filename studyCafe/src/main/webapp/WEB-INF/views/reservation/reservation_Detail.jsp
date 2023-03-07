<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<meta charset="UTF-8">
<title>예약 상세페이지</title>
<script type="text/javascript">
const config = {
		dateFormat: 'yy-mm-dd',
		showOn : "button",
		buttonText:"날짜 선택",
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    yearSuffix: '년',
        changeMonth: true,
        changeYear: true,
        minDate : +1,
        maxDate : +30,
        onSelect: function(dateText, inst) {
        	console.log(dateText);
  	
       	$.ajax({
        		type:'POST',
        		url: '${conPath}/timeCheck',
        	    data:{rs_date:dateText},//서버로 전송할 데이터. 예){name:"홍GD"}
        	    success:function(data,status,xhr){//정상응답후 호출되는 함수
        	         //data: 서버로부터 응답받은 내용
        	         //status: 응답코드 , /xhr: xhr헤더
        	         //서버로부터 응답받은 내용 책제목 목록인 data변수값을  JSON으로 변환
        	      let jsonInfo = JSON.parse(data);
        	      console.log(jsonInfo.time);
        	      

        	      
         	      if(jsonInfo.time == undefined ){
        	    	  $('input:checkbox').prop("disabled",false);
        	      } else {

	               	     if(jsonInfo.time.rs_time1 == "" ){
	             	    	  $('input:checkbox[id="rs_time1"]').prop('disabled',false);
	             	      } else{
	             	    	  $('input:checkbox[id="rs_time1"]').prop("disabled",true);
	             	      };
        	    	  
	               	     if(jsonInfo.time.rs_time2 == "" ){
	               	    	  $('input:checkbox[id="rs_time2"]').prop('disabled',false);
	               	      } else{
	               	    	  $('input:checkbox[id="rs_time2"]').prop("disabled",true);
	               	      };
	               	      
	               	     if(jsonInfo.time.rs_time3 == "" ){
	               	    	  $('input:checkbox[id="rs_time3"]').prop('disabled',false);
	               	      } else{
	               	    	  $('input:checkbox[id="rs_time3"]').prop("disabled",true);
	               	      };
						
	               	     if(jsonInfo.time.rs_time4 == "" ){
	               	    	  $('input:checkbox[id="rs_time4"]').prop('disabled',false);
	               	      } else{
	               	    	  $('input:checkbox[id="rs_time4"]').prop("disabled",true);
	               	      };
		               	      
	               	     if(jsonInfo.time.rs_time5 == "" ){
	               	    	  $('input:checkbox[id="rs_time5"]').prop('disabled',false);
	               	      } else{
	               	    	  $('input:checkbox[id="rs_time5"]').prop("disabled",true);
	               	      };
	               	      
	               	     if(jsonInfo.time.rs_time5 == "" ){
	               	    	  $('input:checkbox[id="rs_time5"]').prop('disabled',false);
	               	      } else{
	               	    	  $('input:checkbox[id="rs_time5"]').prop("disabled",true);
	               	      };
        	      }

        	       
   
        	      },error:function(xhr,status,error){
        	       //오류발생시 호출되는 함수
        	       //응답을 받지 못하거나, 데이터형식을 확인하지 못할 때 호출
        	       //에러코드 => xhr.status       //예)404
        	       //에러메세지=>xhr.responseText
        	       
        	       alert("에러가 발생했습니다");
        	      }

        	      
        	    });//ajax끝    
        	    

        	}

}

$(function() {
	  $("input[name='rs_date']").datepicker(config);
	});

$(document).ready(function() {
	
	$("input:checkbox").on("click",function(){
		if(!$('#rs_date').val()){
			alert('날짜를 먼저 선턱해야 합니다');
			$("input:checkbox").prop("checked", false);
		}
	})
	
	$("input:checkbox").on("click",function(){
		var sum = $("input:checkbox:checked").length
		var price = sum*5000;
		
		$('input[name=rs_price]').attr('value',price);
	})
	

	
	
    }); 

</script>
</head>
<body>
	<h2>예약 상세페이지입니다</h2>
	
	
	<hr/>
	<form action="${contextPath}/scafe/reservationSuccess" method="post" >
	
	<!-- 회원세션을 아직 안받아와서 히든으로 임시 파라미터 주는중  -->
	<input type="hidden" name="user_number" value="999"/>
	<input type="hidden" name="r_number" value="999"/>
	<input type="hidden" name="u_name" value="TEST"/>
	<input type="hidden" name="r_price" value="5000"/>
	<input type="hidden" name="u_tell" value="999"/>
	
	<h3>날짜 선택</h3>
	<input id="rs_date" name="rs_date" autocomplete="off" readonly="readonly" >
	
	<h3>시간 선택</h3>
	<input type="checkbox" id ="rs_time1" name="rs_time1" value="09:00~11:00" > 09:00~11:00 <br/>
	<input type="checkbox" id ="rs_time2" name="rs_time2" value="11:00~13:00" > 11:00~13:00 <br/>
	<input type="checkbox" id ="rs_time3" name="rs_time3" value="13:00~15:00" > 13:00~15:00 <br/>
	<input type="checkbox" id ="rs_time4" name="rs_time4" value="15:00~17:00" > 15:00~17:00 <br/>
	<input type="checkbox" id ="rs_time5" name="rs_time5" value="17:00~19:00" > 17:00~19:00 <br/>
	<input type="checkbox" id ="rs_time6" name="rs_time6" value="19:00~21:00" > 19:00~21:00 <br/>
	
	<h3>가격</h3>
	<input type="text" id="rs_price" name="rs_price" value="" readonly="readonly">
	<br/>
	<div>
	<input type="submit" value="예약하기">
	</div>
	</form>
</body>
</html>