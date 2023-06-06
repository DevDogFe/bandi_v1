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
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
    <script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="/assets/js/custom-slick.js"></script>
    <!-- 작성한 css는 항상 밑에 있어야함 -->
    <link rel="stylesheet" href="/assets/css/list.css" />
  </head>
  <body>
    <div class="container">
    	<div class="inner">
      	<header>
        	<div class="banner">
          		<div class="lnb">
            		<a href="#none"><em>for</em> member</a>
            		<a href="#none">로그인</a>
            		<a href="#none">회원가입</a>
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
            		<li class="dropdown">
              			<a href="#none" class="dropbtn">게시판</a>
            		</li>
            		<li><a href="#none">고객지원</a></li>
            		<li><a href="#none">마이페이지</a></li>
          		</ul>
        	</nav>
      </header>
      <section class="top-banner">
			<div class="big-testimonial-content">
					<div class="bigSlider">
						<div>
							<p class="big-banner">
								<img src="/assets/images/main/topSlider.png">
							</p>
						</div>
						<div>
							<p class="big-banner">
								<img src="/assets/images/main/topSlider2.png">
							</p>
						</div>
						<div>
							<p class="big-banner">
								<img src="/assets/images/main/topSlider.png">
							</p>
						</div>
						<div>
							<p class="big-banner">
								<img src="/assets/images/main/topSlider2.png">
							</p>
						</div>
					</div>
				</div>
				<div class="mini-banners">
					<div class="contest-mini-banner">
						<a href="/payment/charge"><img src="/assets/images/main/gold-charge.png"></a>
					</div>
					<div class="contest-mini-banner">
						<img src="/assets/images/main/author-banner.png">
					</div>
					<div class="contest-mini-banner">
						<img src="/assets/images/main/contest-banner3.png">
					</div>
				</div>
		</section>
      <section class="top-wrap">
      	<div class="top-wrap-content">      	
      		<div class="top-wrap-nav">
      			<div class="d-flex novel-type">
      				<h1>공모전</h1>
      				<c:if test="${principal.userRole == 1}">
      					<a href="/contest/registration" class="board-type-item d-flex align-items-center ms-3"><span class="blue-span">작성하기</span></a>
      				</c:if>
      			</div>
      		</div>
      	</div>
      </section>
      <section class="one-tab-list">
      	<ul class="board-list">
      		<c:forEach var="contest" items="${contestList}" varStatus="vs" >
      		<li>
   				<div class="border-list-item">
   					<a href="/contest/novel/list?contestId=${contest.id}">
   					<div class="border-list-content">
    					<div class="board-list-title">${contest.title}</div>
    					<div class="board-list-desc">
    						<span class="blue-span list-desc-span">${contest.nickName}</span> 
    						<span class="list-desc-span">${contest.beginCreatedAt()} ~ ${contest.endCreatedAt()}</span>
    					</div>
   					</div>
   					</a>
   					<div class="border-list-buttons">
    					<div>
    						<button type="button" class="btn btn-primary m-1"
               				data-bs-toggle="modal" data-bs-target="#Modal${vs.index+1}">보기</button>
               			</div>
               			<c:if test="${principal.userRole == 1}">
    						<div>
    							<button onclick="location.href='/contest/delete/${contest.id}'"
								type="button" class="btn btn-danger m-1">삭제</button>
							</div>
						</c:if>
   					</div>
   				</div>
      		</li>
      		</c:forEach>
      	</ul>
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
              <li>We may earn a commission if you purchase an item 
                featured on our site.</li>
              <li>Copyright ©  2020 CodingWorks. All rights reserved.</li>
            </ul>
          </div>
        </div>
      </footer>
      <!-- Modal -->
			<c:forEach var="contest" items="${contestList}" varStatus="vs">
				<div class="modal fade" id="Modal${vs.index+1}" tabindex="-1"
					aria-labelledby="ModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<form action="/contest/update" method="post">
							<div class="modal-body text-break">
								<div class="row">
								<c:choose>
									<c:when test="${principal.userRole == 1}">
										<div class=" align-self-center">
											<ul>
												<li>
													<label for="title" class="form-label">시작일</label> 
													<input type="text" id="title" name="beginCreatedAt" class="form-control"
													required="required" value="${contest.beginCreatedAt}" >
												</li>
												<li>
													<label for="title" class="form-label">종료일</label> 
													<input type="text" id="title" name="endCreatedAt" class="form-control"
													required="required" value="${contest.endCreatedAt}">
												</li>
												<li>
													<label for="title" class="form-label">제목</label> 
													<input type="text" id="title" name="title" class="form-control"
													required="required" value="${contest.title}">
												</li>
												<li>
													<label for="overview" class="form-label">모집 요강</label>
													<textarea id="overview" name="content" class="form-control" required="required" 
													rows="10" >${contest.content}</textarea>
												</li>
											</ul>
										</div>
									</c:when>
									<c:otherwise>
										<div class=" align-self-center">
											<ul>
												<li>
													<label for="title" class="form-label">시작일</label> 
													<input type="text" id="title" name="beginCreatedAt" class="form-control "
													required="required" value="${contest.beginCreatedAt}" readonly>
												</li>
												<li>
													<label for="title" class="form-label">종료일</label> 
													<input type="text" id="title" name="endCreatedAt" class="form-control"
													required="required" value="${contest.endCreatedAt}" readonly>
												</li>
												<li>
													<label for="title" class="form-label">제목</label> 
													<input type="text" id="title" name="title" class="form-control"
													required="required" value="${contest.title}" readonly>
												</li>
												<li>
													<label for="overview" class="form-label">모집 요강</label>
													<textarea id="overview" name="content" class="form-control" required="required" 
													rows="10" readonly>${contest.content}</textarea>
												</li>
											</ul>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
							</div>
							<div class="modal-footer">
								<c:if test="${principal.userRole == 1}">
									<input type="hidden" name="userId" value="${contest.userId}">
									<input type="hidden" name="id" value="${contest.id}">
									<button type="submit" class="btn btn-primary m-1">수정</button>
								</c:if>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
							</div>
							</form>
						</div>
					</div>
				</div>
			</c:forEach>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
