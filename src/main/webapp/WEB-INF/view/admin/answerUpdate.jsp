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

	<form action="/admin/answer/update/${question.id}" method="post">
		<textarea rows="50" cols="50" name="content">${answer.content}</textarea>
		<button type="submit">수정완료</button>
		${answer.createdAt}
	</form>

</body>
</html>