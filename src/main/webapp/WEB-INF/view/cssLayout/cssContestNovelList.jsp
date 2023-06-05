<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>반디</title>
    <script src="/assets/js/jquery.min.js"></script>
    <!-- jquery-3.5.1이 위에 있어야 작동 -->
    <!-- Slick.js -->

    <!-- Slider.js no CDN -->
    <!-- <script src="js/slick/slick.min.js"></script>
    <link rel="stylesheet" href="js/slick/slick.css">
    <link rel="stylesheet" href="js/slick/slick-theme.css"> -->
    
    <!-- bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

    <!-- Slider.js CDN -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
    <script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="/assets/js/custom-slick.js"></script>
    <!-- 작성한 css는 항상 밑에 있어야함 -->
    <link rel="stylesheet" href="/assets/css/list.css" />
    
  </head>
  <body>
    <div class="container">
    	<div class="inner">
      	<header>
        	<div class="banner">
          		<div class="lnb">
            		<a href="#none"><em>for</em> member</a>
            		<a href="#none">로그인</a>
            		<a href="#none">회원가입</a>
          		</div>
        	</div>
        	<nav>
          		<div class="logo">
            		<a href="#none"><img src="/assets/images/main/bandi-logo3.png"></a>
          		</div>
          		<ul class="gnb">
            		<li><a href="#none">HOME</a></li>
            		<li><a href="#none">소설</a></li>
            		<li><a href="#none">공모전</a></li>
            		<li class="dropdown">
              			<a href="#none" class="dropbtn">게시판</a>
            		</li>
            		<li><a href="#none">고객지원</a></li>
            		<li><a href="#none">마이페이지</a></li>
          		</ul>
        	</nav>
      </header>
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
      			<div class="sort-type"><a href="?sort=default">최신순 </a><a href="?sort=favorite"> 즐겨찾기순 </a><a href="?sort=score"> 평점순 </a></div>
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
									<a href="/novel/detail/${novel.id}"><img alt="이미지 기간만료" src="/bandi/uploads/${detail.cover }"></a>
								</c:when>
								<c:otherwise>
									<a href="/novel/detail/${novel.id}"><img alt="이미지 없음" src="/assets/images/noimg.jpg"></a>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="detail">
							<div class="desc">
								<a href="/novel/detail/${novel.id}"><div class="detail-title">
										<img class="icon" src="/assets/images/main/medal-line.png">${novel.title}</div></a> <a href="/contest/novel/detail/${novel.id}"><div class="detail-aurthor">
										<img class="icon" src="/assets/images/main/pencil-line.png">작가 | ${novel.username}
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
      </div>
    </div>
    <footer>
        <div class="inner">
          <div class="footer-top">
            <ul>
              <li>(주)반디</li>
              <li><a href="#none">이용약관</a></li>
              <li><a href="#none">개인정보 처리방침</a></li>
              <li><a href="#none">청소년 보호 정책</a></li>
              <li><a href="#none">회사 소개</a></li>
            </ul>
          </div>
          <div class="footer-content">
            <ul class="community">
              <!-- 제목 줄은 a없이-->
              <li>게시판</li>
              <li><a href="#none">Subscribe</a></li>
              <li><a href="#none">Give A Gift</a></li>
              <li><a href="#none">Customer Service FAQ</a></li>
              <li><a href="#none">Access Your Subscription</a></li>
            </ul>
            <ul class="network">
              <li>Network</li>
              <li><a href="#none">Privacy Policy</a></li>
              <li><a href="#none">Terms Of Service</a></li>
              <li><a href="#none">Advertise</a></li>
              <li><a href="#none">Jobs</a></li>
            </ul>
            <ul class="help">
              <li>Help Preserve This Project</li>
              <li>We may earn a commission if you purchase an item 
                featured on our site.</li>
              <li>Copyright ©  2020 CodingWorks. All rights reserved.</li>
            </ul>
          </div>
        </div>
      </footer>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
