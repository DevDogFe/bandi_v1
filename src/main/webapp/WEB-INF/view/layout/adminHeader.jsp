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
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="/assets/js/custom-slick.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- 작성한 css는 항상 밑에 있어야함 -->
<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/admin/admin.css" />
</head>
<body>
	<div class="container">
		<div class="inner">
			<header>
				<div class="banner">
					<div class="lnb">
						<a href="#none"><em>for</em> member</a> <a href="#none">로그인</a> <a href="#none">회원가입</a>
					</div>
				</div>
				<nav>
					<div class="logo">
						<a href="#none"><img src="/assets/images/main/bandi-logo3.png"></a>
					</div>
					<ul class="gnb">
						<li><a href="/main">HOME</a></li>
						<li class="dropdown"><a href="#" role="button" id="menuNovel" data-bs-toggle="dropdown" aria-expanded="false">소설</a>
							<ul class="dropdown-menu" aria-labelledby="menuNovel">
								<li><a class="dropdown-item" href="/pay">유료 소설</a></li>
								<li><a class="dropdown-item" href="/free">무료 소설</a></li>
							</ul></li>
						<li><a href="/contest/list">공모전</a></li>
						<li class="dropdown"><a href="#" role="button" id="menuBoard" data-bs-toggle="dropdown" aria-expanded="false">게시판</a>
							<ul class="dropdown-menu" aria-labelledby="menuBoard">
								<li><a class="dropdown-item" href="/board/list/1">자유</a></li>
								<li><a class="dropdown-item" href="/board/list/2">추천</a></li>
								<li><a class="dropdown-item" href="/board/list/3">팬아트</a></li>
								<li><a class="dropdown-item" href="/board/list/4">홍보</a></li>
							</ul></li>
						<li class="dropdown"><a href="/faq/list" role="button">고객지원</a></li>
						<li class="dropdown"><a href="/myInfo" role="button">마이페이지</a></li>
					</ul>
				</nav>
			</header>