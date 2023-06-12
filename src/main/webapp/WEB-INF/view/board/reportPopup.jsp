<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="/assets/css/registration.css" />
<link rel="stylesheet" href="/assets/css/board/boardReport.css" />
</head>
<body>
	<form class="form" action="/report/reportPopup" method="post">
		<input type="hidden" name="boardId" value="${boardId}">
		<label>신고사유</label>
		<c:forEach var="reportCategory" items="${reportCategory}">
			<div class="radio-group">
				<label class="radio">
					<input type="radio" value="${reportCategory.id}" name="categoryId">${reportCategory.categoryName}
				</label>
				<span></span>
			</div>
		</c:forEach>
		<div class="form-group">
			<textarea id="overview" name="content" class="textarea" required="required" rows="5" placeholder="신고사유를 입력하세요."></textarea>
		</div>
		<div class="btn">
			<button type="submit" class="btn-report">신고하기</button>
		</div>
	</form>
</body>
</html>