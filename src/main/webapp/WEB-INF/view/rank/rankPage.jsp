<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/rank/rankPage.css" />

<section class="mb-5">

	<div class="mt-5 mb-5 text-end sort--btn">
		<a href="?sort=0">즐겨찾기순</a> <a href="?sort=1">평점순</a>
	</div>
	<div class="d-flex justify-content-between">
		<div class="rank--container">
			<h2>유료 베스트</h2>
			<br>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">장르</th>
						<th scope="col">제목</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${payNovelList }" var="novel">
						<tr>
							<td>${novel.genreName }</td>
							<td>${novel.title }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="rank--container">
			<h2>무료 베스트</h2>
			<br>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">장르</th>
						<th scope="col">제목</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${freeNovelList }" var="novel">
						<tr>
							<td>${novel.genreName }</td>
							<td>${novel.title }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="rank--container">
			<h2>공모전 베스트</h2>
			<br>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">장르</th>
						<th scope="col">제목</th>
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