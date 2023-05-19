<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style type="text/css">
.list--link {
	text-decoration: none;
	color: #black;
}

.list--link:visited {
	color: #333;
}

ul {
	list-style: none;
}
</style>
</head>
<body>
	<section>
		<article class="mb-3 p-3">
			<h1>소설 제목</h1>
			<div class="novel--header d-flex">
				<div>
					<img alt="이미지 없음" src="/assets/images/noimg.jpg">
				</div>
			</div>
			<div>
				<input type="hidden" id="sectionId" value="${section.id}">
				<div class="section--title mb-3">${section.title}</div>
				<div class="section--content mb-3">${section.content}</div>
			</div>
			<div>
				<a href="/novel/detail/${section.novelId }">목록</a>
			</div>
		</article>
		<article>
			<c:choose>
				<c:when test="${empty principal.id }">
					<div class="mb-3 ps-3">
						<label for="content" class="form-label">댓글 등록</label>
						<textarea class="form-control" id="content" name="content" rows="3" placeholder="댓글을 등록하려면 로그인해야합니다." readonly="readonly"></textarea>
						<input type="hidden" name="sectionId" value="${section.id}">
					</div>
					<div class="mb-3 ps-3">
						<button type="button" class="btn btn-secondary">등록</button>
					</div>
				</c:when>
				<c:otherwise>
					<form action="/novel/reply" method="post">
						<div class="mb-3 ps-3">
							<label for="content" class="form-label">댓글 등록</label>
							<textarea class="form-control" id="content" name="content" rows="3" placeholder="작가나 작품에 대한 비방이나 부적절한 표현은 삼가해주시길 바랍니다."></textarea>
							<input type="hidden" name="sectionId" value="${section.id}">
						</div>
						<div class="mb-3 ps-3">
							<button type="submit" class="btn btn-secondary">등록</button>
						</div>
					</form>
				</c:otherwise>
			</c:choose>
			<div class="ps-3">
				<table class="table">
					<thead>
						<tr>
							<th>닉네임</th>
							<th>내용</th>
							<th>작성 시간</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty replyList.content }"></c:if>
						<c:forEach items="${replyList.content }" var="reply">
							<tr>
								<td>${reply.username }</td>
								<td>${reply.content }</td>
								<td>${reply.createdAt() }</td>
								<td><c:if test="${principal.id == reply.userId }">
										<button class="delete--btn" onclick="deleteReply(${reply.id})">삭제</button>
									</c:if></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="col-sm-12 col-md-7">
					<div>
						<ul class="d-flex">
							<!-- Previous 시작 -->
							<li class=" <c:if test='${replyList.currentPage == 1}'>d-none</c:if>" id=""><a href="/section/read/${section.id}?currentPage=${replyList.currentPage - 1}" class="page-link">Previous</a></li>
							<!-- Previous 끝 -->
							<!-- Page번호 시작 -->
							<c:forEach var="pNo" begin="${replyList.startPage }" end="${replyList.endPage }" step="1">
								<li class="  <c:if test=''>active</c:if>"><a href="/section/read/${section.id}?currentPage=${pNo}" class="page-link">${pNo}</a></li>
							</c:forEach>
							<!-- Page번호 끝 -->
							<!-- Next 시작 -->
							<li class="<c:if test='${replyList.endPage == replyList.currentPage }'>d-none</c:if>" id=""><a href="/section/read/${section.id}?currentPage=${replyList.currentPage + 1}" class="page-link">Next</a></li>
							<!-- Next 끝 -->
						</ul>
					</div>
				</div>
			</div>
		</article>
	</section>
	<script type="text/javascript">
	
	function deleteReply(replyId) {
		$.ajax({
			type: "DELETE",
			url: "/api/reply/" + replyId
		}).done((response) => {
			console.log(response);
			console.log(typeof response);
			location.href='/section/read/' + $("#sectionId").val();
		}).fail((error) => {
			console.log(error);
			alert("요청을 처리할 수 없습니다.");
		});
	}
	$(document).ready(() => {
		
	});
	</script>
</body>
</html>