<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
</head> 
<body>
http://localhost:8083/app/main
/views/user/main.jsp문서
  <h2>${greeting}</h2>
  <hr/>
  <ul> 
   	<li><a href="user/user_add">회원가입(상대주소)</a></li>
   	<li><a href="<%=request.getContextPath()%>/user/user_add">회원가입(절대주소)</a></li>
  </ul>
</body>
</html>














