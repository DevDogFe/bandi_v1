<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<div class="mb-3">
		<label for="exampleFormControlInput1" class="form-label">제목</label> <input type="text" class="form-control" id="title" name="title" value="${boardDetail.title}" readonly="readonly">
	</div>
	<input type="hidden" id="boardId" value="${boardDetail.id}">
	<label for="exampleFormControlInput1" class="form-label">작성자 ${boardDetail.username} </label>
	<label for="exampleFormControlInput1" class="form-label">등록일 ${boardDetail.createdAt} </label>
	<label for="exampleFormControlInput1" class="form-label">카테고리 ${boardDetail.categoryName} </label>
	<div class="mb-3">
		<label for="exampleFormControlTextarea1" class="form-label">내용</label>
		<textarea class="form-control" id="exampleFormControlTextarea1" rows="10" name="content" readonly="readonly">${boardDetail.content}</textarea>
	</div>
	<button type="submit" class="btn btn-primary" onclick="location.href='/board/update/${boardDetail.id}'">수정</button>
	<button type="submit" class="btn btn-primary" onclick="location.href='/board/delete/${boardDetail.id}'">삭제</button>
	<br>
	<br>
	<c:if test="${principal != null }">
		<c:choose>
			<c:when test="${isLike}">
				<button type="button" id="unlike">공감해제</button>
			</c:when>
			<c:otherwise>
				<button type="button" id="like">공감</button>
			</c:otherwise>
		</c:choose>
	</c:if>
	<script type="text/javascript">
		$(document).ready(() => {
			$("#unlike").on("click", () => {
				$.ajax({
					type: "DELETE",
					url: "/api/unlike/" + $("#boardId").val()
				}).done((response) => {
					location.href='/board/detail/' + $("#boardId").val();
				}).fail((error) => {
					console.log(error);
					alert("요청 실패")
				});
			});
			
			$("#like").on("click", () => {
				$.ajax({
					type: "POST",
					url: "/api/like/" + $("#boardId").val()
				}).done((response) => {
					location.href='/board/detail/' + $("#boardId").val();
				}).fail((error) => {
					console.log(error);
					alert("요청 실패")
				});
			});
		});
	</script>
</body>
</html>