<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<link rel="stylesheet" href="/assets/css/list.css" />
      <section class="top-banner">
			<div class="big-testimonial-content">
					<div class="bigSlider">
						<div>
							<p class="big-banner">
								<img src="/assets/images/main/topSlider.png">
							</p>
						</div>
						<div>
							<p class="big-banner">
								<img src="/assets/images/main/topSlider2.png">
							</p>
						</div>
						<div>
							<p class="big-banner">
								<img src="/assets/images/main/topSlider.png">
							</p>
						</div>
						<div>
							<p class="big-banner">
								<img src="/assets/images/main/topSlider2.png">
							</p>
						</div>
					</div>
				</div>
				<div class="mini-banners">
					<div class="contest-mini-banner">
						<a href="/contest/list"><img src="/assets/images/main/contest-banner.png"></a>
					</div>
					<div class="contest-mini-banner">
						<img src="/assets/images/main/contest-banner2.png">
					</div>
					<div class="contest-mini-banner">
						<img src="/assets/images/main/contest-banner3.png">
					</div>
				</div>
		</section>
      <section class="top-wrap">
      	<div class="top-wrap-content">      	
      		<div class="top-wrap-nav">
      			<div class="novel-type"><h1>공모전 소설</h1></div>
      			<div class="sort-type"><a href="?contestId=${contestId}&sort=default">최신순 </a><a href="?contestId=${contestId}&sort=favorite"> 즐겨찾기순 </a><a href="?contestId=${contestId}&sort=score"> 평점순 </a></div>
      		</div>
      		<form action="/${map }" method="get">
				<div class="row g-3 mt-4 align-items-center">
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
      	</div>
      </section>
      <section class="one-tab-list">
      	<ul class="work-list">
      		<c:forEach items="${contestNovelList.contestContent }" var="novel">
	      		<li>
	      			<div class="work-box">
						<div class="cover">
							<c:choose>
								<c:when test="${detail.cover != null }">
									<a href="/contest/novel/detail/${novel.id}"><img alt="이미지 기간만료" src="/bandi/uploads/${detail.cover }"></a>
								</c:when>
								<c:otherwise>
									<a href="/contest/novel/detail/${novel.id}"><img alt="이미지 없음" src="/assets/images/noimg.jpg"></a>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="detail">
							<div class="desc">
								<a href="/contest/novel/detail/${novel.id}"><div class="detail-title">
										<img class="icon" src="/assets/images/main/medal-line.png">${novel.title}</div></a> <a href="/contest/novel/detail/${novel.id}"><div class="detail-aurthor">
										<img class="icon" src="/assets/images/main/pencil-line.png">작가 | ${novel.nickName}
									</div></a> <a href="/contest/novel/detail/${novel.id}"><div class="detail-intro">“${novel.overview}”</div></a>
							</div>
							<div class="scale">
								<span><img src="/assets/images/main/user-line.png">${novel.favoriteCount }</span> <span><img src="/assets/images/main/thumb-up-line.png">143</span>
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
  			<div></div>
		</nav>
      </section>
      <%@include file="/WEB-INF/view/layout/footer.jsp"%>
