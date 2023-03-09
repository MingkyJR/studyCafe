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
	<button class="deleteCart"> test</button>
	<button class="test"> test</button>
	<div class="container">
	<c:forEach var="list" items="${list}">
		<div class="filterDiv ${list.type}" >
			<button class="addcart" data-food-no="${list.food_no}"> add to cart</button>
	  		<a href="${contextPath}/food/addCart?food_no=${list.food_no}">
	    		<img src="${contextPath}/resources/assets/images/food/${list.fileName}" alt="food image" width="600" height="300">
	 		</a>
		<div class="desc">${list.food_name}</div>
		<div class="desc">${list.food_price}원</div>
		</div>
	</c:forEach>
	</div>
	</div>
<script>
$(document).ready(function() {
	var total = 0;
	
	$.ajax({
	    url: "${contextPath}/food/mainC",
	    method: "POST",
	    success: function(data) {
	        var cartList = data.cartList;
	        var u_number = data.u_number;
	     // display cart items
	     	displayCart(cartList);
	        
	     // display total price
	        
	        for (var i = 0; i < cartList.length; i++) {
	          total += cartList[i].food_price * cartList[i].quantity;
	        }
	        $("#totalPrice").text(total);
	    },
	    error: function(){
	    	alert("error")
	    }
	});
	
	


	$('.addcart').on('click', function() {
	    var food_no = $(this).data('food-no');
	    $.ajax({
	      url: '${contextPath}/food/addCart',
	      type: 'POST',
	      data: {
	        food_no: food_no
	      },
	      success: function(result) {
	        var cartList = result.cartList;
	        displayCart(cartList);
		        
		     // display total price
		        //var total = 0;
		        for (var i = 0; i < cartList.length; i++) {
		          total += cartList[i].food_price * cartList[i].quantity;
		        }
		        $("#totalPrice").text(total);
		        total = 0;
	      },
	      error: function(xhr, status, error) {
	        alert('이미 추가되어있습니다');
	      }
	    });
	  });//addCart 버튼 끝
	
	
	/* 삭제 */
	$(document).on('click','.deleteCart', function() {
	    var food_no = $(this).data('food-no');
	    $.ajax({
	      url: '${contextPath}/food/deleteCart',
	      type: 'POST',
	      data: {
	        food_no: food_no
	      },
	      success: function(result) {
	        var cartList = result.cartList;
	        displayCart(cartList);
		        
		     // display total price
		        //var total = 0;
		        for (var i = 0; i < cartList.length; i++) {
		          total += cartList[i].food_price * cartList[i].quantity;
		        }
		        $("#totalPrice").text(total);
		        total = 0;
	      },
	      error: function(xhr, status, error) {
	        alert('삭제하지 못했습니다.');
	      }
	    });
	  }); // 삭제버튼 끝
	  
	  $(document).on('click','.changeCart', function() {
		    var food_no = $(this).data('food-no');
		    var pm = $(this).data('food-pm');
		    $.ajax({
		      url: '${contextPath}/food/changeQ',
		      type: 'POST',
		      data: {
		        food_no: food_no,
		        pm: pm
		      },
		      success: function(result) {
		        var cartList = result.cartList;
		        displayCart(cartList);
			        
			     // display total price
			       // var total = 0;
			        for (var i = 0; i < cartList.length; i++) {
			          total += cartList[i].food_price * cartList[i].quantity;
			        }
			        $("#totalPrice").text(total);
			        total = 0;
		      },
		      error: function(xhr, status, error) {
		        alert('삭제하지 못했습니다.');
		      }
		    });
		  }); // 수량변경버튼 끝
	
	
	    function displayCart(cartList){
	    		var html = "";
		        for (var i = 0; i < cartList.length; i++) {
		          html += "<div style='width : 100%;'>";
		          html += "<td>" + cartList[i].food_name + "</td>";
		          html += "<td class='right'>";
		          html += "<span class='deleteCart' data-food-no='"+ cartList[i].food_no + "' style='float : right;'>";
		          html += "<img src='${contextPath}/resources/assets/icon/food/x-lg.svg'/>";
		          html += "</span>";
		          html += "</td>";
		          html += "</div>";
		          html += "<div style='width : 100%;'>";
		          html += "<td>";
		          if (cartList[i].quantity == 1) {
		            html += "<img src='${contextPath}/resources/assets/icon/food/dash-square.svg'/>";
		          } else {
		            html += "<span class='changeCart' data-food-no='"+ cartList[i].food_no + "' data-food-pm='0'>";
		            html += "<img src='${contextPath}/resources/assets/icon/food/dash-square.svg'/>";
		            html += "</span>";
		          }
		          html += cartList[i].quantity;
		          html += "<span class='changeCart' data-food-no='"+ cartList[i].food_no + "' data-food-pm='1'>";
		          html += "<img src='${contextPath}/resources/assets/icon/food/plus-square.svg'/>";
		          html += "</span>";
		          html += "</td>";
		          html += "<span class='right'>" + (cartList[i].food_price * cartList[i].quantity) + "</span>";
		          html += "</div>";
		        }
		        $("#cartList").html(html);
	    	};
});//ready 끝
</script>
<script>
filterSelection("all")
function filterSelection(c) {
  var x, i;
  x = document.getElementsByClassName("filterDiv");
  if (c == "all") c = "";
  // Add the "show" class (display:block) to the filtered elements, and remove the "show" class from the elements that are not selected
  for (i = 0; i < x.length; i++) {
    w3RemoveClass(x[i], "show");
    if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
  }
}

// Show filtered elements
function w3AddClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    if (arr1.indexOf(arr2[i]) == -1) {
      element.className += " " + arr2[i];
    }
  }
}

// Hide elements that are not selected
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

// Add active class to the current control button (highlight it)
var btnContainer = document.getElementById("myBtnContainer");
var btns = btnContainer.getElementsByClassName("btn");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function() {
    var current = document.getElementsByClassName("active");
    current[0].className = current[0].className.replace(" active", "");
    this.className += " active";
  });
}

</script>

</body>
</html>