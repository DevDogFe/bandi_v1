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
	<label for="exampleFormControlInput1" class="form-label">등록일 ${boardDetail.createdAt()} </label>
	<label for="exampleFormControlInput1" class="form-label">카테고리 ${boardDetail.categoryName} </label>
	<div class="mb-3">
		<label for="exampleFormControlTextarea1" class="form-label">내용</label>
		<textarea class="form-control" id="exampleFormControlTextarea1" rows="10" name="content" readonly="readonly">${boardDetail.content}</textarea>
	</div>
	<c:if test="${principal.id == boardDetail.userId }">
		<button type="submit" class="btn btn-primary" onclick="location.href='/board/update/${boardDetail.id}'">수정</button>
		<button type="submit" class="btn btn-primary" onclick="location.href='/board/delete/${boardDetail.id}'">삭제</button>
	</c:if>
	<button type="button" class="btn btn-primary" onclick="location.href='/board/list'">목록</button>
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
	<c:if test="${principal == null }">
		<button type="button" id="noUser">공감</button>
	</c:if>
	<article>
		<c:choose>
			<c:when test="${empty principal.id}">
				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">댓글</label> <input type="hidden" id="boardId" values="${boardDetail.id}">
					<textarea class="form-control" id="content" name="content" rows="3" placeholder="댓글을 등록하려면 로그인해야합니다." readonly="readonly"></textarea>
				</div>
				<button type="button" class="btn btn-primary">등록</button>
			</c:when>
			<c:otherwise>
				<form action="/board/reply" method="post">
					<div class="mb-3">
						<label for="exampleFormControlInput1" class="form-label">댓글</label> <input type="hidden" id="boardId" name="boardId" value="${boardDetail.id}">
						<textarea class="form-control" id="content" name="content" rows="3" placeholder="비방이나 부적절한 표현은 삼가해주시길 바랍니다."></textarea>
					</div>
					<button type="submit" class="btn btn-primary">등록</button>
				</form>
			</c:otherwise>
		</c:choose>
	</article>
	<c:if test="${not empty replyList.content}">
		<div class="ps-3">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">닉네임</th>
						<th scope="col">내용</th>
						<th scope="col">작성시간</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="reply" items="${replyList.content}">
						<tr>
							<td>${reply.username}</td>
							<td>${reply.content}</td>
							<td>${reply.createdAt}</td>
							<td><c:if test="${principal.id == reply.userId}">
									<button class="deleteReplyBtn" onclick="deleteReply(${reply.id})">삭제</button>
								</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</c:if>
	<div class="col-sm-12 col-md-7">
		<div>
			<ul class="d-flex">
				<li class="<c:if test='${replyList.currentPage == 1}'>d-none</c:if>" id=""><a href="/board/detail/${boardDetail.id}?currentPage=${replyList.currentPage - 1}" class="page-link">Previous</a></li>
				<c:forEach var="pNo" begin="${replyList.startPage}" end="${replyList.endPage}" step="1">
					<li <c:if test="${pNo == replyList.currentPage}">class="active"</c:if>><a href="/board/detail/${boardDetail.id}?currentPage=${pNo}" class="page-link">${pNo}</a></li>
				</c:forEach>
				<li class="<c:if test='${replyList.endPage == replyList.currentPage }'>d-none</c:if>" id=""><a href="/board/detail/${boardDetail.id}?currentPage=${replyList.currentPage + 1}"
					class="page-link">Next</a></li>
			</ul>
		</div>
	</div>
	<script type="text/javascript">
			
			$("#unlike").on("click", ()=>{
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
			
			$("#noUser").on("click", ()=>{
				alert('로그인이 필요한 기능입니다.');
			});				
			
			$("#like").on("click", ()=>{
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
			
			
		$(document).ready(() => {

		});
	</script>
	<script type="text/javascript">
		function deleteReply(id) {
	        $.ajax({
	            type: "DELETE",
	            url: "/api/reply/" + id,
	        }).done(function(response) {
	            console.log(response);
	            console.log(id);
	            location.href = '/board/detail/' + $("#boardId").val();
	        }).fail(function(error) {
	            alert("요청 실패");
	        });
	    }
	</script>
</body>
</html>