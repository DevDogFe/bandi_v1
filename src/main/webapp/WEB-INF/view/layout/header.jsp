<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
	<link href="/assets/images/bandi2.png" rel="shortcut icon">
    <title>반디</title>

    <!-- Bootstrap core CSS -->
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link href="/assets/images/bandi2.png" rel="shortcut icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<title>반디</title>

<!-- Bootstrap core CSS -->
<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Additional CSS Files -->
<link rel="stylesheet" href="/assets/css/fontawesome.css">
<link rel="stylesheet" href="/assets/css/templatemo-cyborg-gaming.css">
<link rel="stylesheet" href="/assets/css/owl.css">
<link rel="stylesheet" href="/assets/css/animate.css">
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
<style type="text/css">

.login--btn {
	border: none;
}
</style>
</head>

<body>

	<!-- ***** Preloader Start ***** -->
	<div id="js-preloader" class="js-preloader">
		<div class="preloader-inner">
			<span class="dot"></span>
			<div class="dots">
				<span></span> <span></span> <span></span>
			</div>
		</div>
	</div>
	<!-- ***** Preloader End ***** -->

	<!-- Modal -->
	<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="loginModalLabel">로그인</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="/login" method="post">
						<div class="mb-3">
							<label for="username" class="form-label">ID</label> <input type="text" class="form-control" name="username" id="username" required="required" value="qwe">
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">Password</label> <input type="password" class="form-control" name="password" id="password" required="required" value="123">
						</div>
						<div class="mb-3 form-check">
							<input type="checkbox" class="form-check-input" id="remember" name="remember"> <label class="form-check-label" for="remember">Check me out</label>
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
						<br> <a href="/user">회원가입</a> <br> <a
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
	<!-- ***** Header Area Start ***** -->
	<header class="header-area header-sticky">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav class="main-nav">
						<!-- ***** Logo Start ***** -->
						<a href="/main" class="logo"> <img src="/assets/images/logo.png" alt="">
						</a>
						<!-- ***** Logo End ***** -->
						<!-- ***** Search End ***** -->
						<div class="search-input">
							<form id="search" action="#">
								<input type="text" placeholder="Type Something" id='searchText' name="searchKeyword" onkeypress="handle" /> <i class="fa fa-search"></i>
							</form>
						</div>
						<!-- ***** Search End ***** -->
						<!-- ***** Menu Start ***** -->

						<ul class="nav">
							<li><a href="/main" class="active">Home</a></li>
							<c:choose>
								<c:when test="${empty principal}">
									<button type="button" class="login--btn btn" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</button>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${principal.external == true }">
											<button onclick="location.href='https://kauth.kakao.com/oauth/logout?client_id=f2f5ec106cf03cddc10930e8d7c58d68&logout_redirect_uri=http://localhost/logout'" class="login--btn btn">로그아웃</button>
										</c:when>
										<c:otherwise>
											<button onclick="location.href='/logout'" class="login--btn btn">로그아웃</button>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
							<li><a href="/browse">Browse</a></li>
							<li><a href="/details">Details</a></li>
							<li><a href="/streams">Streams</a></li>
							<li><a href="/profile">Profile <img src="/assets/images/profile-header.jpg" alt=""></a></li>
						</ul>
						<a class='menu-trigger'> <span>Menu</span>
						</a>
						<!-- ***** Menu End ***** -->
					</nav>
				</div>
			</div>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	</header>

  <!-- ***** Header Area Start ***** -->
  <header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="/main" class="logo">
                        <img src="/assets/images/logo.png" alt="">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Search End ***** -->
                    <div class="search-input">
                      <form id="search" action="#">
                        <input type="text" placeholder="Type Something" id='searchText' name="searchKeyword" onkeypress="handle" />
                        <i class="fa fa-search"></i>
                      </form>
                    </div>
                    <!-- ***** Search End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li><a href="/main" class="active">Home</a></li>
                        <li><a href="/browse">Browse</a></li>
                        <li><a href="/details">Details</a></li>
                        <li><a href="/streams">Streams</a></li>
                        <li><a href="/profile">Profile <img src="/assets/images/profile-header.jpg" alt=""></a></li>
                    </ul>   
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
  </header>
