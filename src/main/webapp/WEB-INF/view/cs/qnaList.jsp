<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<%-- <%@include file="../layout/header.jsp"%>--%>
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
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="/assets/js/custom-slick.js"></script>
<!-- 작성한 css는 항상 밑에 있어야함 -->
<link rel="stylesheet" href="/assets/css/style.css" />
<link rel="stylesheet" href="/assets/css/cs/qnaList.css" />
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
			<!-- header end --------------------------------------------------------->


			<%@include file="layout/csCategory.jsp"%>

			<!-- 검색 -->
			<div class="search--qna--form">
				<form action="/qna/list" method="get">
					<div class="search-qna">

						<select class="selectbox" name="faqCategoryId">
							<option value="0">카테고리</option>
							<c:forEach var="category" items="${faqCategorylist}">
								<option value="${category.id}">${category.categoryName}</option>
							</c:forEach>
						</select>
						<div class="search">
							<input type="text" name="keyword"> <label class="searchlabel">title</label> <span class="search-span"></span>
						</div>
						<button class="qna--submit" type="submit">검색</button>
					</div>
				</form>
			</div>
			<!-- 검색 end -->

			<div class="qna--container">
				<br>
				<div class="qna--table">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">NO</th>
								<th scope="col">카테고리</th>
								<th scope="col">질문제목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일</th>
							</tr>
						</thead>
						<tbody>

							<!-- 질문 -->
							<c:forEach var="qna" items="${qnaPageUtil.content}">
								<tr>
									<td>${qna.id}</td>
									<td>${qna.categoryName}</td>
									<td><a href="/qna/question/${qna.id}">${qna.title}</a></td>
									<td>${qna.nickName()}</td>
									<td>${qna.createdAt()}</td>
								</tr>

								<!-- 답 TODO-->
								<c:if test="${qna.answer != null}">
									<tr class="qna--answer">
										<td colspan="2"><a href="/qna/answer/${qna.id}">[RE]: ${qna.title}</a></td>
										<td></td> 
										<td>관리자</td>
										<td>${qna.answerCreatedAt()}</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<br>
				<div class="qna--bottom">
					<div class="qna--button">
						<button onclick="location.href='/qna/write'">
							 문의하기
						</button>
					</div>
				</div>

				<!-- 페이징 처리 -->
				<div class="qna--page">
					<div>
						<ul class="d-flex">
							<li class="<c:if test='${qnaPageUtil.currentPage == 1}'>d-none</c:if>"><a href="/qna/list?currentPage=${qnaPageUtil.currentPage - 1}" class="page-link">Previous</a></li>
							<c:forEach var="pNo" begin="${qnaPageUtil.startPage}" end="${qnaPageUtil.endPage}" step="1">
								<li <c:if test="${pNo == qnaPageUtil.currentPage}">class="active"</c:if>><a href="/qna/list?currentPage=${pNo}" class="page-link">${pNo}</a></li>
							</c:forEach>
							<li class="<c:if test='${qnaPageUtil.endPage == qnaPageUtil.currentPage }'>d-none</c:if>"><a href="/qna/list?currentPage=${qnaPageUtil.currentPage + 1}" class="page-link">Next</a></li>
						</ul>
					</div>
				</div>
				<!-- 페이징 처리 끝 -->
			</div>
			<!-- -------------------------------- -->
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
              <li>We may earn a commission if you purchase an item 
                featured on our site.</li>
              <li>Copyright ©  2020 CodingWorks. All rights reserved.</li>
            </ul>
          </div>
        </div>
      </footer>  