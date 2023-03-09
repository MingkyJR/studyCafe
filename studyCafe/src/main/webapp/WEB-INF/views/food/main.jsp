<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>    
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	div.desc {
		padding: 2px;
		text-align: center;
	}
</style>

</head>
<body>
	<div class="summary">
	<h3 style="text-align: center;">스터디카페 먹거리 주문</h3>
	</div>
	<div class="summary">
	<div id="myBtnContainer">
  <button class="btn active" onclick="filterSelection('all')"> 전체</button>
  <button class="btn" onclick="filterSelection('meals')"> 식사류</button>
  <button class="btn" onclick="filterSelection('ramens')"> 라면류</button>
  <button class="btn" onclick="filterSelection('candrinks')"> 음료(캔)</button>
  <button class="btn" onclick="filterSelection('cafedrinks')"> 음료(카페)</button>
	</div>
	<div class="container">
	<div id="foodList"></div>
	</div>
	</div>
<script>

window.onload = function() {
    var allBtn = document.querySelector(".filter-btns .btn:first-child");
    allBtn.classList.add("active");
    filterSelection("all");
  };

filterSelection("all")
function filterSelection(c) {
  var x, i;
  x = document.getElementsByClassName("filterDiv");
  if (c == "all") c = "";
  for (i = 0; i < x.length; i++) {
    w3RemoveClass(x[i], "show");
    if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
  }
}

function w3AddClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    if (arr1.indexOf(arr2[i]) == -1) {element.className += " " + arr2[i];}
  }
}

function w3RemoveClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    while (arr1.indexOf(arr2[i]) > -1) {
      arr1.splice(arr1.indexOf(arr2[i]), 1);     
    }
  }
  element.className = arr1.join(" ");
}

// Add active class to the current button (highlight it)
var btnContainer = document.getElementById("myBtnContainer");
var btns = btnContainer.getElementsByClassName("btn");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function(){
    var current = document.getElementsByClassName("active");
    current[0].className = current[0].className.replace(" active", "");
    this.className += " active";
  });
}


</script>
<script>
$(document).ready(function() {
	$.ajax({
	    url: "${contextPath}/food/mainC",
	    method: "POST",
	    success: function(data) {
	        var list = data.list;
	        console.log(list);
	        var cartList = data.cartList;
	        var u_number = data.u_number;
	        var html = "";
	        for (var i = 0; i < list.length; i++) {
	          html += "<div class='filterDiv " + list[i].type + "'>";
	          html += "<a href='${contextPath}/food/addCart?food_no=" + list[i].food_no + "'>";
	          html += "<img src='${contextPath}/resources/assets/images/food/" + list[i].fileName + "' alt='food image' width='600' height='300'>";
	          html += "</a>";
	          html += "<div class='desc'>" + list[i].food_name + "</div>";
	          html += "<div class='desc'>" + list[i].food_price + "원</div>";
	          html += "</div>";
	        }
	        $("#foodList").html(html);
	        
	     // display cart items
	        html = "";
	        for (var i = 0; i < cartList.length; i++) {
	          html += "<tr>";
	          html += "<td>" + cartList[i].food_name + "</td>";
	          html += "<td class='right'>";
	          html += "<a href='${contextPath}/food/deleteCart?food_no=" + cartList[i].food_no + "'>";
	          html += "<img src='${contextPath}/resources/assets/icon/food/x-lg.svg'/>";
	          html += "</a>";
	          html += "</td>";
	          html += "</tr>";
	          html += "<tr>";
	          html += "<td>";
	          if (cartList[i].quantity == 1) {
	            html += "<img src='${contextPath}/resources/assets/icon/food/dash-square.svg'/>";
	          } else {
	            html += "<a href='${contextPath}/food/changeQ?pm=0&food_no=" + cartList[i].food_no + "'>";
	            html += "<img src='${contextPath}/resources/assets/icon/food/dash-square.svg'/>";
	            html += "</a>";
	          }
	          html += cartList[i].quantity;
	          html += "<a href='${contextPath}/food/changeQ?pm=1&food_no=" + cartList[i].food_no + "'>";
	          html += "<img src='${contextPath}/resources/assets/icon/food/plus-square.svg'/>";
	          html += "</a>";
	          html += "</td>";
	          html += "<td class='right'>" + (cartList[i].food_price * cartList[i].quantity) + "</td>";
	          html += "</tr>";
	        }
	        $("#cartList").html(html);
	        
	     // display total price
	        var total = 0;
	        for (var i = 0; i < cartList.length; i++) {
	          total += cartList[i].food_price * cartList[i].quantity;
	        }
	        $("#totalPrice").text(total);
	    },
	    error: function(){
	    	alert("error")
	    }
	});
});
</script>
</body>
</html>