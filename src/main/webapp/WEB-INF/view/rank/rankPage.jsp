<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<section>

	<a href="?sort=0">즐겨찾기순</a> <a href="?sort=1">평점순</a>
	<div class="d-flex">
		<div>
			<h1>유료 베스트</h1>

			<table class="table">
				<thead>
					<tr>
						<th>장르</th>
						<th>제목</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${payNovelList }" var="novel">
						<tr>
							<td>${novel.genreName }</td>
							<td>${novel.title }</td>
							<c:choose>
								<c:when test="${empty novel.score }">
									<td>${novel.favoriteCount }</td>
								</c:when>
								<c:otherwise>
									<td>${novel.score }</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
			<h1>무료 베스트</h1>

			<table class="table">
				<thead>
					<tr>
						<th>장르</th>
						<th>제목</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${freeNovelList }" var="novel">
						<tr>
							<td>${novel.genreName }</td>
							<td>${novel.title }</td>
							<c:choose>
								<c:when test="${empty novel.score }">
									<td>${novel.favoriteCount }</td>
								</c:when>
								<c:otherwise>
									<td>${novel.score }</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
			<h1>공모전 베스트</h1>

			<table class="table">
				<thead>
					<tr>
						<th>장르</th>
						<th>제목</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${contestNovelList }" var="novel">
						<tr>
							<td>${novel.genreName }</td>
							<td>${novel.title }</td>
							<c:choose>
								<c:when test="${empty novel.score }">
									<td>${novel.favoriteCount }</td>
								</c:when>
								<c:otherwise>
									<td>${novel.score }</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</section>


<%@include file="../layout/footer.jsp"%>