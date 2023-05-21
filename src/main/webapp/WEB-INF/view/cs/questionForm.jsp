<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/qna/write" method="post">
		<input type="text" name="title">
		<br>
		<select name="faqCategoryId" >
			<option value="0">카테고리</option>
			<c:forEach var="category" items="${faqCategorylist}">			
			<option value="${category.id}">${category.categoryName}</option>
			</c:forEach>
		</select>
		<br>
		<textarea rows="50" cols="50" name="content"></textarea>
		<br>
		<button type="submit">질문하기</button>
	</form>


</body>
</html>