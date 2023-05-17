<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<ul>
	<li>${question.title}</li>
	<li>${question.categoryName}</li>
	<li>${question.username}</li>
	<li>${question.content}</li>
	<li>${question.proceed}</li>
	<li>${question.createdAt()}</li>	    
	</ul>
	
	<form action="#" method="post">
		<textarea rows="20" cols="50"></textarea>
		<button>답변등록</button>
	</form>


</body>
</html>