<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
	<form action="/report/reportPopup" method="post">
		<input type="hidden" name="boardId" value="${boardId}">
		<label>신고사유</label>
		<c:forEach var="reportCategory" items="${reportCategory}">
			<div class="form-check">
				<input class="form-check-input" type="radio" id="flexRadioDefault1"> 
				<label class="form-check-label" for="flexRadioDefault1"><input type="hidden" name="categoryId" value="${reportCategory.id}"> ${reportCategory.categoryName}</label>
			</div>
		</c:forEach>
		<div class="mb-3">
			<label for="exampleFormControlTextarea1" class="form-label">내용</label><br>
			<textarea class="form-control" id="exampleFormControlTextarea1" rows="5" name="content"></textarea>
		</div>
		<button type="submit" class="btn btn-primary">신고하기</button>
	</form>
	<script>
		function f
	</script>
</body>
</html>