<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath"  value="${pageContext.request.contextPath}"/>

<br/>
<br/>
<br/>
<br/>
<div style="border: solid black 1px;">
	<h3>장바구니</h3>
	<div>
	<c:if test="${empty cartList}">
	장바구니가 비어있습니다
	</c:if>
	<c:if test="${not empty cartList}">
	<form name="cart" action="#" method="post">
<table class="cartTable">
<c:forEach var="cartList" items="${cartList}">
	<tr>
		<th>${cartList.food_name}</th>
		<th class="right">
		<a href="${conPath}/food/deleteCart?food_no=${cartList.food_no}">
			<img src="${conPath}/resources/assets/icon/food/x-lg.svg"/>
		</a>
		</th>
	</tr>
	<tr>
		<td>
		<a href="${conPath}/food/changeQ?pm=0&food_no=${cartList.food_no}">
		<img src="${conPath}/resources/assets/icon/food/dash-square.svg"/>
		</a>
		 ${cartList.quantity} 
		<a href="${conPath}/food/changeQ?pm=1&food_no=${cartList.food_no}">
		<img src="${conPath}/resources/assets/icon/food/plus-square.svg"/>
		</a>
		</td>
		<td class="right">${cartList.food_price * cartList.quantity}</td>
	</tr>
</c:forEach>
</table>
<button type="button" onclick="location.href='${conPath}'">주문하기</button>
</form>
</c:if>
</div>
</div>

</html>