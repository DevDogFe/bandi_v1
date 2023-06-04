
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<!-- Slider.js CDN -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<script
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="/assets/js/custom-slick.js"></script>
<!-- 작성한 css는 항상 밑에 있어야함 -->
<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/mypage/sidebar.css" />
<link rel="stylesheet" href="/assets/css/mypage/record.css" />
</head>
<body>
	<div class="container">
		<div class="inner">
			<header>
				<div class="banner">
					<div class="lnb">
						<a href="#none"><em>for</em> member</a> <a href="#none">로그인</a> <a
							href="#none">회원가입</a>
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
			<div class="sectind-flex">
				<section class="left-sidebar">
					<div class="sidebar">
						<div class="logo_content">
							<div class="logo">
								<i class='bx bx-leaf'></i>
								<div class="logo_name">반디</div>
							</div>
						</div>
						<ul class="nav_list">
							<li><a href="/admin/dashboard"> <i class='bx bx-user'></i> <span class="links_name">개인정보</span>
							</a></li>
							<li><a href="/report/reportList"> <i class='bx bx-book-open'></i> <span class="links_name">내 작품</span>
							</a></li>
							<li><a href="/admin/adminCategory"> <i class='bx bx-bookmark'></i> <span class="links_name">즐겨찾기 목록</span>
							</a></li>
							<li><a href="/admin/novelChange"> <i class='bx bx-book-add'></i> <span class="links_name">작품 구매 기록</span>
							</a></li>
							<li><a href="/admin/genre"> <i class='bx bx-book-bookmark'></i>
									<span class="links_name">작품 대여 기록</span>
							</a></li>
							<li><a href="/admin/user"> <i class='bx bx-coin-stack'></i> <span
									class="links_name">골드 충전 기록</span>
							</a></li>
							<li><a href="#"> <i class='bx bx-conversation'></i> <span
									class="links_name">1:1 문의</span>
							</a></li>
						</ul>
					</div>
				</section>
				<section class="main">
					<div class="report-list">
						<div class="main-header">
							<h3 class="mb-2">내 즐겨찾기</h3>
						</div>
						<c:choose>
							<c:when test="${empty favoriteList }">
								<table class="table">
									<thead>
										<tr>
											<th scope="cols">장르</th>
											<th scope="cols">제목</th>
											<th scope="cols">작가</th>
										</tr>
									</thead>
									<tbody class="reportList">
										<tr>
											<td>즐겨찾기에 등록된 작품이 없습니다.</td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</c:when>
							<c:otherwise>
								<table class="table">
									<thead>
										<tr>
											<th scope="cols">장르</th>
											<th scope="cols">제목</th>
											<th scope="cols">작가</th>
										</tr>
									</thead>
									<c:forEach items="${favoriteList }" var="novel">
										<tbody class="reportList">
											<tr>
												<td>${novel.genreName }</td>
												<td><a href="/novel/detail/${novel.id }">${novel.title }</a></td>
												<td>${novel.authorName }</td>
											</tr>
										</tbody>
									</c:forEach>
								</table>
							</c:otherwise>
						</c:choose>
					</div>
				</section>
			</div>
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
					<li>We may earn a commission if you purchase an item featured
						on our site.</li>
					<li>Copyright © 2020 CodingWorks. All rights reserved.</li>
				</ul>
			</div>
		</div>
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>