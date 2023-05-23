<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="#" method="post">
		<input type="text" name="title" value="${question.title}"> <select name="faqCategoryId">
			<option value="0">카테고리</option>
			<c:forEach var="category" items="${faqCategorylist}">
				<c:choose>
					<c:when test="${category.id == question.faqCategoryId}">
						<option selected="selected"  value="${category.id}">${category.categoryName}</option>
					</c:when>
					<c:otherwise>
						<option value="${category.id}">${category.categoryName}</option>					
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</select> <br>
		<textarea rows="50" cols="50" name="content">${question.content}</textarea>
		<br>
		<button type="submit">수정완료</button>
	</form>

</body>
</html>