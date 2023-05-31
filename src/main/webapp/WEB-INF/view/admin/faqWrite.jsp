<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	질문 답변 카테고리
	<form action="/admin/faq" method="post">
		<select name="faqCategoryId">
			<c:forEach var="category" items="${faqCategoryList}">
				<option value="${category.id}">${category.categoryName}</option>
			</c:forEach>
		</select>
		<br>
		<label for="question"> 질문 : <input type="text" id="question" name="question">
		</label>
		 <br>
		<label for="answer"> 답 : <input type="text" id="answer" name="answer">
		</label>
		<button>등록</button>
	</form>

</body>
</html>