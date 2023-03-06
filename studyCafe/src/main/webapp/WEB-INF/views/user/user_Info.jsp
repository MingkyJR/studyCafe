<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h3>memberInfo.jsp</h3>
  <hr/>
  ${member}
  <ul>
   <li>id:${u.id}</li>
   <li>password:${u_passwd}</li>
   <li>name:${u_name}</li>
   <li>gender:${u_gender}</li>
   <li>credate:${u_credate}</li>
   </ul>
   <span><a href="<%=request.getContextPath()%>/user/update?u_id=${u_id}">비번수정</a></span>
</body>
</html>





