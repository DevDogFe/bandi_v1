<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 확인</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<style>
body {
	width: 100vw;
	height: 100vh;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	margin: 0;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 17px;
}
.form-card {
	width: 26rem;
	gap: 1rem;
	border-radius: 0.3rem;
	padding: 1.5rem;
	border: 5px solid #5f9bd1;
	border-radius: 12px;
}

input[type='text'], textarea {
	width: 23rem;
	border: none;
	border-radius: 12px;
	background-color: #e6ebf0;
	padding: 0.8rem 1rem;
	margin-bottom: 1rem;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 17px;
}
.ok, .delete {
	cursor: pointer;
	font-size: 0.9rem;
	font-weight: 600;
	border: none;
	border-radius: 12px;
	color: #ffffff;
	background-color: #3b6bc9;
	padding: 0.8rem 1rem;
	width: 30%;
}
</style>
<body>
	<div class="form-card">
		<label for="exampleFormControlTextarea1" class="form-label">신고 접수 내용</label>
		<textarea id="text" rows="3" name="content" readonly="readonly">${report.content}</textarea>
		<label for="exampleFormControlInput1" class="form-label">제목</label> <input type="text" class="form-control" id="title" name="title" value="${boardDetail.title}" readonly="readonly"> <input
			type="hidden" id="boardId" value="${boardDetail.id}"> <label for="exampleFormControlInput1" class="form-label">작성자 ${boardDetail.username} </label> <label for="exampleFormControlInput1"
			class="form-label">등록일 ${boardDetail.createdAt()} </label> <label for="exampleFormControlInput1" class="form-label">카테고리 ${boardDetail.categoryName} </label> <label
			for="exampleFormControlTextarea1" class="form-label">내용</label><br>
		<c:forEach var="file" items="${fileList}">
			<img src="/bandi/uploads/${file.encodedFileName}" style="max-width: 300px; max-height: 300px;">
		</c:forEach>
		<textarea class="form-control" id="exampleFormControlTextarea1" rows="10" name="content" readonly="readonly">${boardDetail.content}
		</textarea>
		<button class="ok" onclick="window.close(); opener.location.reload();">확인</button>
		<button type="submit" class="delete" onclick="location.href='/board/delete/${boardDetail.id}'; window.close(); opener.location.reload();">삭제</button>
	</div>
</body>
</html>