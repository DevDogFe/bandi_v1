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
</style>
</head>
<body>
	<input type="hidden" id="novelId" value="${detail.id}">
	<section>
		<article>
			<h1>소설 제목</h1>
			<div class="novel--header d-flex">
				<div>
					<img alt="이미지 없음" src="/assets/images/noimg.jpg">
				</div>
				<div>
					<table>
						<tr>
							<td>제목</td>
							<td>${detail.title}</td>
						</tr>
						<tr>
							<td>장르</td>
							<td>${detail.genreName}</td>
							<td>작가</td>
							<td>${detail.username}</td>
						</tr>
						<tr>
							<td>작품 등록일</td>
							<td>${detail.createdAt()}</td>
						</tr>
						<tr>
							<td>즐겨찾기</td>
							<td>12</td>
						</tr>

					</table>
					<c:if test="${principal != null }">
						<c:choose>
							<c:when test="${isFavorite }">
								<button type="button" class="btn btn-secondary" id="unfavorite">즐겨찾기 해제</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-success" id="favorite">즐겨찾기 추가</button>
							</c:otherwise>
						</c:choose>
					</c:if>
				</div>
			</div>
			<c:if test="${detail.userId == principal.id}">
				<button onclick="location.href='/section/registration/${detail.id}'" class="btn btn btn-secondary">글 쓰기</button>
			</c:if>
			<c:choose>
				<c:when test="${empty sectionList}">
					<h3>아직 글이 없습니다.</h3>
				</c:when>
				<c:otherwise>
					<table class="table">
						<thead>
							<tr class="table-secondary">
								<td>번호</td>
								<td>제목</td>
								<td>등록일</td>
								<td>조회수</td>
								<td>평점</td>
							</tr>
						</thead>
						<tbody>
							<c:set var="count" value="${sectionList.size()}"></c:set>
							<c:forEach items="${sectionList}" var="section">
								<tr>
									<td>${count}</td>
									<td><a href="/section/read/${section.id}" class="list--link">${section.title}</a></td>
									<td>${section.createdAt()}</td>
									<td>${section.views}</td>
									<td>4.5</td>
									<c:set var="count" value="${count - 1}"></c:set>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</article>
	</section>
	<script type="text/javascript">
	$(document).ready(() => {
			$("#unfavorite").on("click", () =>{
				$.ajax({
					type: "DELETE",
					url: "/api/unfavorite/" + $("#novelId").val()
				}).done((response) => {
					console.log(response);
					console.log(typeof response);
					location.href='/novel/detail/' + $("#novelId").val();
				}).fail((error) => {
					console.log(error);
					alert("요청을 처리할 수 없습니다.");
				});
			});
			
			$("#favorite").on("click", () =>{
				$.ajax({
					type: "POST",
					url: "/api/favorite/" + $("#novelId").val()
				}).done((response) => {
					console.log(response);
					console.log(typeof response);
					location.href='/novel/detail/' + $("#novelId").val();
				}).fail((error) => {
					console.log(error);
					alert("요청을 처리할 수 없습니다.");
				});
			});
		});
	</script>
</body>
</html>