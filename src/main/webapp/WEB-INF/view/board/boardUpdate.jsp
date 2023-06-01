<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<form action="/board/updateProc/${boardDetail.id}" method="post" enctype="multipart/form-data">
		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">제목</label> <input type="text" class="form-control" id="title" name="title" value="${boardDetail.title}">
		</div>
		<input type="hidden" name="boardId" value="${boardDetail.id }">
		<label for="exampleFormControlInput1" class="form-label">작성자 ${boardDetail.username} </label> <label for="exampleFormControlInput1" class="form-label">등록일 ${boardDetail.createdAt()} </label> <br>
		<label for="exampleFormControlInput1" class="form-label">카테고리</label> <br> <select name="categoryId" id="categoryId">
			<c:forEach items="${categoryList }" var="category">
				<option value="${category.id }" <c:if test="${category.id == boardDetail.categoryId}">selected</c:if>>${category.categoryName }</option>
			</c:forEach>
		</select>
		<div class="mb-3">
			<label for="exampleFormControlTextarea1" class="form-label">내용</label>
			<textarea class="form-control" id="exampleFormControlTextarea1" rows="10" name="content">${boardDetail.content}</textarea>
		</div>
		<c:if test="${not empty fileList}">
		<div class="mb-3">
			<label for="exampleFormControlTextarea1" class="form-label">첨부파일 목록</label><br>
			<c:forEach var="file" items="${fileList}">
				<a href="#">${file.rawFileName}</a>
				<button class="deleteFileBtn" onclick="deleteFile(${file.id})">삭제</button><br><br>
			</c:forEach>
		</div>
		</c:if>
		<div class="mb-3">
			<label for="formFileMultiple" class="form-label">파일 선택</label> <input class="form-control" type="file" name="files" id="formFileMultiple" multiple>
		</div>
		<button type="submit" class="btn btn-light">수정</button>
		<button type="button" class="btn btn-light" onclick="location.href='/board/detail/${boardDetail.id}'">취소</button>
	</form>
	<script type="text/javascript">
		function deleteFile(id) {
			$.ajax({
				type: "DELETE",
				url: "/api/deletefile/" + id,
			}).done(function(response){
				location.href = '/board/update/' + ${boardDetail.id}
			}).fail(function(error) {
				alert("요청 실패");
			});
		}
	</script>
</body>
</html>