<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>먹거리 주문</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<style>
div.product {
		display: inline-block;
		margin: 5px 5px;
		border: 1px solid #ccc;
		overflow: hidden;
		border-radius: 10px;
		width: 250px;
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
	#content{
	position: absolute;
	display: none;
} 
	}
</style>
</head>
<body>
	<h3>스터디카페 먹거리 주문</h3>
	<div>
	<a href="${contextPath}/food/main">전체</a>
	<a href="#">식사류</a>
	<a href="#">라면류</a>
	<a href="#">음료(캔)</a>
	<a href="${contextPath}/food/main?type=4">음료(카페)</a>
	</div>
	<c:forEach var="list" items="${list}">
		<div class="product">
	  		<a href="${contextPath}">
	    		<img src="${contextPath}/resources/assets/images/food/${list.fileName}" alt="Cinque Terre" width="600" height="300">
	 		</a>
		<div class="desc">${list.food_name}</div>
		<div class="desc">${list.food_price}원</div>
		</div>
	</c:forEach>
</body>
</html>