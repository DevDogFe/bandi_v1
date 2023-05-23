<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="/qna/question/update/${question.id}">수정</a>
	<a href="/qna/question/delete/${question.id}">삭제</a>

	<ul>
	<li>${question.title}</li>
	<li>${question.categoryName}</li>
	<li>${question.username}</li>
	<li>${question.content}</li>
	<li>${question.createdAt()}</li>	    
	</ul>


</body>
</html>