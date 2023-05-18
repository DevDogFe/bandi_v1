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

	<c:choose>
		<c:when test="${answer == null}">
			<form action="/admin/answer/${question.id}" method="post">
				<textarea rows="20" cols="50" name="content"></textarea>
				<button>답변등록</button>
			</form>
		</c:when>
		<c:otherwise>
			<h3>답변</h3>
			<ul>
				<li>${answer.content}</li>
				<li>${answer.createdAt}</li>
			</ul>
			<a href="/admin/answer/update/${question.id}">수정</a>
			<a href="/admin/answer/delete/${question.id}">삭제</a>
		</c:otherwise>
	</c:choose>


</body>
</html>