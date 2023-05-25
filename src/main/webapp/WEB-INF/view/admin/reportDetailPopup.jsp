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
	<div class="mb-3">
		<label for="exampleFormControlTextarea1" class="form-label">신고 접수 내용</label>
		<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="content" readonly="readonly">${report.content}</textarea>
	</div>
	<div class="mb-3">
		<label for="exampleFormControlInput1" class="form-label">제목</label> <input type="text" class="form-control" id="title" name="title" value="${boardDetail.title}" readonly="readonly">
	</div>
	<input type="hidden" id="boardId" value="${boardDetail.id}">
	<label for="exampleFormControlInput1" class="form-label">작성자 ${boardDetail.username} </label>
	<label for="exampleFormControlInput1" class="form-label">등록일 ${boardDetail.createdAt()} </label>
	<label for="exampleFormControlInput1" class="form-label">카테고리 ${boardDetail.categoryName} </label>
	<div class="mb-3">
		<label for="exampleFormControlTextarea1" class="form-label">내용</label><br>
		<c:forEach var="file" items="${fileList}">
			<img src="/bandi/uploads/${file.encodedFileName}" style="max-width: 300px; max-height: 300px;">
		</c:forEach>
		<textarea class="form-control" id="exampleFormControlTextarea1" rows="10" name="content" readonly="readonly">${boardDetail.content}
		</textarea>
	</div>
	<button class="btn btn-primary" onclick="window.close(); opener.location.reload();">확인</button>
	<button type="submit" class="btn btn-primary" onclick="location.href='/board/delete/${boardDetail.id}'; window.close(); opener.location.reload();">삭제</button>
</body>
</html>