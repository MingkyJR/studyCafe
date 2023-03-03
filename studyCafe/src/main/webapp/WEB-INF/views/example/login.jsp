<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<%=request.getContextPath() %>/logined">
	<input type="text" id="u_id" name="u_id" />
	<input type="text" id="u_pass" name="u_pass" />
	<input type="submit" value="로그인" />
	
</form>
</body>
</html>