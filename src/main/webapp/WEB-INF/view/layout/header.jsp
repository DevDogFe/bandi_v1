<%@page import="com.bandi.novel.model.BoardType"%>
<%@page import="java.util.List"%>
<%@page import="com.bandi.novel.service.BoardService"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="com.bandi.novel.utils.Define"%>
<%@page import="com.bandi.novel.model.User"%>
<%@page import="com.bandi.novel.service.PayService"%>
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
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link href="/assets/images/bandi2.png" rel="shortcut icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<title>반디</title>


<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

section {
	width: 1300px;
	margin: 0 auto;
}

ul {
	list-style: none;
	-webkit-padding-start: 0;
}

a {
	text-decoration: none;
	color: black;
}

.header--top {
	padding: 5px 50px;
	background-color: darkcyan;
	text-align: right;
	width: 100%;
}

.header--top a {
	color: white;
}

.header--bottom {
	width: 80%;
}

#headerLogo {
	width: 100px;
	margin-right: 50px;
}

.header--menu {
	width: 170px;
}

.nav--style {
	margin-top: 20px;
}

.nav--menu {
	font-size: 20px;
	font-weight: bold;
	padding: 5px 30px;
	text-align: center;
}

.nav--panel {
	display: none;
	padding: 5px auto;
	text-align: center;
	position: absolute;
	width: 170px;
	background-color: white;
	border-radius: 0 0 5px 5px;
}

.nav--panel li {
	margin-bottom: 3px;
	font-weight: bold;
}

.login--btn {
	background-color: none;
	border: none;
	color: white;
}

.login--btn:hover {
	color: white;
}
</style>
</head>

<body>
	<%
	WebApplicationContext wac = WebApplicationContextUtils
			.getWebApplicationContext(((HttpServletRequest) request).getSession().getServletContext());
	PayService payService = wac.getBean(PayService.class);
	BoardService boardService = wac.getBean(BoardService.class);
	List<BoardType> boardTypeList = boardService.selectBoardType();
	User principal = (User) session.getAttribute(Define.PRINCIPAL);
	Integer gold = null;
	if (principal != null) {
		gold = payService.selectUserGold(principal.getId());
	}
	%>

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
							<label for="username" class="form-label">ID</label> <input type="text" class="form-control" name="username" id="usernameL" required="required" value="qwe">
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">Password</label> <input type="password" class="form-control" name="password" id="passwordL" required="required" value="123">
						</div>
						<div class="mb-3 form-check">
							<input type="checkbox" class="form-check-input" id="remember" name="remember"> <label class="form-check-label" for="remember">Check me out</label>
						</div>
						<button type="button" id="loginBtn" class="btn btn-primary">Login</button>
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

	<header class="d-flex flex-column align-items-center">
		<div class="header--top">
			<c:if test="${principal != null }">
				<button type="button" class="login--btn btn">${principal.nickName }님
					반갑습니다. (골드:
					<%=gold%>G )
				</button>
			</c:if>
			<c:if test="${principal.userRole.equals(\"admin\") }">
				<button type="button" class="login--btn btn" onclick="location.href='/admin/adminPage'">관리자 페이지</button>
			</c:if>
			<button type="button" class="login--btn btn" onclick="location.href='/payment/charge'">골드충전</button>
			<c:choose>
				<c:when test="${empty principal}">
					<button type="button" class="login--btn btn" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</button>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${\"kakao\".equals(principal.external)}">
							<button onclick="location.href='https://kauth.kakao.com/oauth/logout?client_id=f2f5ec106cf03cddc10930e8d7c58d68&logout_redirect_uri=http://localhost/logout'" class="login--btn btn">로그아웃</button>
						</c:when>
						<c:otherwise>
							<button onclick="location.href='/logout'" class="login--btn btn">로그아웃</button>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="header--bottom d-flex">
			<div>
				<img src="/assets/images/bandi-removebg.png" alt="" id="headerLogo">
			</div>
			<div class="flex-grow-1">
				<nav class="d-flex justify-content-around nav--style">
					<div id="novel" class="header--menu text-center">
						<div class="nav--menu">
							<a href="#">소설</a>
						</div>
						<ul id="novelPanel" class="nav--panel">
							<li><a href="/pay">유료소설</a></li>
							<li><a href="/free">무료소설</a></li>
						</ul>
					</div>
					<div id="contest" class="header--menu text-center">
						<div class="nav--menu">
							<a href="/contest/list">공모전</a>
						</div>
						<!-- <ul id="contestPanel" class="nav--panel">
							<li><a href="#">공지</a></li>
							<li><a href="#">출품작 보기</a></li>
						</ul> -->
					</div>
					<div id="best" class="header--menu text-center">
						<div class="nav--menu">
							<a href="/best">베스트</a>
						</div>
						<!-- <ul id="contestPanel" class="nav--panel">
							<li><a href="#">공지</a></li>
							<li><a href="#">출품작 보기</a></li>
						</ul> -->
					</div>
					<div id="board" class="header--menu text-center">
						<div class="nav--menu">
							<a href="/board/list">게시판</a>
						</div>
						<ul id="boardPanel" class="nav--panel">
							<%
							for (int i = 0; i < boardTypeList.size(); i++) {
							%>
							<li><a href="/board/list/<%=boardTypeList.get(i).getId()%>"><%=boardTypeList.get(i).getBoardName()%>게시판</a></li>
							<%
							}
							%>
						</ul>
					</div>
					<div id="cs" class="header--menu text-center">
						<div class="nav--menu">
							<a href="/qna/list">고객지원</a>
						</div>
						<ul id="csPanel" class="nav--panel">
							<li><a href="/qna/list">Q&A</a></li>
							<li><a href="/faq/list">FAQ</a></li>
						</ul>
					</div>
					<div id="myPage" class="header--menu text-center">
						<div class="nav--menu">
							<a href="/myInfo">마이페이지</a>
						</div>
						<ul id="myPagePanel" class="nav--panel">
							<li><a href="/myInfo">내 정보 조회</a></li>
							<li><a href="/library">내 서재</a></li>
							<li><a href="/purchase">구매기록</a></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>

	</header>

	<script type="text/javascript">
		$(document).ready(()=>{
			$("#loginBtn").on("click", () => {
				
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
					console.log(response);
					location.reload();
				}).fail((error) => {
					console.log(error);
					alert("요청을 처리할 수 없습니다.");
				});
			});
		});
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>