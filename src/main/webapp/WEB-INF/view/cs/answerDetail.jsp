<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!DOCTYPE html>
<style>
</style>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>반디</title>
<script src="/assets/js/jquery.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="/assets/js/custom-slick.js"></script>
<link rel="stylesheet" href="/assets/css/style.css" />
<link rel="stylesheet" href="/assets/css/admin/admin.css" />
<link rel="stylesheet" href="/assets/css/admin/adminCategory.css" />
<link rel="stylesheet" href="/assets/css/detail.css" />
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
						<li><a href="#none">HOME</a></li>
						<li><a href="#none">소설</a></li>
						<li><a href="#none">공모전</a></li>
						<li class="dropdown"><a href="#none" class="dropbtn">게시판</a></li>
						<li><a href="#none">고객지원</a></li>
						<li><a href="#none">마이페이지</a></li>
					</ul>
				</nav>
			</header>
			<%@include file="layout/csCategory.jsp"%>


			<!-- Q&A detail -->
			<section class="flex-grow-1" id="qna--list--container">
				<div class="section-title-wrap">
					<h2 class="section-title">${question.title}</h2>
				</div>
				<div class="board-detail">
					<h3 class="board-title">
						<span>${question.categoryName}</span>
					</h3>
				</div>
				<span class="board-detail-wrap"> <span class="board-info-wrap"> <span class="profile-info-wrap"> <span class="profile-preview-wrap"></span> <span class="info-inner"> <span
								class="name">${question.username}</span> <span class="date">${question.createdAt()}</span>
						</span> <span class=“btn-right-wrap”> <span class=“modify-wrap”>
									<button type="button" class="btn-modify">삭제</button>
							</span> <span class="list-wrap">
									<button type="submit" class="btn-list">목록</button>
							</span>
						</span>
					</span> <span class="board-contents"> <span id="_board-contents"> ${question.content} </span>
					</span>
				</span>
				</span>

				<!-- 답 -->
				<!-- 답다비답다바답닫답답ㄷ -->
				<div class="reply">
					<div>
						<div class="comments-content">
							<div class="comment-item">
								<div class="mt-2">
									<p class="comment-text">${answer.content}</p>
								</div>
							</div>
						</div>
			</section>
</body>
</html>