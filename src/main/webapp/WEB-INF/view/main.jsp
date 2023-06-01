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

<!-- Slider.js CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="/assets/js/custom-slick.js"></script>
<!-- 작성한 css는 항상 밑에 있어야함 -->
<link rel="stylesheet" href="/assets/css/style.css" />
</head>
<body>
	<!-- Modal -->
	<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그인</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="/login" method="post">
						<div class="mb-3">
							<label for="username" class="form-label">ID</label> <input type="text" class="form-control" name="username" id="usernameL" required="required" value="qwe">
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">Password</label> <input type="password" class="form-control" name="password" id="passwordL" required="required" value="123">
						</div>
						<div class="mb-3 form-check">
							<input type="checkbox" class="form-check-input" id="exampleCheck1"> <label class="form-check-label" for="exampleCheck1">Check me out</label>
						</div>
						<button type="button" id="loginBtn" class="btn btn-primary">Login</button>
						<br> <a href="/user">회원가입</a> <br> <a href="/findPwd">비밀번호 찾기</a> <a
							href="https://kauth.kakao.com/oauth/authorize?client_id=f2f5ec106cf03cddc10930e8d7c58d68&redirect_uri=http://localhost/auth/kakao/callback&response_type=code"> <img alt="카카오로그인"
							src="/assets/images/kakao_login/ko/kakao_login_medium_wide.png">
						</a>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="inner">
			<header>
				<div class="banner">
					<div class="lnb">
						<a href="#none"><em>for</em> member</a>
						<c:choose>
							<c:when test="${empty principal}">
								<a href="#loginModal" data-bs-toggle="modal" role="button">로그인</a>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${\"kakao\".equals(principal.external)}">
										<a href="https://kauth.kakao.com/oauth/logout?client_id=f2f5ec106cf03cddc10930e8d7c58d68&logout_redirect_uri=http://localhost/logout">로그아웃</a>
									</c:when>
									<c:otherwise>
										<a href="/logout">로그아웃</a>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
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
						<li class="dropdown"><a href="#none" class="dropbtn">게시판</a></li>
						<li><a href="#none">고객지원</a></li>
						<li><a href="#none">마이페이지</a></li>
					</ul>
				</nav>
			</header>
			<!-- <main class="intro">
        <div class="inner">
          <div class="heading">
            <h1>The World’s Best fiction site</h1>
            <p>
              당신의 일상을 반디~<br>
              소설과 무제한 친해지리
            </p>
          </div>
        </div>
      </main> -->
			<section class="big-testimonial">
				<div class="inner">
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
				</div>
			</section>
			<!-- 유료 -->
			<section class="ranking pay">
				<div class="inner">
					<div class="ranking-content">
						<c:choose>
							<c:when test="${empty principal }">
								<h2>유료 웹소설 베스트</h2>
							</c:when>
							<c:otherwise>
								<h2>${principal.nickName}님이좋아하는 장르 베스트</h2>
							</c:otherwise>
						</c:choose>
						<div class="row"></div>
						<div class="items">
							<c:forEach items="${novelList1 }" var="novel">
								<div class="item" onclick="location.href='/novel/detail/${novel.id }'" style="cursor: pointer;">
									<div class="up-image">
										<c:choose>
											<c:when test="${novel.cover != null }">
												<img alt="이미지 기간만료" src="/bandi/uploads/${novel.cover }">
											</c:when>
											<c:otherwise>
												<img alt="이미지 없음" src="/assets/images/noimg.jpg">
											</c:otherwise>
										</c:choose>
									</div>
									<div class="down-desc">
										<h3>${novel.title }</h3>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</section>
			<c:if test="${!empty principal }">
				<section class="ranking pay">
					<div class="inner">
						<div class="ranking-content">
							<h2>${principal.nickName}님맞춤 추천리스트</h2>
							<div class="row"></div>
							<div class="items">
								<c:forEach items="${novelList2 }" var="novel">
									<div class="item" onclick="location.href='/novel/detail/${novel.id }'" style="cursor: pointer;">
										<div class="up-image">
											<c:choose>
												<c:when test="${novel.cover != null }">
													<img alt="이미지 기간만료" src="/bandi/uploads/${novel.cover }">
												</c:when>
												<c:otherwise>
													<img alt="이미지 없음" src="/assets/images/noimg.jpg">
												</c:otherwise>
											</c:choose>
										</div>
										<div class="down-desc">
											<h3>${novel.title }</h3>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</section>
			</c:if>
			<section class="vertical-list">
				<div class="list-header">
					<h2>웹소설 통합 랭킹</h2>
				</div>
				<div class="list-body">
					<ul>
						<c:forEach items="${novelList3 }" var="novel" begin="0" end="4">
							<li class="li-item"><a href="#" class="li-link">
									<div class="li-thumbnail">
										<c:choose>
											<c:when test="${novel.cover != null }">
												<img alt="이미지 기간만료" src="/bandi/uploads/${novel.cover }">
											</c:when>
											<c:otherwise>
												<img alt="이미지 없음" src="/assets/images/noimg.jpg">
											</c:otherwise>
										</c:choose>
									</div>
									<div class="li-info-area">
										<p>
											<span class="li-title">${novel.title }</span>
										</p>
										<p>
											<span class="li-desc">${novel.genreName }</span>
										</p>
										<p>
											<span class="li-desc"><i class='bx bxs-star'></i> ${novel.favoriteCount }</span>
										</p>
									</div>
							</a></li>
						</c:forEach>
					</ul>
					<ul>
						<c:forEach items="${novelList3 }" var="novel" begin="5" end="9">
							<li class="li-item"><a href="#" class="li-link">
									<div class="li-thumbnail">
										<c:choose>
											<c:when test="${novel.cover != null }">
												<img alt="이미지 기간만료" src="/bandi/uploads/${novel.cover }">
											</c:when>
											<c:otherwise>
												<img alt="이미지 없음" src="/assets/images/noimg.jpg">
											</c:otherwise>
										</c:choose>
									</div>
									<div class="li-info-area">
										<p>
											<span class="li-title">${novel.title }</span>
										</p>
										<p>
											<span class="li-desc">${novel.genreName }</span>
										</p>
										<p>
											<span class="li-desc"><i class='bx bxs-star'></i> ${novel.favoriteCount }</span>
										</p>
									</div>
							</a></li>
						</c:forEach>
					</ul>
					<ul>
						<c:forEach items="${novelList3 }" var="novel" begin="10" end="14">
							<li class="li-item"><a href="#" class="li-link">
									<div class="li-thumbnail">
										<c:choose>
											<c:when test="${novel.cover != null }">
												<img alt="이미지 기간만료" src="/bandi/uploads/${novel.cover }">
											</c:when>
											<c:otherwise>
												<img alt="이미지 없음" src="/assets/images/noimg.jpg">
											</c:otherwise>
										</c:choose>
									</div>
									<div class="li-info-area">
										<p>
											<span class="li-title">${novel.title }</span>
										</p>
										<p>
											<span class="li-desc">${novel.genreName }</span>
										</p>
										<p>
											<span class="li-desc"><i class='bx bxs-star'></i> ${novel.favoriteCount }</span>
										</p>
									</div>
							</a></li>
						</c:forEach>
					</ul>
			</section>
			<!-- Slider -->
			<section class="testimonial2">
				<div class="inner">
					<div class="testimonial2-content">
						<div class="topSlider">
							<div>
								<p class="top-banner">
									<img src="/assets/images/main/bandi-copy-banner1.jpg">
								</p>
							</div>
							<div>
								<p class="top-banner">
									<img src="/assets/images/main/bandi-copy-banner2.jpg">
								</p>
							</div>
							<div>
								<p class="top-banner">
									<img src="/assets/images/main/bandi-copy-banner3.jpg">
								</p>
							</div>
							<div>
								<p class="top-banner">
									<img src="/assets/images/main/bandi-copy-banner2.jpg">
								</p>
							</div>
							<div>
								<p class="top-banner">
									<img src="/assets/images/main/bandi-copy-banner1.jpg">
								</p>
							</div>
							<div>
								<p class="top-banner">
									<img src="/assets/images/main/bandi-copy-banner3.jpg">
								</p>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section class="vertical-list">
				<div class="list-header">
					<h2>무료소설 인기작</h2>
				</div>
				<div class="list-body">
					<ul>
						<li class="li-item"><a href="#" class="li-link">
								<div class="li-thumbnail">
									<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
								</div>
								<div class="li-info-area">
									<p>
										<span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span>
									</p>
									<p>
										<span class="li-desc">꾸르미르</span>
									</p>
									<p>
										<span class="li-desc">조회수 810</span>
									</p>
								</div>
						</a></li>
						<li class="li-item"><a href="#" class="li-link">
								<div class="li-thumbnail">
									<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
								</div>
								<div class="li-info-area">
									<p>
										<span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span>
									</p>
									<p>
										<span class="li-desc">꾸르미르</span>
									</p>
									<p>
										<span class="li-desc">조회수 810</span>
									</p>
								</div>
						</a></li>
						<li class="li-item"><a href="#" class="li-link">
								<div class="li-thumbnail">
									<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
								</div>
								<div class="li-info-area">
									<p>
										<span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span>
									</p>
									<p>
										<span class="li-desc">꾸르미르</span>
									</p>
									<p>
										<span class="li-desc">조회수 810</span>
									</p>
								</div>
						</a></li>
						<li class="li-item"><a href="#" class="li-link">
								<div class="li-thumbnail">
									<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
								</div>
								<div class="li-info-area">
									<p>
										<span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span>
									</p>
									<p>
										<span class="li-desc">꾸르미르</span>
									</p>
									<p>
										<span class="li-desc">조회수 810</span>
									</p>
								</div>
						</a></li>
						<li class="li-item"><a href="#" class="li-link">
								<div class="li-thumbnail">
									<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
								</div>
								<div class="li-info-area">
									<p>
										<span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span>
									</p>
									<p>
										<span class="li-desc">꾸르미르</span>
									</p>
									<p>
										<span class="li-desc">조회수 810</span>
									</p>
								</div>
						</a></li>
					</ul>
					<ul>
						<li class="li-item"><a href="#" class="li-link">
								<div class="li-thumbnail">
									<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
								</div>
								<div class="li-info-area">
									<p>
										<span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span>
									</p>
									<p>
										<span class="li-desc">꾸르미르</span>
									</p>
									<p>
										<span class="li-desc">조회수 810</span>
									</p>
								</div>
						</a></li>
						<li class="li-item"><a href="#" class="li-link">
								<div class="li-thumbnail">
									<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
								</div>
								<div class="li-info-area">
									<p>
										<span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span>
									</p>
									<p>
										<span class="li-desc">꾸르미르</span>
									</p>
									<p>
										<span class="li-desc">조회수 810</span>
									</p>
								</div>
						</a></li>
						<li class="li-item"><a href="#" class="li-link">
								<div class="li-thumbnail">
									<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
								</div>
								<div class="li-info-area">
									<p>
										<span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span>
									</p>
									<p>
										<span class="li-desc">꾸르미르</span>
									</p>
									<p>
										<span class="li-desc">조회수 810</span>
									</p>
								</div>
						</a></li>
						<li class="li-item"><a href="#" class="li-link">
								<div class="li-thumbnail">
									<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
								</div>
								<div class="li-info-area">
									<p>
										<span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span>
									</p>
									<p>
										<span class="li-desc">꾸르미르</span>
									</p>
									<p>
										<span class="li-desc">조회수 810</span>
									</p>
								</div>
						</a></li>
						<li class="li-item"><a href="#" class="li-link">
								<div class="li-thumbnail">
									<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
								</div>
								<div class="li-info-area">
									<p>
										<span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span>
									</p>
									<p>
										<span class="li-desc">꾸르미르</span>
									</p>
									<p>
										<span class="li-desc">조회수 810</span>
									</p>
								</div>
						</a></li>
					</ul>
					<ul>
						<li class="li-item"><a href="#" class="li-link">
								<div class="li-thumbnail">
									<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
								</div>
								<div class="li-info-area">
									<p>
										<span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span>
									</p>
									<p>
										<span class="li-desc">꾸르미르</span>
									</p>
									<p>
										<span class="li-desc">조회수 810</span>
									</p>
								</div>
						</a></li>
						<li class="li-item"><a href="#" class="li-link">
								<div class="li-thumbnail">
									<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
								</div>
								<div class="li-info-area">
									<p>
										<span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span>
									</p>
									<p>
										<span class="li-desc">꾸르미르</span>
									</p>
									<p>
										<span class="li-desc">조회수 810</span>
									</p>
								</div>
						</a></li>
						<li class="li-item"><a href="#" class="li-link">
								<div class="li-thumbnail">
									<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
								</div>
								<div class="li-info-area">
									<p>
										<span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span>
									</p>
									<p>
										<span class="li-desc">꾸르미르</span>
									</p>
									<p>
										<span class="li-desc">조회수 810</span>
									</p>
								</div>
						</a></li>
						<li class="li-item"><a href="#" class="li-link">
								<div class="li-thumbnail">
									<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
								</div>
								<div class="li-info-area">
									<p>
										<span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span>
									</p>
									<p>
										<span class="li-desc">꾸르미르</span>
									</p>
									<p>
										<span class="li-desc">조회수 810</span>
									</p>
								</div>
						</a></li>
						<li class="li-item"><a href="#" class="li-link">
								<div class="li-thumbnail">
									<img alt="" src="/assets/images/main/bandi-copy-banner2.jpg">
								</div>
								<div class="li-info-area">
									<p>
										<span class="li-title">대뜸 착각당했다 괴물 천재배우로FSDFSFDSFSF</span>
									</p>
									<p>
										<span class="li-desc">꾸르미르</span>
									</p>
									<p>
										<span class="li-desc">조회수 810</span>
									</p>
								</div>
						</a></li>
					</ul>
				</div>
			</section>

			<!-- Slider -->
			<section class="testimonial">
				<div class="inner">
					<div class="testimonial-content">
						<h2>
							태그 <b>추천</b> 작품
						</h2>
						<hr>
						<div class="mySlider">
							<div>
								<p class="client">
									<img src="/assets/images/main/ai1.jpg"> <span><b>나 혼자만 강화술사</b></span>
								</p>
								<p class="comment">세상에 강화템은 많지만 오직 나만이 강화할 수 있다.</p>
								<p class="comment">세상에 강화템은 많지만 오직 나만이 강화할 수 있다.</p>

							</div>
							<div>
								<p class="client">
									<img src="/assets/images/main/ai2.jpg"> <span><b>내 집에 영약 광산이 열렸다</b></span>
								</p>
								<p class="comment">Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt voluptates velit doloribus, iure dolores porro commodi, ipsa corrupti dolorem alias libero quasi enim
									vero tempora et sit in, quaerat consequuntur.</p>
							</div>
							<div>
								<p class="client">
									<img src="/assets/images/main/ai3.jpg"> <span><b>해고 후 상속 대박</b></span>
								</p>
								<p class="comment">Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt voluptates velit doloribus, iure dolores porro commodi, ipsa corrupti dolorem alias libero quasi enim
									vero tempora et sit in, quaerat consequuntur.</p>
							</div>
							<div>
								<p class="client">
									<img src="/assets/images/main/ai1.jpg"> <span><b>나 혼자만 강화술사</b></span>
								</p>
								<p class="comment">Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt voluptates velit doloribus, iure dolores porro commodi, ipsa corrupti dolorem alias libero quasi enim
									vero tempora et sit in, quaerat consequuntur.</p>
							</div>
							<div>
								<p class="client">
									<img src="/assets/images/main/ai2.jpg"> <span><b>내 집에 영약 광산이 열렸다</b></span>
								</p>
								<p class="comment">Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt voluptates velit doloribus, iure dolores porro commodi, ipsa corrupti dolorem alias libero quasi enim
									vero tempora et sit in, quaerat consequuntur.</p>
							</div>
							<div>
								<p class="client">
									<img src="/assets/images/main/ai3.jpg"> <span><b>해고 후 상속 대박</b></span>
								</p>
								<p class="comment">Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt voluptates velit doloribus, iure dolores porro commodi, ipsa corrupti dolorem alias libero quasi enim
									vero tempora et sit in, quaerat consequuntur.</p>
							</div>

						</div>
					</div>
				</div>
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
					<li>We may earn a commission if you purchase an item featured on our site.</li>
					<li>Copyright © 2020 CodingWorks. All rights reserved.</li>
				</ul>
			</div>
		</div>
	</footer>
	<script type="text/javascript">
		$(document).ready(()=>{
			$("#loginBtn").on("click", () => {
				console.log($("#usernameL").val() + "/" + $("#passwordL").val());
				let data = {
						username: $("#usernameL").val(),
						password: $("#passwordL").val()
				};
				
				$.ajax({
					type: "POST",
					url: "/api/login",
					contentType:"application/json; charset=utf-8",
					data: JSON.stringify(data),
					dataType:"json"
				}).done((response) => {
					if(response.data){
						location.reload();
					} else {
						alert(response.message);
					}
				}).fail((error) => {
					console.log(error);
					alert("요청을 처리할 수 없습니다.");
				});
			});

		});
			function logoutNaver() {
				var naverPopUp;
			      naverPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_self", "width=10, height=10, left=-9999, top=-9999, visible=0");
			      naverPopUp.blur();
			      naverPopUp.close();
			      setTimeout(function() {
			         closePopUp1();
			         location.href = "http://localhost/logout";
			      }, 40);
			}
	</script>
	</div>