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
	<h3>주문 목록</h3>
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
<button onclick="requestPayKakao()">결제하기</button> 합계 :<c:out value="${total}"/>원
</c:if>
</div>
</div>
<script>
const IMP = window.IMP; // 생략 가능
IMP.init("imp86313206");
  
function requestPayKG() {
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: "USDK123123",
        name: "스터디카페 햇반",
        amount: "${total}",
        buyer_email: "gildong@gmail.com",
        buyer_name: "홍길동",
        buyer_tel: "010-4242-4242",
        buyer_addr: "서울특별시 강남구 신사동",
        buyer_postcode: "01181"
    }, function (rsp) { // callback
        if (rsp.success) {
            // 결제 성공 시 로직
        	var msg = '결제가 완료되었습니다.';
            location.href='scafe/food/success';
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
        merchant_uid: "USDK177123",
        name: "스터디카페 햇반",
        amount: "${total}",
        buyer_email: "gildong@gmail.com",
        buyer_name: "홍길동",
        buyer_tel: "010-4242-4242",
        buyer_addr: "서울특별시 강남구 신사동",
        buyer_postcode: "01181"
    }, function (rsp) { // callback
        if (rsp.success) {
            // 결제 성공 시 로직
        	var msg = '결제가 완료되었습니다.';
            location.href='http://localhost:8081/scafe/food/success';
        } else {
            // 결제 실패 시 로직
            
        }
    });
  }
</script>

</html>