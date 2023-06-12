<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<link rel="stylesheet" href="/assets/css/list.css" />
<section class="top-wrap">
	<div class="top-wrap-content">
		<div class="top-wrap-nav">
			<div class="novel-type">
				<h1>${serviceType}소설</h1>
			</div>
			<div class="sort-type">
				<a href="?sort=default">최신순 </a><a href="?sort=favorite"> 즐겨찾기순 </a><a href="?sort=score"> 평점순 </a>
			</div>
		</div>
		<form action="/${map }" method="get">
			<div class="row g-3 mt-4 align-items-center justify-content-center">
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
				<input type="hidden" name="sort" value="${sort }">
				<div class="col-auto">
					<button type="submit" class="btn btn-primary">검색</button>
				</div>
			</div>
		</form>
	</div>
</section>
<section class="one-tab-list">
	<ul class="work-list">
		<c:forEach items="${novelList.content }" var="novel">
			<li>
				<div class="work-box">
					<div class="cover">
						<c:choose>
							<c:when test="${novel.cover != null }">
								<a href="/novel/detail/${novel.id}"><img alt="이미지 기간만료" src="/bandi/uploads/${novel.cover }"></a>
							</c:when>
							<c:otherwise>
								<a href="/novel/detail/${novel.id}"><img alt="이미지 없음" src="/assets/images/noimg.jpg"></a>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="detail">
						<div class="desc">
							<a href="/novel/detail/${novel.id}"><div class="detail-title">
									<img class="icon" src="/assets/images/main/medal-line.png">${novel.title}</div></a> <a href="/novel/detail/${novel.id}"><div class="detail-aurthor">
									<img class="icon" src="/assets/images/main/pencil-line.png">작가 | ${novel.nickName}
								</div></a> <a href="/novel/detail/${novel.id}"><div class="detail-intro">“${novel.overview}”</div></a>
						</div>
						<div class="scale">
							<span><img src="/assets/images/main/user-line.png">${novel.favoriteCount }</span>
							<c:choose>
								<c:when test="${empty novel.score }">
									<span><img src="/assets/images/main/star-line.png"> - </span>
								</c:when>
								<c:otherwise>
									<span><img src="/assets/images/main/star-line.png"> ${novel.score() } </span>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</li>

		</c:forEach>
	</ul>
</section>
<section>
	<nav class="paging" aria-label="Page navigation example">
		<div></div>
		<ul class="pagination">
			<li class="page-item <c:if test='${novelList.currentPage == 1}'>d-none</c:if>"><a class="page-link" href="/${map}?currentPage=${novelList.currentPage - 1}">Previous</a></li>
			<c:forEach var="pNo" begin="${novelList.startPage }" end="${novelList.endPage }" step="1">
				<li class="page-item"><a class="page-link" href="/${map }?currentPage=${pNo}">${pNo}</a></li>
			</c:forEach>
			<li class="page-item <c:if test='${novelList.endPage == novelList.currentPage }'>d-none</c:if>"><a class="page-link" href="/${map}/${section.id}?currentPage=${novelList.currentPage + 1}">Next</a></li>
		</ul>
		<div></div>
	</nav>
</section>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>
