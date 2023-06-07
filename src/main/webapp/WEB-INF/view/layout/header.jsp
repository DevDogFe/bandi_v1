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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />

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
						<div class="mb-3 d-flex justify-content-between">
							<div>
								<button type="button" id="loginBtn" class="btn btn-primary">Login</button>
							</div>
							<div>
								<a href="/user">회원가입</a>&nbsp;&nbsp; <a href="/findIdAndPwd" onclick="window.open(this.href, '_blank', 'width=500, height=600'); return false;">아이디/비밀번호 찾기</a>
							</div>
						</div>
						<div class="d-flex justify-content-between external--login--btn">
							<a href="https://kauth.kakao.com/oauth/authorize?client_id=f2f5ec106cf03cddc10930e8d7c58d68&redirect_uri=http://localhost/auth/kakao/callback&response_type=code"> <img alt="카카오로그인"
								src="/assets/images/kakao_login/ko/kakao_login_medium_narrow.png">
							</a> <a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=BbvLPxHgxKiCdntADysv&redirect_uri=http://localhost/naver/auth&state=test"><img height="50"
								src="/assets/images/naver_login/btnG.png" /></a>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="inner">
			<header>
				<div class="banner">
					<div class="lnb">
						<c:if test="${principal.userRole == 1}">
							<a href="/admin/dashboard">관리자페이지</a>
						</c:if>
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
					</div>
				</div>
				<nav>
					<div class="logo">
						<a href="/main"><img src="/assets/images/main/bandi-logo3.png"></a>
					</div>
					<ul class="gnb">
						<li><a href="/main">HOME</a></li>
						<li class="dropdown"><a href="#" role="button" id="menuNovel" data-bs-toggle="dropdown" aria-expanded="false">소설</a>
							<ul class="dropdown-menu" aria-labelledby="menuNovel">
								<li><a class="dropdown-item" href="/pay">유료 소설</a></li>
								<li><a class="dropdown-item" href="/free">무료 소설</a></li>
								<li><a class="dropdown-item" href="/best">베스트</a></li>
							</ul></li>
						<li><a href="/contest/list">공모전</a></li>
						<li class="dropdown"><a href="#" role="button" id="menuBoard" data-bs-toggle="dropdown" aria-expanded="false">게시판</a>
							<ul class="dropdown-menu" aria-labelledby="menuBoard">
								<li><a class="dropdown-item" href="/board/list/1">자유</a></li>
								<li><a class="dropdown-item" href="/board/list/2">추천</a></li>
								<li><a class="dropdown-item" href="/board/list/3">팬아트</a></li>
								<li><a class="dropdown-item" href="/board/list/4">홍보</a></li>
							</ul></li>
						<li class="dropdown"><a href="/faq/list">고객지원</a></li>
						<li class="dropdown"><a href="/myInfo">마이페이지</a></li>
					</ul>
				</nav>
			</header>