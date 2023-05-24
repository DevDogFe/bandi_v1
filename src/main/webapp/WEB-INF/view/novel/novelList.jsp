<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../layout/header.jsp"%>
<style type="text/css">
.list--link {
	text-decoration: none;
	color: #black;
}

ul {
	list-style: none;
}

.list--link:visited {
	color: #333;
}
</style>

<section>
	<article>
		<h1>${serviceType}소설</h1>
		<a href="?sort=default">최신순</a>
		<a href="?sort=favorite">즐겨찾기순</a>
		<a href="?sort=score">평점순</a>
		<table class="table">
			<thead>
				<tr class="table-secondary">
					<td>장르</td>
					<td>작품 제목</td>
					<td>작가</td>
					<td>평점</td>
					<td>즐겨찾기</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${novelList.content}" var="novel">
					<tr>
						<td><a href="?genreId=${novel.genreId }" class="list--link">${novel.genreName}</a></td>
						<td><a href="/novel/detail/${novel.id}" class="list--link">${novel.title}</a></td>
						<td><a href="#" class="list--link">${novel.nickName}</a></td>
						<c:choose>
							<c:when test="${empty novel.score }">
								<td>-</td>
							</c:when>
							<c:otherwise>
								<td>${novel.score()}</td>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${empty novel.favoriteCount }">
								<td>0</td>
							</c:when>
							<c:otherwise>
								<td>${novel.favoriteCount}</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="col-sm-12 col-md-7">
			<div>
				<ul class="d-flex">
					<!-- Previous 시작 -->
					<li class=" <c:if test='${novelList.currentPage == 1}'>d-none</c:if>" id=""><a href="/${map}?currentPage=${novelList.currentPage - 1}" class="page-link">Previous</a></li>
					<!-- Previous 끝 -->
					<!-- Page번호 시작 -->
					<c:forEach var="pNo" begin="${novelList.startPage }" end="${novelList.endPage }" step="1">
						<li class="  <c:if test=''>active</c:if>"><a href="/${map }?currentPage=${pNo}" class="page-link">${pNo}</a></li>
					</c:forEach>
					<!-- Page번호 끝 -->
					<!-- Next 시작 -->
					<li class="<c:if test='${novelList.endPage == novelList.currentPage }'>d-none</c:if>" id=""><a href="/${map}/${section.id}?currentPage=${novelList.currentPage + 1}" class="page-link">Next</a></li>
					<!-- Next 끝 -->
				</ul>
			</div>
		</div>
		<form action="/${map }" method="get">
			<div class="row g-3 align-items-center">
				<div class="col-auto">
					<label for="genreId" class="col-form-label">장르 선택</label>
				</div>
				<div class="col-auto">
					<select class="form-select form-select-sm" name="genreId" id="genreId">
						<option value="">전체</option>
						<c:forEach items="${genreList}" var="genre">
							<option value="${genre.id}">${genre.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-auto">
					<label for="search" class="col-form-label">검색어</label>
				</div>
				<div class="col-auto">
					<input type="text" id="search" name="search" class="form-control">
				</div>
				<div class="col-auto">
					<button type="submit" class="btn btn-primary">검색</button>
				</div>
			</div>
		</form>
	</article>
</section>

<%@include file="../layout/footer.jsp"%>