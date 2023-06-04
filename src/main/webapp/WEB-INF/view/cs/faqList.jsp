<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<%-- <%@include file="../layout/header.jsp"%> --%>


<style>
.faq--answer {
	display: none;
	box-sizing: content-box;
	background-color: #f1f1f1;
}

.faq--category ul {
	display: flex;
	flex-wrap: wrap;
	text-align: center;
	margin: 0;
}

.faq--category ul li {
	width: 25%;
	border: 1px solid #d1d4d6;
	margin: 0px;
	padding: 10px 0px;
}

/* .faq--category ul :hover {
	border: 1px solid #3b6bc9;	
} */

.faq--list {
	border: 1px solid #d1d4d6;
	border-bottom: none;
}

.faq--list dt {
	padding: 10px;
}

.faq--list dt {
	border: 1px solid #d1d4d6;
	height: 48px;
	font-weight: bold;
	display: flex;
}

.faq--list dd {
	border: 1px solid #d1d4d6;
	height: 48px;
	margin-bottom: 0;
	padding: 10px;
}

.faq--question {
	display: flex;
}

.category--line {
	justify-content: space-between;
}

.faq--page {
	display: flex;
	justify-content: center;
}
</style>
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
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="/assets/js/custom-slick.js"></script>
<!-- 작성한 css는 항상 밑에 있어야함 -->
<link rel="stylesheet" href="/assets/css/style.css" />
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
			<div class="faq--category">
				<ul>
					<li><a href="/faq/list">전체</a></li>
					<c:forEach var="category" items="${faqCategoryList}">
						<li><a href="/faq/list/${category.id}">${category.categoryName}</a></li>
					</c:forEach>
				</ul>
			</div>
			<br>


			<div class="faq--list">
				<!-- 질문 & 답 내용 -->
				<dl class="faq--content">
					<c:forEach var="faq" items="${faqPageUtil.content}">
						<dt class="category--line" onclick="openCloseAnswer(${faq.id})">
							<span>[${faq.categoryName}]&nbsp;${faq.question}</span><a class="faq--question" id="que-${faq.id}"> <span id="toggle-${faq.id}" class="material-symbols-outlined">expand_more </span>
							</a>
						</dt>
						<!-- 답 -->
						<dd class="faq--answer" id="ans-${faq.id}">
							<p>${faq.answer}</p>
						</dd>
					</c:forEach>
				</dl>
			</div>

			<!-- 페이징 처리 -->
			<div class="faq--page mt-2">
				<div>
					<ul class="d-flex">
						<li class="<c:if test='${faqPageUtil.currentPage == 1}'>d-none</c:if>"><a href="/faq/list?currentPage=${faqPageUtil.currentPage - 1}" class="page-link">Previous</a></li>
						<c:forEach var="pNo" begin="${faqPageUtil.startPage}" end="${faqPageUtil.endPage}" step="1">
							<li <c:if test="${pNo == faqPageUtil.currentPage}">class="active"</c:if>><a href="/faq	/list?currentPage=${pNo}" class="page-link">${pNo}</a></li>
						</c:forEach>
						<li class="<c:if test='${faqPageUtil.endPage == faqPageUtil.currentPage }'>d-none</c:if>"><a href="/faq/list?currentPage=${faqPageUtil.currentPage + 1}" class="page-link">Next</a></li>
					</ul>
				</div>
			</div>

			<!---------------------------------  -->
		</div>
	</div>
	</section>


	<script>	
	 const items = document.querySelectorAll('.question');
	
	 function openCloseAnswer(id) {
	   console.log(id);	   
	   const answerId = document.getElementById('que-' + id).id.replace('que', 'ans');
	
	   if(document.getElementById(answerId).style.display === 'block') {
	     document.getElementById(answerId).style.display = 'none';
	     document.getElementById('toggle-'+id ).innerText = 'expand_more';
	   } else {
	     document.getElementById(answerId).style.display = 'block';
	     document.getElementById('toggle-'+id).innerText = 'expand_less';
	   }
	 }
	
 </script>


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
					제목 줄은 a없이
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
	</div>
	</div>