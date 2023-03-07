<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
 
<c:set var="conPath" value="<%=request.getContextPath()%>"/>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약확인창</title>
</head>
<body>

	<h2>예약 확인</h2>

  <c:forEach var="data" items="${list}">
  <h3>예약자명 : ${data.u_name}</h3>
  <h3>예약날짜 : <fmt:formatDate pattern="yyyy.MM.dd" value="${data.rs_date}"/></h3>
  <h3>예약시간 : ${data.rs_time1} ${data.rs_time2} ${data.rs_time3} ${data.rs_time4} ${data.rs_time5} ${data.rs_time6}</h3>
  <h3>가격 : ${data.rs_price}원(현장결제)</h3>
   <br/>	
  </c:forEach> 

</body>
</html>