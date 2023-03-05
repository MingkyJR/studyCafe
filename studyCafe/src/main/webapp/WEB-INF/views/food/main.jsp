<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<style>
div.product {
		display: inline-block;
		margin: 5px 5px;
		border: 1px solid #ccc;
		overflow: hidden;
		border-radius: 10px;
		width: 270px;
	}
	
	div.product:hover {
		border: 1px solid #777;
	}
	
	div.product img {
		width: 100%;
		height: 200px;
	}
	
	div.desc {
		padding: 2px;
		text-align: center;
	}
</style>
</head>
<body>
	<div class="summary">
	<h3>스터디카페 먹거리 주문</h3>
	<a href="${contextPath}/food/main">전체</a>
	<a href="${contextPath}/food/main?type=1">식사류</a>
	<a href="${contextPath}/food/main?type=2">라면류</a>
	<a href="${contextPath}/food/main?type=3">음료(캔)</a>
	<a href="${contextPath}/food/main?type=4">음료(카페)</a>
	</div>
	<div class="summary">
	<c:forEach var="list" items="${list}">
		<div class="product">
	  		<a href="${contextPath}/food/addCart?food_no=${list.food_no}&type=${type}">
	    		<img src="${contextPath}/resources/assets/images/food/${list.fileName}" alt="food image" width="600" height="300">
	 		</a>
		<div class="desc">${list.food_name}</div>
		<div class="desc">${list.food_price}</div>
		</div>
	</c:forEach>
	</div>
</body>
</html>