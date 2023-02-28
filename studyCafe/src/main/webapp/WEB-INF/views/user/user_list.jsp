<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
</head>
<body>
http://localhost:8083/app/member/list
  <h3>회원목록(memberList.jsp)</h3>
  ${memberList}<hr/>
   <table border="1">
      <thead>
         <tr>
            <th>id</th><th>passwd</th><th>name</th><th>gender</th><th>regdate</th>
         </tr>
      </thead>
      <tbody>
         <c:forEach items="${memberList}" var="member" >
            <tr>
               <td><a href="<%=request.getContextPath()%>/member/info?memberid=${member.id}">${member.id}</a></td>
               <td>${member.passwd}</td>
               <td>${member.name}</td>
               <td>${member.gender}</td>
               <td>${member.regdate}</td>
            </tr>
         </c:forEach>
      </tbody>
   </table>
</body>
</html>



