<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style type="text/css">
.list--link {
	text-decoration: none;
	color: #black;
}

ul{
	list-style: none;
}

.list--link:visited {
	color: #333;
}
</style>
</head>
<body>
	<section>
		<article>
			<h1>${serviceType}소설</h1>
			<table class="table">
				<thead>
					<tr class="table-secondary">
						<td>작품 제목</td>
						<td>작가</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${contestNovelList.contestContent}" var="novel">
						<tr>
							<td><a href="/contest/novel/detail/${novel.id}" class="list--link">${novel.title}</a></td>
							<td><a href="#" class="list--link">${novel.username}</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="col-sm-12 col-md-7">
				<div>
					<ul class="d-flex">
						<!-- Previous 시작 -->
						<li class=" <c:if test='${contestNovelList.currentPage == 1}'>d-none</c:if>" id=""><a href="/${map}?currentPage=${contestNovelList.currentPage -1}" class="page-link">Previous</a></li>
						<!-- Previous 끝 -->
						<!-- Page번호 시작 -->
						<c:forEach var="pNo" begin="${contestNovelList.startPage }" end="${contestNovelList.endPage }" step="1">
							<li class="  <c:if test=''>active</c:if>"><a href="/${map }?currentPage=${pNo}" class="page-link">${pNo}</a></li>
						</c:forEach>
						<!-- Page번호 끝 -->
						<!-- Next 시작 -->
						<li class="<c:if test='${contestNovelList.endPage == contestNovelList.currentPage }'>d-none</c:if>" id=""><a href="/${map}/${section.id}?currentPage=${contestNovelList.currentPage + 1}" class="page-link">Next</a></li>
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
							<option value=""> 전체 </option>
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
</body>
</html>