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
      
      <section class="top-wrap">
      	<div class="top-wrap-content">      	
      		<div class="top-wrap-nav">
      			<div class="novel-type">
      				<h1>게시판</h1>
      			</div>
      			<div class="board-type">
      				<a class="board-type-item"><span class="blue-span">자유게시판</span></a>
      				<a class="board-type-item"><span>작품서평</span></a>
      				<a class="board-type-item"><span>포스트</span></a>
      			</div>
      		</div>
      	</div>
      	<div class="top-footer">
      		<div class="top-footer-item"><a><span class="blue-span">최신</span></a></div>
      		<div class="top-footer-item"><a>추천</a></div>
      	</div>
      </section>
      <section class="one-tab-list">
      	<ul class="board-list">
      		<li>
      			<a href="#">
      				<div class="border-list-item">
      					<div class="board-list-title">내일은 간단하고 글쓰기가 막막...</div>
      					<div class="board-list-desc">
      						<span class="blue-span list-desc-span">따노르</span> 
      						<span class="list-desc-span">2023.05.31</span> 
      						<span class="list-desc-span">조회 16</span> 
      						<span class="list-desc-span">추천 1</span> 
      					</div>
      				</div>
      			</a>
      		</li>
      		<li>
      			<a href="#">
      				<div class="border-list-item">
      					<div class="board-list-title">군만두 먹고싶다</div>
      					<div class="board-list-desc">
      						<span class="blue-span list-desc-span">따노르</span> 
      						<span class="list-desc-span">2023.05.31</span> 
      						<span class="list-desc-span">조회 16</span> 
      						<span class="list-desc-span">추천 1</span> 
      					</div>
      				</div>
      			</a>
      		</li>
      		<li>
      			<a href="#">
      				<div class="border-list-item">
      					<div class="board-list-title">출석체크 원래 자동이었나</div>
      					<div class="board-list-desc">
      						<span class="blue-span list-desc-span">따노르</span> 
      						<span class="list-desc-span">2023.05.31</span> 
      						<span class="list-desc-span">조회 16</span> 
      						<span class="list-desc-span">추천 1</span> 
      					</div>
      				</div>
      			</a>
      		</li>
      		<li>
      			<a href="#">
      				<div class="border-list-item">
      					<div class="board-list-title">16만자 소설 투고 완료</div>
      					<div class="board-list-desc">
      						<span class="blue-span list-desc-span">따노르</span> 
      						<span class="list-desc-span">2023.05.31</span> 
      						<span class="list-desc-span">조회 16</span> 
      						<span class="list-desc-span">추천 1</span> 
      					</div>
      				</div>
      			</a>
      		</li>
      		<li>
      			<a href="#">
      				<div class="border-list-item">
      					<div class="board-list-title">함부로 남에게 조언하면 안되는 이유</div>
      					<div class="board-list-desc">
      						<span class="blue-span list-desc-span">따노르</span> 
      						<span class="list-desc-span">2023.05.31</span> 
      						<span class="list-desc-span">조회 16</span> 
      						<span class="list-desc-span">추천 1</span> 
      					</div>
      				</div>
      			</a>
      		</li>
      		<li>
      			<a href="#">
      				<div class="border-list-item">
      					<div class="board-list-title">내일은 간단하고 글쓰기가 막막...</div>
      					<div class="board-list-desc">
      						<span class="blue-span list-desc-span">따노르</span> 
      						<span class="list-desc-span">2023.05.31</span> 
      						<span class="list-desc-span">조회 16</span> 
      						<span class="list-desc-span">추천 1</span> 
      					</div>
      				</div>
      			</a>
      		</li>
      		<li>
      			<a href="#">
      				<div class="border-list-item">
      					<div class="board-list-title">군만두 먹고싶다</div>
      					<div class="board-list-desc">
      						<span class="blue-span list-desc-span">따노르</span> 
      						<span class="list-desc-span">2023.05.31</span> 
      						<span class="list-desc-span">조회 16</span> 
      						<span class="list-desc-span">추천 1</span> 
      					</div>
      				</div>
      			</a>
      		</li>
      		<li>
      			<a href="#">
      				<div class="border-list-item">
      					<div class="board-list-title">출석체크 원래 자동이었나</div>
      					<div class="board-list-desc">
      						<span class="blue-span list-desc-span">따노르</span> 
      						<span class="list-desc-span">2023.05.31</span> 
      						<span class="list-desc-span">조회 16</span> 
      						<span class="list-desc-span">추천 1</span> 
      					</div>
      				</div>
      			</a>
      		</li>
      		<li>
      			<a href="#">
      				<div class="border-list-item">
      					<div class="board-list-title">16만자 소설 투고 완료</div>
      					<div class="board-list-desc">
      						<span class="blue-span list-desc-span">따노르</span> 
      						<span class="list-desc-span">2023.05.31</span> 
      						<span class="list-desc-span">조회 16</span> 
      						<span class="list-desc-span">추천 1</span> 
      					</div>
      				</div>
      			</a>
      		</li>
      		<li>
      			<a href="#">
      				<div class="border-list-item">
      					<div class="board-list-title">함부로 남에게 조언하면 안되는 이유</div>
      					<div class="board-list-desc">
      						<span class="blue-span list-desc-span">따노르</span> 
      						<span class="list-desc-span">2023.05.31</span> 
      						<span class="list-desc-span">조회 16</span> 
      						<span class="list-desc-span">추천 1</span> 
      					</div>
      				</div>
      			</a>
      		</li>
      		<li>
      			<a href="#">
      				<div class="border-list-item">
      					<div class="board-list-title">내일은 간단하고 글쓰기가 막막...</div>
      					<div class="board-list-desc">
      						<span class="blue-span list-desc-span">따노르</span> 
      						<span class="list-desc-span">2023.05.31</span> 
      						<span class="list-desc-span">조회 16</span> 
      						<span class="list-desc-span">추천 1</span> 
      					</div>
      				</div>
      			</a>
      		</li>
      		<li>
      			<a href="#">
      				<div class="border-list-item">
      					<div class="board-list-title">군만두 먹고싶다</div>
      					<div class="board-list-desc">
      						<span class="blue-span list-desc-span">따노르</span> 
      						<span class="list-desc-span">2023.05.31</span> 
      						<span class="list-desc-span">조회 16</span> 
      						<span class="list-desc-span">추천 1</span> 
      					</div>
      				</div>
      			</a>
      		</li>
      		<li>
      			<a href="#">
      				<div class="border-list-item">
      					<div class="board-list-title">출석체크 원래 자동이었나</div>
      					<div class="board-list-desc">
      						<span class="blue-span list-desc-span">따노르</span> 
      						<span class="list-desc-span">2023.05.31</span> 
      						<span class="list-desc-span">조회 16</span> 
      						<span class="list-desc-span">추천 1</span> 
      					</div>
      				</div>
      			</a>
      		</li>
      		<li>
      			<a href="#">
      				<div class="border-list-item">
      					<div class="board-list-title">16만자 소설 투고 완료</div>
      					<div class="board-list-desc">
      						<span class="blue-span list-desc-span">따노르</span> 
      						<span class="list-desc-span">2023.05.31</span> 
      						<span class="list-desc-span">조회 16</span> 
      						<span class="list-desc-span">추천 1</span> 
      					</div>
      				</div>
      			</a>
      		</li>
      		<li>
      			<a href="#">
      				<div class="border-list-item">
      					<div class="board-list-title">함부로 남에게 조언하면 안되는 이유</div>
      					<div class="board-list-desc">
      						<span class="blue-span list-desc-span">따노르</span> 
      						<span class="list-desc-span">2023.05.31</span> 
      						<span class="list-desc-span">조회 16</span> 
      						<span class="list-desc-span">추천 1</span> 
      					</div>
      				</div>
      			</a>
      		</li>
      		<li>
      			<a href="#">
      				<div class="border-list-item">
      					<div class="board-list-title">내일은 간단하고 글쓰기가 막막...</div>
      					<div class="board-list-desc">
      						<span class="blue-span list-desc-span">따노르</span> 
      						<span class="list-desc-span">2023.05.31</span> 
      						<span class="list-desc-span">조회 16</span> 
      						<span class="list-desc-span">추천 1</span> 
      					</div>
      				</div>
      			</a>
      		</li>
      		<li>
      			<a href="#">
      				<div class="border-list-item">
      					<div class="board-list-title">군만두 먹고싶다</div>
      					<div class="board-list-desc">
      						<span class="blue-span list-desc-span">따노르</span> 
      						<span class="list-desc-span">2023.05.31</span> 
      						<span class="list-desc-span">조회 16</span> 
      						<span class="list-desc-span">추천 1</span> 
      					</div>
      				</div>
      			</a>
      		</li>
      		<li>
      			<a href="#">
      				<div class="border-list-item">
      					<div class="board-list-title">출석체크 원래 자동이었나</div>
      					<div class="board-list-desc">
      						<span class="blue-span list-desc-span">따노르</span> 
      						<span class="list-desc-span">2023.05.31</span> 
      						<span class="list-desc-span">조회 16</span> 
      						<span class="list-desc-span">추천 1</span> 
      					</div>
      				</div>
      			</a>
      		</li>
      		<li>
      			<a href="#">
      				<div class="border-list-item">
      					<div class="board-list-title">16만자 소설 투고 완료</div>
      					<div class="board-list-desc">
      						<span class="blue-span list-desc-span">따노르</span> 
      						<span class="list-desc-span">2023.05.31</span> 
      						<span class="list-desc-span">조회 16</span> 
      						<span class="list-desc-span">추천 1</span> 
      					</div>
      				</div>
      			</a>
      		</li>
      		<li>
      			<a href="#">
      				<div class="border-list-item">
      					<div class="board-list-title">함부로 남에게 조언하면 안되는 이유</div>
      					<div class="board-list-desc">
      						<span class="blue-span list-desc-span">따노르</span> 
      						<span class="list-desc-span">2023.05.31</span> 
      						<span class="list-desc-span">조회 16</span> 
      						<span class="list-desc-span">추천 1</span> 
      					</div>
      				</div>
      			</a>
      		</li>
      	</ul>
      </section>
      <section>
      	<nav class="paging " aria-label="Page navigation example">
      		<div></div>
      		<div>
      			<ul class="pagination">
    				<li class="page-item"><a class="page-link" href="#">Previous</a></li>
    				<li class="page-item"><a class="page-link" href="#">1</a></li>
    				<li class="page-item"><a class="page-link" href="#">2</a></li>
    				<li class="page-item"><a class="page-link" href="#">3</a></li>
    				<li class="page-item"><a class="page-link" href="#">4</a></li>
    				<li class="page-item"><a class="page-link" href="#">5</a></li>
    				<li class="page-item"><a class="page-link" href="#">6</a></li>
    				<li class="page-item"><a class="page-link" href="#">7</a></li>
    				<li class="page-item"><a class="page-link" href="#">8</a></li>
    				<li class="page-item"><a class="page-link" href="#">9</a></li>
    				<li class="page-item"><a class="page-link" href="#">10</a></li>
    				<li class="page-item"><a class="page-link" href="#">Next</a></li>
  				</ul>
      		</div>
  			<div>
				<button class="btn btn-primary me-1">글 작성</button>
  			</div>
		</nav>
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
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
