<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li>${application.title}</li>
		<li>${application.content}</li>
		<li>${application.username}</li>
		<li>${application.tel}</li>
		<li>${application.createdAt()}</li>
	</ul>

</body>
</html>