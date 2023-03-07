<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="conPath" value="<%=request.getContextPath()%>"/>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
</head>
<body>


	<h2>예약이 확정되었습니다</h2>


<h4>예약자명 : ${param.u_name} </h4>
<h4>예약날자 : ${param.rs_date} </h4>
<h4>예약시간 : 
<c:if test="${not empty param.rs_time1}"></c:if> ${param.rs_time1}
<c:if test="${not empty param.rs_time2}"></c:if> ${param.rs_time2}
<c:if test="${not empty param.rs_time3}"></c:if> ${param.rs_time3}
<c:if test="${not empty param.rs_time4}"></c:if> ${param.rs_time4}
<c:if test="${not empty param.rs_time5}"></c:if> ${param.rs_time5}
<c:if test="${not empty param.rs_time6}"></c:if> ${param.rs_time6}
</h4>
<h4>가격 : ${param.rs_price} </h4>

<h2> Notice </h2>
<h3> 결제는 현장에서 진행됩니다. </h3>



<a href="<%=request.getContextPath()%>">HOME</a>
	
	
	
	
	
	
</body>
</html>