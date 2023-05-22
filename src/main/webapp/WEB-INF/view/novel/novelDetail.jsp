<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../layout/header.jsp"%>
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
<input type="hidden" id="novelId" value="${detail.id}">
<section>
	<article>
		<h1>소설 제목</h1>
		<div class="novel--header d-flex">
			<div>
			<c:choose>
				<c:when test="${detail.cover != null }">
					<img alt="" src="/bandi/uploads/${detail.cover }">
				</c:when>
				<c:otherwise>
				
				<img alt="이미지 없음" src="/assets/images/noimg.jpg">
				</c:otherwise>
			</c:choose>
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
				<c:if test="${principal.id == detail.userId }">
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">표지 등록하기</button>

					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">표지 등록</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<form action="/novel/cover?novelId=${detail.id }&serviceTypeId=${detail.serviceTypeId}" method="post" enctype="multipart/form-data">
									<div class="modal-body">
										<div class="mb-3">
											<label for="formFile" class="form-label">이미지 파일 선택</label> <input class="form-control" name="coverFile" type="file" id="formFile">
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
										<button type="submit" class="btn btn-primary">등록</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</c:if>
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
						<c:forEach items="${sectionList}" var="section" varStatus="vs">
							<c:choose>
								<c:when test="${section.userId != null}">
									<tr class="table-info">
										<td>${sectionList.size() - vs.index}</td>
										<td><a
											href="/section/read/${detail.id}/${section.id}"
											class="list--link">${section.title}</a></td>
										<td>${section.createdAt()}</td>
										<td>${section.views}</td>
										<td>4.5</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr class="table-default">
										<td>${sectionList.size() - vs.index}</td>
										<td><a
											href="/section/read/${detail.id}/${section.id}"
											class="list--link">${section.title}</a></td>
										<td>${section.createdAt()}</td>
										<td>${section.views}</td>
										<td>4.5</td>
									</tr>
								</c:otherwise>
							</c:choose>
							<%-- <tr>
								<td>${count}</td>
								<td><a href="/section/read/${detail.id}/${section.id}" class="list--link">${section.title}</a></td>
								<td>${section.createdAt()}</td>
								<td>${section.views}</td>
								<td>4.5</td>
								<c:set var="count" value="${count - 1}"></c:set>
							</tr> --%>
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
<%@include file="../layout/footer.jsp"%>
