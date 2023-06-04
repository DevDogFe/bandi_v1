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
<!-- 작성한 css는 항상 밑에 있어야함 -->
<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/admin/admin.css" />
<link rel="stylesheet" href="/assets/css/admin/adminCategory.css" />
<link rel="stylesheet" href="/assets/css/detail.css" />

</head>
<style>
.qna--detail--container {
	margin-left: 10px;
}
</style>
<body>
	<div class="container">
		<div class="inner">
			<header>
				<div class="banner">
					<div class="lnb">
						<a href="#none"><em>for</em> admin</a> <a href="#none">로그인</a> <a href="#none">회원가입</a>
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
		</div>
		<div class="sectind-flex">
			<section>
				<div class="sidebar">
					<div class="logo_content">
						<div class="logo">
							<i class='bx bx-leaf'></i>
							<div class="logo_name">반디</div>
						</div>
					</div>
					<ul class="nav_list">
						<li><a href="/admin/dashboard"> <i class='bx bx-chalkboard'></i> <span class="links_name">대시보드</span>
						</a></li>
						<li><a href="/report/reportList"> <i class='bx bxs-bell-minus'></i> <span class="links_name">신고 게시물 처리</span>
						</a></li>
						<li><a href="/admin/adminCategory"> <i class='bx bx-bookmark-alt-plus'></i> <span class="links_name">카테고리 관리</span>
						</a></li>
						<li><a href="/admin/novelChange"> <i class='bx bx-book-reader'></i> <span class="links_name">소설 타입 변경</span>
						</a></li>
						<li><a href="/admin/genre"> <i class='bx bx-book-add'></i> <span class="links_name">장르 관리</span>
						</a></li>
						<li><a href="/admin/user"> <i class='bx bx-user'></i> <span class="links_name">사용자 변경</span>
						</a></li>
						<li><a href="/admin/faqList"> <i class='bx bx-conversation'></i> <span class="links_name">자주 묻는 질문</span>
						</a></li>
						<li><a href="/admin/qnaList"> <i class='bx bx-message-square-dots'></i> <span class="links_name">Q&A</span>
						</a></li>
						<li><a href="/admin/applicationList"> <i class='bx bx-message-square-dots'></i> <span class="links_name">연재 문의</span>
						</a></li>
					</ul>
				</div>
			</section>

			<!-- Q&A detail -->	
			
			
			
			 <section class="one-tab-list">
				 <div class="qna--detail--container">
					<!-- 카테고리 -->
					<div class="section-title-wrap">
						<h2 class="section-title">${question.categoryName}</h2>
					</div>

					<!-- detail -->
					<div class="board-detail">
						<h3 class="board-title">
							<span>${question.title}</span>
						</h3>
					</div>

					<span class="board-detail-wrap"> <!-- 사용자정보 + 삭제 목록 버튼  +  글 디테일--> <span class="board-info-wrap"> <!-- 사용자정보 + 삭제 목록 버튼 --> <span class="profile-info-wrap"> <!-- 사용자정보 --> <span
								class="profile-preview-wrap"></span> <span class="info-inner"> <span class="name">${question.username}</span> <span class="date">${question.createdAt()}</span>
							</span> <!--  --> <span class="btn-right-wrap">
									<button class="btn-report">삭제</button>
									<button type="button" class="btn-modify">목록</button>
							</span>
						</span> <!--  -->
						<!-- 글 디테일 -->
						<span class="board-contents">
						<span id="_board-contents">
						${question.content}
						</span>
					</span> 
					</span> 
					<span class="reaction-wrap"></span>
					</span> 
					<!--  -->

					<!-- 답변 -->
					<div class="answer--detail--form  ">
						<c:choose> 
 							<c:when test="${answer == null}">
								<form action="/admin/answer/${question.id}" method="post">
									<button>답변등록</button>
									<textarea rows="10" cols="100" name="content"></textarea>									
								</form>
							</c:when> 						
							<c:otherwise> 
 	<%-- 							<h4>답변</h4>
								<ul>
									<li>${answer.content}</li>
									<li>${answer.createdAt}</li>
								</ul>
								<a href="/admin/answer/update/${question.id}">수정</a>
								<a href="/admin/answer/delete/${question.id}">삭제</a>  --%>
								
													<!-- 카테고리 -->
				<div class="section-title-wrap">
						<h2 class="section-title">답 Answer</h2>
					</div>  

				<!-- detail -->
					<div class="board-detail">
						<h3 class="board-title">
							<span>답</span>
						</h3> 
					</div>

					<span class="board-detail-wrap"> 
					<!-- 사용자정보 + 삭제 목록 버튼  +  글 디테일--> 
					<span class="board-info-wrap">
					<!-- 사용자정보 + 삭제 목록 버튼 -->
					<span class="profile-info-wrap">
					<!-- 사용자정보 -->
					<!-- <span class="profile-preview-wrap"></span> -->
					<span class="info-inner"> 
					<span class="name">${question.username}</span>
					<span class="date">${question.createdAt()}</span>
				    </span> 
				    <!--  --> 
				    <span class="btn-right-wrap">
						<button class="btn-report">수정</button>
						<button type="button" class="btn-modify">삭제</button>
					</span>
					</span>
					<!--  -->
					<!-- 글 디테일 -->
					<span class="board-contents">
					<span id="_board-contents">
					Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
					labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
					velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. </span>
					</span> 
					</span>
					<span class="reaction-wrap"></span>
					</span>
								
								
								
								
								
								
														
							</c:otherwise>
						</c:choose> 
						
						
					</div>

		 		</div>
 





				<%-- <ul>
					<li>${question.title}</li>
					<li>${question.categoryName}</li>
					<li>${question.username}</li>
					<li>${question.content}</li>
					<li>${question.proceed}</li>
					<li>${question.createdAt()}</li>
				</ul>

				<c:choose>
					<c:when test="${answer == null}">
						<form action="/admin/answer/${question.id}" method="post">
							<textarea rows="20" cols="50" name="content"></textarea>
							<button>답변등록</button>
						</form>
					</c:when>
					<c:otherwise>
						<h3>답변</h3>
						<ul>
							<li>${answer.content}</li>
							<li>${answer.createdAt}</li>
						</ul>
						<a href="/admin/answer/update/${question.id}">수정</a>
						<a href="/admin/answer/delete/${question.id}">삭제</a>
					</c:otherwise>
				</c:choose> --%>

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


</body>
</html>