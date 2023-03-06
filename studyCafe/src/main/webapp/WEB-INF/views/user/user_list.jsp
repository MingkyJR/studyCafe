<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원목록</title>
<%@ include file="../include/user_header.jsp" %>
</head>
<body>
<%@ include file="../include/user_menu.jsp" %>
  <h3>회원목록</h3>
  	<input type="button" value="회원등록" onclick="location.href='${path}/user/user_add.do'">
   <table border="1">
         <tr>
         	<th>회원번호</th>
            <th>아이디</th>
            <th>이름</th>
            <th>전화번호</th>
            <th>성별</th>
            <th>회원가입일</th>
         </tr>
         <c:forEach items="${user_list}" var="row">
         <tr>
         	  <td>${row.u_id}</td>
         		<!-- 회원정보 상세조회를 위한 a태그 -->
               <td><a href="<%=request.getContextPath()%>/user/info?u_id=${u_id}">${u_id}</a></td>
               <td>${u_number}</td> <!-- 회원번호 -->
        	   <td>${u_id}</td>  <!-- 아이디 -->
        	   <td>${u_name}</td>  <!-- 이름 -->
        	   <td>${u_tell}</td>  <!-- 전화번호 -->
               <td>${u_gender}</td>  <!-- 성별 -->
               <td>${u_credate}</td>  <!-- 회원가입일자 -->
         </tr>
         </c:forEach>
   </table>
</body>
</html>



