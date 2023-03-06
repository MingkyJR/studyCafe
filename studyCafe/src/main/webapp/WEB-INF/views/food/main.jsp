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
		border-bottom: 1px solid #ccc;
	}
	
	div.desc {
		padding: 2px;
		text-align: center;
	}
	.menu {
		display: inline-block;
		margin: 15px;
		width: 130px;
		height: 40px;
		line-height: 40px;
		text-align: center;
		border-radius: 20px;
		background-color: #aaa;
	}
	.menu a {
		text-decoration: none;
		color: white;
	}
</style>
</head>
<body>
	<div class="summary">
	<h3 style="text-align: center;">스터디카페 먹거리 주문</h3>
	<div class="menu" style="background-color: #FFE08C">
		<a href="${contextPath}/food/main" style="color: black;">전체</a>
	</div>
	<div class="menu">
		<a href="${contextPath}/food/main?type=1">식사류</a>
	</div>
	<div class="menu">
		<a href="${contextPath}/food/main?type=2">라면류</a>
	</div>
	<div class="menu">
		<a href="${contextPath}/food/main?type=3">음료(캔)</a>
	</div>
	<div class="menu">
		<a href="${contextPath}/food/main?type=4">음료(카페)</a>
	</div>
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