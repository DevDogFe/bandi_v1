<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>비밀번호 찾기</h3>
	<form action="/findPwd" method="post">		
		<input type="text" name="username" placeholder="이름" value="hyo">
		<input type="text" name="email" placeholder="이메일입력하세요" value="khl4459@naver.com">
		<button type="submit">전송</button>	
	</form>
</body>
</html>