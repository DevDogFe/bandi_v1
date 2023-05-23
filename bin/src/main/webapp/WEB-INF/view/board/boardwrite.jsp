<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
	<h1>게시판</h1>
	<div class="mb-3">
		<label for="exampleFormControlInput1" class="form-label">제목</label> <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="제목을 입력하세요">
	</div>
	
	<select class="form-select" aria-label="Default select example">
		<option selected>종류</option>
		<c:forEach var="categorylist" items="${categorylist}">
			<option value="${categorylist.id}">${categorylist.categoryName}</option>
		</c:forEach>
	</select>
	<br>
	<div class="mb-3">
		<label for="exampleFormControlTextarea1" class="form-label">내용</label>
		<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="내용을 입력하세요"></textarea>
	</div>
</body>
</html>