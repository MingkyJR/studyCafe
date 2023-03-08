<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath"  value="${pageContext.request.contextPath}"/>
<c:set var ="total" value="0"/>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<br/>
<br/>
<br/>
<br/>
<div style="border: solid black 1px;">
	<div style="padding: 7px; border-bottom: 1px solid black; background-color: #666699; color: white;"><h4 style="margin:0; text-align: center;">주문 목록</h4></div>
	<div>
	<c:if test="${empty cartList}">
	주문 목록이 비어있습니다
	</c:if>
	<c:if test="${not empty cartList}">
<table class="cartTable">
<c:forEach var="cartList" items="${cartList}">
	<tr>
		<th>${cartList.food_name}</th>
		<th class="right">
		<a href="${conPath}/food/deleteCart?food_no=${cartList.food_no}&type=${type}"> <!-- 삭제버튼 -->
			<img src="${conPath}/resources/assets/icon/food/x-lg.svg"/>
		</a>
		</th>
	</tr>
	<tr>
		<td>
		<c:if test="${cartList.quantity == 1}">
			<img src="${conPath}/resources/assets/icon/food/dash-square.svg"/> <!-- -버튼 -->
		</c:if>
		<c:if test="${cartList.quantity != 1}">
			<a href="${conPath}/food/changeQ?pm=0&food_no=${cartList.food_no}&type=${type}">
				<img src="${conPath}/resources/assets/icon/food/dash-square.svg"/> <!-- -버튼 -->
			</a>
		</c:if>
		 ${cartList.quantity} 
		<a href="${conPath}/food/changeQ?pm=1&food_no=${cartList.food_no}&type=${type}">
		<img src="${conPath}/resources/assets/icon/food/plus-square.svg"/> <!-- +버튼 -->
		</a>
		</td>
		<td class="right">${cartList.food_price * cartList.quantity}</td>
	</tr>
	<c:set var="total" value="${total+cartList.food_price * cartList.quantity}"/>
</c:forEach>
</table>
<div>
	<button class="payBtn" onclick="requestPayKakao()">결제하기</button>
</div>
<div style="height: 80px; line-height: 80px;"><span style="margin-left: 10px;">합계 :<c:out value="${total}"/>원</span></div>
</c:if>
</div>
</div>
<script>
var time = new Date();
var year = time.getFullYear(); // 년도
var month = ('0' + (time.getMonth() + 1)).slice(-2);  // 월
var date = ('0' + time.getDate()).slice(-2);
var hours = ('0' + time.getHours()).slice(-2); 
var minutes = ('0' + time.getMinutes()).slice(-2);
var seconds = ('0' + time.getSeconds()).slice(-2);

var orderTime = year+month+date+hours+minutes+seconds;

const IMP = window.IMP; // 생략 가능
IMP.init("imp86313206");
  
function requestPayKG() {
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: "SC"+orderTime+"${u_number}",
        name: "스터디카페 햇반",
        amount: "${total}",
        buyer_email: "",
        buyer_name: "홍길동",
        buyer_tel: "010-4242-4242",
        buyer_addr: "서울특별시 강남구 신사동",
        buyer_postcode: "01181"
    }, function (rsp) { // callback
        if (rsp.success) {
            // 결제 성공 시 로직
        	alert("결제가 완료되었습니다.");
            location.href='http://localhost:8081/scafe/food/order?order_no='+rsp.merchant_uid+'&order_price='+${total};
        } else {
            // 결제 실패 시 로직
            
        }
    });
  }
function requestPayKakao() {
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param
        pg: "kakaopay",
        pay_method: "card",
        merchant_uid: "SC"+orderTime+"${u_number}",
        name: "스터디카페 햇반",
        amount: "${total}",
        buyer_email: "",
        buyer_name: "홍길동",
        buyer_tel: "010-4242-4242",
        buyer_addr: "서울특별시 강남구 신사동",
        buyer_postcode: "01181"
    }, function (rsp) { // callback
        if (rsp.success) {
            // 결제 성공 시 로직
            alert("결제가 완료되었습니다.");
            location.href='http://localhost:8081/scafe/food/order?order_no='+rsp.merchant_uid+'&order_price='+${total};
        } else {
            // 결제 실패 시 로직
            alert("결제가 취소되었습니다.");
            
        }
    });
  }
</script>

</html>