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
    <link href="/assets/css/book.css" rel="stylesheet">
	<script src="/assets/js/turn.min.js"></script>
    <link rel="stylesheet" href="/assets/css/reset.css" />
    <link rel="stylesheet" href="/assets/css/registration.css" />
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
      	<div class="main-layout">
      		<section class="main-form">
      			<div class="registration-form">
      				<h1>소설 등록</h1>
      				<form action="#" class="form">
      					<div class="input-box">
      						<label>제목</label>
      						<input type="text" id="title" name="title" placeholder="Enter full name" required/>
      					</div>
      					<div class="input-box">
      						<label>장르</label>
      						<div class="select-box">
      							<select id="genreId" name="genreId" class="form-select">
									<c:forEach items="${genreList}" var="genre">
										<option value="${genre.id}">${genre.name }</option>
									</c:forEach>
								</select>
      						</div>
      					</div>
      					<div class="input-box">
      						<label>서비스 타입</label>
      						<div id="serviceTypeId" name="serviceTypeId" class="select-box">
      							<select id="serviceTypeId" name="serviceTypeId">
								<c:forEach items="${serviceTypeList}" var="serviceType">
									<c:choose>
										<c:when test="${serviceType.name == '공모전'}">
											<option id="selectContest" value="${serviceType.id}">${serviceType.name }</option>
										</c:when>
										<c:otherwise>
											<option value="${serviceType.id}">${serviceType.name }</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								</select>
      						</div>
      					</div>
      					<div id="addContestForm" >
							<label for="contestFormId" class="form-label">공모전</label> 
							<select id="contestFormId" name="contestFomrId" class="form-select">
								<c:forEach items="${contestList}" var="contest" varStatus="vs">
									<option id="contestOptionId${vs.index+1}" value="${contest.id}">${contest.title}</option>
								</c:forEach>
							</select>
							<input id="contestId" name="contestId" type="hidden" value="0">
						</div>
      					<div class="input-box">
      						<label>연재 요일</label>
      						<div class="select-box">
      							<select id="serialCycle" name="serialCycle">
      								<option value="월">월</option>
									<option value="화">화</option>
									<option value="수">수</option>
									<option value="목">목</option>
									<option value="금">금</option>
									<option value="토">토</option>
									<option value="일">일</option>
      							</select>
      						</div>
      					</div>
      					<div class="input-box">
      						<label>작품소개</label>
      						<textarea id="content" name="content" class="form-control" required="required" rows="10"> 단종의 강함을 따라잡기 위해 세조가 수련을 시작하다.</textarea>
      					</div>
      					<div class="d-flex flex-row-reverse">
      						<button class="submit-button" type="submit">등록</button>
      					</div>
      				</form>
      			</div>
      		</section>
      		<aside class="right-sidebar">
      			<div class="right-sidebar-contents">
      				<div class="my-info">
      					<div class="username">asd1234 님</div>
      					<div class="info-category">
      						<span><img src="/assets/images/main/user-line.png">내정보</span>
      						<span><img src="/assets/images/main/thumb-up-line.png">알림</span>
      						<span><img src="/assets/images/main/star-line.png">구매목록</span>
      					</div>
      					<div class="gold-info">
      						<div>보유골드</div>
      						<span class="blue-span">1000</span>
      					</div>
      					<div class="right-box">
      						<div class="right-box-cover">
      							<a><img src="/assets/images/main/ai1.jpg"></a>
      						</div>
      						<div class="right-box-detail">
      							<div class="right-detail-desc">
      								<div class="desc-title">버려진 숲의 마왕성 숲의 마왕성 마왕성 마왕성</div>
      							</div>
      						</div>
      					</div>
      				</div>
      				<div class="right-banner">
      					<img src="/assets/images/main/gold-charge.png">
      				</div>
      				<div class="right-banner">
      					<img src="/assets/images/main/author-banner.png">
      				</div>
      				<div class="recommend-list">
      					<h3 class="recommend-header"><a>추천작</a></h3>
      					<ul>
      						<li>
      							<a class="recommend-item">
      								<div class="recommend-img"><img src="/assets/images/main/ai1.jpg"></div>
      								<div class="recommend-desc">
      									<span>현대판타지</span>
      									<span class="bold-font">천재들과 함께하는 연예계 생활</span>
      									<span>김경은</span>
      								</div>
      							</a>
      						</li>
      						<li>
      							<a class="recommend-item">
      								<div class="recommend-img"><img src="/assets/images/main/ai2.jpg"></div>
      								<div class="recommend-desc">
      									<span>현대판타지</span>
      									<span class="bold-font">천재들과 함께하는 연예계 생활</span>
      									<span>김경은</span>
      								</div>
      							</a>
      						</li>
      						<li>
      							<a class="recommend-item">
      								<div class="recommend-img"><img src="/assets/images/main/ai3.jpg"></div>
      								<div class="recommend-desc">
      									<span>현대판타지</span>
      									<span class="bold-font">천재들과 함께하는 연예계 생활</span>
      									<span>김경은</span>
      								</div>
      							</a>
      						</li>
      						<li>
      							<a class="recommend-item">
      								<div class="recommend-img"><img src="/assets/images/main/ai4.jpg"></div>
      								<div class="recommend-desc">
      									<span>현대판타지</span>
      									<span class="bold-font">천재들과 함께하는 연예계 생활</span>
      									<span>김경은</span>
      								</div>
      							</a>
      						</li>
      						<li>
      							<a class="recommend-item">
      								<div class="recommend-img"><img src="/assets/images/main/ai2.jpg"></div>
      								<div class="recommend-desc">
      									<span>현대판타지</span>
      									<span class="bold-font">천재들과 함께하는 연예계 생활</span>
      									<span>김경은</span>
      								</div>
      							</a>
      						</li>
      						<li>
      							<a class="recommend-item">
      								<div class="recommend-img"><img src="/assets/images/main/ai1.jpg"></div>
      								<div class="recommend-desc">
      									<span>현대판타지</span>
      									<span class="bold-font">천재들과 함께하는 연예계 생활</span>
      									<span>김경은</span>
      								</div>
      							</a>
      						</li>
      					</ul>
      				</div>
      			</div>
      		</aside>
      	</div>
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
<script type="text/javascript">
$(document).ready(function(){
	$("#addContestForm").css('display','none');
	$("#serviceTypeId").on("change", function () {
		if($(this).val() == 3){
			$("#addContestForm").show();
			// 서비스 타입 공모전 선택 시 contestId에 기본값 설정
			$("#contestId").val($("#contestOptionId1").val());
		}else{
			$("#addContestForm").hide();
			$("#contestId").val(0);
		}
    });
	
	$("#contestFormId").on("change",function(){
		
		let contestOptionId = $("#contestFormId").val();
		// input값 변경으로 공모전 id post 하기
		$("#contestId").val($("#contestOptionId"+contestOptionId).val());
	});
})
</script>      