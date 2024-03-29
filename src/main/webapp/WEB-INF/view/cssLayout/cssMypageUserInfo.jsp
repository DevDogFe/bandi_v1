
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
<style type="text/css">
	.section-title-wrap:first-child.form-title {
		margin-top: 40px;
	}
	.section-title-wrap.form-title {
		margin-bottom: 16px;
	}
	.section-title-wrap {
		min-height: 32px;
	}
	.right-wrap {
		bottom: 50%;
		position: absolute;
		right: 0;
		-webkit-transform: translateY(50%);
	}
	.icon-required {
		position: relative;
		display: inline-block;
		color: #666;
		padding-left: 11px;
		font-size: 1.4rem;
		letter-spacing: -0.35px;
	}
	.section-title-wrap:after {
		content: "";
		display: block;
		width: 100%;
		height: 0px;
		clear: both;
	}
	.form-wrap {
		padding: 20px 26px;
		border-top: 1px solid #999;
		border-bottom: 1px solid #ededed;
	}
	.form-group:not(last-child), .form-group.row:not(last-child) {
		margin-bottom: 21px;
	}
	.form-group.row {
		margin: 0;
	}
	.row {
		display: flex;
	}
	.form-group .form-label-wrap {
		position: relative;
		width: 125px;
		line-height: 30px;
	}
	.form-group .form-label-wrap .form-label {
		color: #111;
		font-weight: 400;
		font-size: 1.4rem;
		letter-spacing: -0.7px;
	}
	label {
		margin-bottom: 0;
	}
	.form-group .form-label-wrap + .form-value {
		width: calc(100% - 135px);
	}
	.form-group .form-value {
		min-height: 25px;
	}
	.profile-img-upload-wrap.has-email {
		padding-left: 0;
	}
	.profile-img-upload-wrap {
		position: relative;
		display: inline-block;
		text-align: center;
	}
	.profile-img-upload-wrap .profile-preview-wrap {
		width: 86px;
		height: 86px;
		border-radius: 43px;
		background-position: 50% 50%;
	}
	.profile-preview-wrap {
		position: relative;
		display: inline-block;
		overflow: hidden;
		background-image: url(/assets/images/board/profile.png);
		border: 1px solid #ddd;
		border-radius: 33px;
		background-repeat: no-repeat;
		font-size: 0;
		background-position: 50% 50%;
	}
	.my-profile-form .form-group.my-profile-img .form-value.profile-img .btn-wrap {
   		font-size: 0;
	}
	.profile-img-upload-wrap .btn-wrap {
	    text-align: left;
	    margin-top: 13px;
	    margin-left: 19px;
	}
	.my-profile-form .form-group.my-profile-img .form-value.profile-img .btn-wrap .upload-btn-wrap {
	    overflow: hidden;
	    margin: 0 0 0 5px;
	    position: relative;
	    top: auto;
	    right: auto;
	    vertical-align: top;
	}	
	.profile-img-upload-wrap.has-email .email {
	    margin-top: 12px;
	    font-size: 1.4rem;
	    letter-spacing: -0.35px;
	}
	.profile-img-upload-wrap:after {
	    content: '';
	    display: block;
	    width: 100%;
	    height: 0px;
	    clear: both;
	}
	.form-group .form-label-wrap {
	    position: relative;
	    width: 125px;
	    line-height: 30px;
	}
	.form-group .form-label-wrap .form-label {
	    color: #111;
	    font-weight: 400;
	    font-size: 1.4rem;
	    letter-spacing: -0.7px;
	}
	.my-profile-form .form-group .form-value.has-btn input[type=text] {
		width: 318px;
	}
	.form-group .form-value.has-btn input[type=text] {
		float: left;
		height: 32px;
		line-height: 30px;
	}
	input[type=text] {
		background: #fff;
		padding: 0 10px;
		border: 1px solid #d5d5d5;
		border-radius: 4px;
		font-size: 1.4rem;
		font-weight: 300;
		-webkit-appearance: none;
	}
	my-profile-form .form-group .form-value.has-btn:after {
	    content: '';
	    display: block;
	    width: 100%;
	    height: 0px;
	    clear: both;
	}
</style>
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
					<div class="reportList">
						<div class="section-title-wrap form-title">
							<h2 class="section-title">내정보</h2><span class="more"><a href="/update">내 정보 수정</a></span>
							<div class="right-wrap">
								<span class="icon-required"></span>
							</div>
						</div>
						<div class="form-wrap my-profile-form">
							<div class="form-group row my-profile-img my-info-memo">
								<div class="form-label-wrap">
									<label class="form-label">프로필</label>
								</div>
								<span class="form-value profile-img">
									<span class="profile-img-upload-wrap has-email">
										<span class="profile-preview-wrap has-profile" style="background-image: url(/assets/images/board/profile.png);"></span>
										<span class="btn-wrap">
											<span class="email">${principal.email}</span>
										</span>
									</span>
								</span>
							</div>
							<div class="form-group row">
								<div class="form-label-wrap">
									<label for="inputId" class="form-label">아이디</label>
								</div>
								<div class="form-value has-btn">
									<input type="text" maxlength="10" value="${principal.username}" readonly="readonly">
								</div>
							</div>
							<div class="form-group row">
								<div class="form-label-wrap">
									<label for="inputNick" class="form-label">닉네임</label>
								</div>
								<div class="form-value has-btn">
									<input type="text" maxlength="10" value="${principal.nickName}" readonly="readonly">
								</div>
							</div>
							<div class="form-group row">
								<div class="form-label-wrap">
									<label for="inputBirth" class="form-label">생년월일</label>
								</div>
								<div class="form-value">
									<input type="text" maxlength="8" value="${principal.gender}" readonly="readonly">
								</div>
							</div>
							<div class="form-group row">
								<div class="form-label-wrap">
									<label for="rdoGenderMan" class="form-label">성별</label>
								</div>
								<div class="form-value">
									<input type="text" maxlength="8" value="성별" readonly="readonly">
								</div>
							</div>
							<div class="form-group row">
								<div class="form-label-wrap">
									<label for="gold" class="form-label">골드</label>
								</div>
								<div class="form-value">
									${gold}
								</div>
							</div>
						</div>
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