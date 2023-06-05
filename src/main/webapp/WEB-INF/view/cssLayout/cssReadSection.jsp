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
<link href="/assets/css/book.css" rel="stylesheet">
<script src="/assets/js/turn.min.js"></script>
<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/readSection.css" />
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
			<div class="main-layout">
				<aside class="left-sidebar">
					<div class="left-sidebar-contents">
						<div class="contents-top">
							<div class="contents-title">
								<h2>유료 웹소설</h2>
							</div>
							<div class="contents-category">
								<a>연재작</a> <a>최신작</a>
							</div>
							<div class="contents-search">
								<nav class="navbar navbar-light bg-light mt-0">
									<div class="container-fluid">
										<form class="d-flex">
											<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
											<button class="btn btn-outline-primary btn-sm" type="submit">search</button>
										</form>
									</div>
								</nav>
							</div>
						</div>
						<div class="contents-list">
							<ul>
								<li class="list-item"><span class="list-icon">독</span> <a class="item-author">해수목</a> <a class="item-title">겜머니로 세계정복 겜머니로 세계정복</a></li>
								<li class="list-item bold"><span class="list-icon">독</span> <a class="item-author">해수목</a> <a class="item-title">겜머니로 세계정복 겜머니로 세계정복</a></li>
								<li class="list-item"><span class="list-icon">독</span> <a class="item-author">해수목</a> <a class="item-title">겜머니로 세계정복 겜머니로 세계정복</a></li>
								<li class="list-item bold"><span class="list-icon">독</span> <a class="item-author">해수목</a> <a class="item-title">겜머니로 세계정복 겜머니로 세계정복</a></li>
								<li class="list-item"><span class="list-icon">독</span> <a class="item-author">해수목</a> <a class="item-title">겜머니로 세계정복 겜머니로 세계정복</a></li>
								<li class="list-item bold"><span class="list-icon">독</span> <a class="item-author">해수목</a> <a class="item-title">겜머니로 세계정복 겜머니로 세계정복</a></li>
								<li class="list-item"><span class="list-icon">독</span> <a class="item-author">해수목</a> <a class="item-title">겜머니로 세계정복 겜머니로 세계정복</a></li>
								<li class="list-item bold"><span class="list-icon">독</span> <a class="item-author">해수목</a> <a class="item-title">겜머니로 세계정복 겜머니로 세계정복</a></li>
								<li class="list-item"><span class="list-icon">독</span> <a class="item-author">해수목</a> <a class="item-title">겜머니로 세계정복 겜머니로 세계정복</a></li>
								<li class="list-item bold"><span class="list-icon">독</span> <a class="item-author">해수목</a> <a class="item-title">겜머니로 세계정복 겜머니로 세계정복</a></li>
								<li class="list-item"><span class="list-icon">독</span> <a class="item-author">해수목</a> <a class="item-title">겜머니로 세계정복 겜머니로 세계정복</a></li>
								<li class="list-item bold"><span class="list-icon">독</span> <a class="item-author">해수목</a> <a class="item-title">겜머니로 세계정복 겜머니로 세계정복</a></li>
								<li class="list-item"><span class="list-icon">독</span> <a class="item-author">해수목</a> <a class="item-title">겜머니로 세계정복 겜머니로 세계정복</a></li>
								<li class="list-item bold"><span class="list-icon">독</span> <a class="item-author">해수목</a> <a class="item-title">겜머니로 세계정복 겜머니로 세계정복</a></li>
								<li class="list-item"><span class="list-icon">독</span> <a class="item-author">해수목</a> <a class="item-title">겜머니로 세계정복 겜머니로 세계정복</a></li>
								<li class="list-item bold"><span class="list-icon">독</span> <a class="item-author">해수목</a> <a class="item-title">겜머니로 세계정복 겜머니로 세계정복</a></li>
								<li class="list-item"><span class="list-icon">독</span> <a class="item-author">해수목</a> <a class="item-title">겜머니로 세계정복 겜머니로 세계정복</a></li>
								<li class="list-item bold"><span class="list-icon">독</span> <a class="item-author">해수목</a> <a class="item-title">겜머니로 세계정복 겜머니로 세계정복</a></li>
								<li class="list-item"><span class="list-icon">독</span> <a class="item-author">해수목</a> <a class="item-title">겜머니로 세계정복 겜머니로 세계정복</a></li>
								<li class="list-item bold"><span class="list-icon">독</span> <a class="item-author">해수목</a> <a class="item-title">겜머니로 세계정복 겜머니로 세계정복</a></li>
							</ul>
						</div>
					</div>
				</aside>
				<section class="novel-content">
					<div class="novel-content-item">
						<div class="detail-box">
							<div class="work-box">
								<div class="cover">
									<a><img src="/assets/images/main/ai1.jpg"></a>
								</div>
								<div class="detail">
									<div class="desc">
										<a><div class="detail-title">
												<img class="icon" src="/assets/images/main/medal-line.png">${detail.title}
											</div></a> <a><div class="detail-aurthor">
												<img class="icon" src="/assets/images/main/pencil-line.png">작가 | ${detail.nickName}
											</div></a> <a><div class="detail-intro">${detail.overview}</div></a>
									</div>
									<div class="scale">
										<span><img src="/assets/images/main/user-line.png">${favorite}</span> <span><img src="/assets/images/main/thumb-up-line.png">143</span> <span><img
											src="/assets/images/main/star-line.png">109</span>
									</div>
								</div>
							</div>
						</div>
						<div class="top-wrap">
							<div class="top-wrap-content">
								<div class="top-wrap-nav">
									<div class="novel-type">
										<h1>${section.title}</h1>
									</div>
								</div>
							</div>
						</div>
						<div class="novel-viewer">
							<div id="book-body">
								<div class="d-flex justify-content-end col-md-12">
									<button type="button" class="btn btn-outline-secondary fullscreen" onclick="openFullScreenMode()">확대</button>
									<button type="button" class="btn btn-outline-secondary close-fullscreen" onclick="closeFullScreenMode()">축소</button>
								</div>
								<div class="wrapper">
									<div class="aspect">
										<div class="aspect-inner">
											<div id="flipbook" class="flipbook">
												<div class="page">
													<h1>${section.title}</h1>
												</div>
												<div class="page">
													<h1>(주)반디</h1>
												</div>
												<c:forEach items="${subStringList}" var="subString" varStatus="vs">
													<div class="page">
														<p>${subString}</p>
													</div>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div>
						<c:if test="${section.prevTitle != '이전글이 없습니다'}">
							<button type="button" onclick="location.href='/section/read/${section.novelId}/${section.prevId}?currentPage=${replyList.currentPage}&serviceTypeId=${serviceTypeId}'" class="btn btn-info">${section.prevTitle}</button>
						</c:if>
						<c:if test="${section.nextTitle != '다음글이 없습니다'}">
							<button type="button" onclick="location.href='/section/read/${section.novelId}/${section.nextId}?currentPage=${replyList.currentPage}&serviceTypeId=${serviceTypeId}'" class="btn btn-success">${section.nextTitle}</button>
						</c:if>
					</div>


					<div class="reply">
						<div>
							<form class="mb-3" name="starScore" id="starScore" method="post">
								<fieldset>
									<button type="button" class="btn btn-primary" id="starBtn">별점 등록</button>
									<span class="text-bold">별점을 선택해주세요</span> <input type="radio" name="reviewStar" value="5" id="rate1"><label for="rate1">★</label> <input type="radio" name="reviewStar" value="4"
										id="rate2"><label for="rate2">★</label> <input type="radio" name="reviewStar" value="3" id="rate3"><label for="rate3">★</label> <input type="radio" name="reviewStar"
										value="2" id="rate4"><label for="rate4">★</label> <input type="radio" name="reviewStar" value="1" id="rate5"><label for="rate5">★</label>
								</fieldset>
							</form>
						</div>
						<div>
							<div class="comments-content">
								<!-- 댓글 등록 -->
								<div class="bg-light comment-form p-2">
									<div class="comment-header ms-1">
										<h5 class="me-2">댓글</h5>
										<span>11</span>
									</div>
									<div class="d-flex flex-row align-items-start">
										<textarea class="form-control ml-1 shadow-none textarea" maxlength="255"></textarea>
									</div>
									<div class="mt-2 text-right float-end">
										<button class="btn btn-primary btn-sm shadow-none" type="submit">등록</button>
										<button class="btn btn-outline-danger btn-sm ml-1 shadow-none" type="button">삭제</button>
									</div>
								</div>
								<div class="comment-top">
									<div></div>
								</div>
								<!-- 등록된 댓글 -->
								<c:choose>
									<c:when test="${empty replyList.content }">
										<div class="comment-item">
											<div class="col-md-12">
												<div class="bg-white p-2">
													<div class="d-flex flex-row user-info">
														<div class="d-flex flex-column justify-content-start ml-2">
															<span class="d-block font-weight-bold name">김경은</span> <span class="date text-black-50">Shared publically - Jan 2021</span>
														</div>
													</div>
												</div>
												<div class="mt-2">
													<p class="comment-text">Yeah! I Liked that video. Thanks! Yeah! I Liked that video. Thanks! Yeah! I Liked that video. Thanks! Yeah! I Liked that video. Thanks! Thanks! Thanks! Yeah! I
														Liked Thanks! Yeah! I Liked</p>
												</div>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<c:forEach items="${replyList.content }" var="reply">
											<div class="comment-item">
												<div class="col-md-12">
													<div class="bg-white p-2">
														<div class="d-flex flex-row user-info">
															<div class="d-flex flex-column justify-content-start ml-2">
																<span class="d-block font-weight-bold name">${reply.username} </span> <span class="date text-black-50">${reply.createdAt() }</span>
															</div>
														</div>
													</div>
													<div class="mt-2">
														<p class="comment-text">${reply.content }</p>
													</div>
													<div class="mt-2">
														<c:if test="${principal.id == reply.userId }">
															<button class="delete--btn" onclick="deleteReply(${reply.id},${section.novelId}, ${section.id}, ${ serviceTypeId})">삭제</button>
														</c:if>
													</div>
												</div>
											</div>
										</c:forEach>
										<div>
											<div>
												<ul class="d-flex">
													<!-- Previous 시작 -->
													<li class=" <c:if test='${replyList.currentPage == 1}'>d-none</c:if>" id=""><a
														href="/section/read/${section.novelId}/${section.id}?currentPage=${replyList.currentPage - 1}&serviceTypeId=${serviceTypeId}" class="page-link">Previous</a></li>
													<!-- Previous 끝 -->
													<!-- Page번호 시작 -->
													<c:forEach var="pNo" begin="${replyList.startPage }" end="${replyList.endPage }" step="1">
														<li class="  <c:if test=''>active</c:if>"><a href="/section/read/${section.novelId}/${section.id}?currentPage=${pNo}&serviceTypeId=${serviceTypeId}" class="page-link">${pNo}</a></li>
													</c:forEach>
													<!-- Page번호 끝 -->
													<!-- Next 시작 -->
													<li class="<c:if test='${replyList.endPage == replyList.currentPage }'>d-none</c:if>" id=""><a
														href="/section/read/${section.novelId}/${section.id}?currentPage=${replyList.currentPage + 1}&serviceTypeId=${serviceTypeId}" class="page-link">Next</a></li>
													<!-- Next 끝 -->
												</ul>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
								<!--  -->
							</div>
						</div>
					</div>
				</section>
				<aside class="right-sidebar">
					<div class="right-sidebar-contents">
						<div class="my-info">
							<div class="username">asd1234 님</div>
							<div class="info-category">
								<span><img src="/assets/images/main/user-line.png">내정보</span> <span><img src="/assets/images/main/thumb-up-line.png">알림</span> <span><img
									src="/assets/images/main/star-line.png">구매목록</span>
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
							<h3 class="recommend-header">
								<a>추천작</a>
							</h3>
							<ul>
								<li><a class="recommend-item">
										<div class="recommend-img">
											<img src="/assets/images/main/ai1.jpg">
										</div>
										<div class="recommend-desc">
											<span>현대판타지</span> <span class="bold-font">천재들과 함께하는 연예계 생활</span> <span>김경은</span>
										</div>
								</a></li>
								<li><a class="recommend-item">
										<div class="recommend-img">
											<img src="/assets/images/main/ai2.jpg">
										</div>
										<div class="recommend-desc">
											<span>현대판타지</span> <span class="bold-font">천재들과 함께하는 연예계 생활</span> <span>김경은</span>
										</div>
								</a></li>
								<li><a class="recommend-item">
										<div class="recommend-img">
											<img src="/assets/images/main/ai3.jpg">
										</div>
										<div class="recommend-desc">
											<span>현대판타지</span> <span class="bold-font">천재들과 함께하는 연예계 생활</span> <span>김경은</span>
										</div>
								</a></li>
								<li><a class="recommend-item">
										<div class="recommend-img">
											<img src="/assets/images/main/ai4.jpg">
										</div>
										<div class="recommend-desc">
											<span>현대판타지</span> <span class="bold-font">천재들과 함께하는 연예계 생활</span> <span>김경은</span>
										</div>
								</a></li>
								<li><a class="recommend-item">
										<div class="recommend-img">
											<img src="/assets/images/main/ai2.jpg">
										</div>
										<div class="recommend-desc">
											<span>현대판타지</span> <span class="bold-font">천재들과 함께하는 연예계 생활</span> <span>김경은</span>
										</div>
								</a></li>
								<li><a class="recommend-item">
										<div class="recommend-img">
											<img src="/assets/images/main/ai1.jpg">
										</div>
										<div class="recommend-desc">
											<span>현대판타지</span> <span class="bold-font">천재들과 함께하는 연예계 생활</span> <span>김경은</span>
										</div>
								</a></li>
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
					<li>We may earn a commission if you purchase an item featured on our site.</li>
					<li>Copyright © 2020 CodingWorks. All rights reserved.</li>
				</ul>
			</div>
		</div>
	</footer>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script type="text/javascript">
	var numberOfPages = '${numberOfPages+2}';
    let pageCount = '${subStringArray.size()}';  
    let subStringArray = '${subStringArray}';
    
    //let mode = "small";
    let prevMode = "";
    let mode = "middle";
    
    var flipbookEL = document.getElementById('flipbook');
    var doc = document.getElementById("book-body");

    window.addEventListener('resize', function (e) {
    	flipbookEL.style.width = '';
      	flipbookEL.style.height = '';
      	
      	// 책 크기에 따른 폰트 크기 수정
      	if($(window).width()<1080){
      		mode = "small";
      		//$("p").css('font-size','5px');
      		console.log(mode);
      	}else if($(window).width()>=1080&&$(flipbookEL).width()<1600){
      		mode = "middle";
      		//$("p").css('font-size','20px');
      		console.log(mode);
      	}else{
      		mode = "big";
      		$("p").css('font-size','30px');
      		console.log(mode);
      	}
      	
      	//화면 크기에따른 책 사이즈 변경
      	$(flipbookEL).turn('size', flipbookEL.clientWidth, flipbookEL.clientHeight);
    });
    
    // 책넘길때 폰트 초기화
    $("#flipbook").bind("turning", function(event, page, view) {
  	  	
  	  	if(mode=="middle"){
  	  		$("p").css('font-size','20px');
  	  	}else if(mode=='small'){
  	  		$("p").css('font-size','5px');
  	  	}else{
  	  		$("p").css('font-size','30px');
  	  	}
  	});

    $(flipbookEL).turn({
    	width: flipbookEL.clientWidth,
		height: flipbookEL.clientHeight,
        autoCenter: false
    });
    
    
    $('#page-number').keydown(function (e) {
        if (e.keyCode == 13){
        	$('#flipbook').turn('page', $('#page-number').val());
        } 
      });

    $(window).bind('keydown', function (e) {
      if (e.target && e.target.tagName.toLowerCase() != 'input') {
    	  if (e.keyCode == 37) {
    		  $('#flipbook').turn('previous');
    	  } else if (e.keyCode == 39) {
    		  $('#flipbook').turn('next');  
    	  }
      }
    });
    
	
  	//전체화면 설정
    function openFullScreenMode() {
  		pervMode = mode;
  		mode = "big";
  		
		if (doc.requestFullscreen){
			doc.requestFullscreen();
		}
		else if (doc.webkitRequestFullscreen){ // Chrome, Safari (webkit)
			doc.webkitRequestFullscreen();
		}
		else if (doc.mozRequestFullScreen){ // Firefox
			doc.mozRequestFullScreen();
		}
		else if (doc.msRequestFullscreen){ // IE or Edge
			doc.msRequestFullscreen();
		}
		
		window.addEventListener('resize', function (e) {
	    	flipbookEL.style.width = '';
	      	flipbookEL.style.height = '';
	      	$(flipbookEL).turn('size', (flipbookEL.clientWidth*0.9), (flipbookEL.clientHeight*0.8));
	      	$(flipbookEL).css('margin-top','3%');
	      	$("p").css('font-size','30px');
			$(".fullscreen").hide();
			$(".close-fullscreen").show();
	    });
		 
	}
	//전체화면 해제
	function closeFullScreenMode() {
		mode = "middle";
		
		if (document.exitFullscreen){
			document.exitFullscreen();
		}
		else if(document.webkitExitFullscreen){ // Chrome, Safari (webkit)
			document.webkitExitFullscreen();
		} 
		else if (document.mozCancelFullScreen){ // Firefox
			document.mozCancelFullScreen();
		}
		else if (document.msExitFullscreen){ // IE or Edge
			document.msExitFullscreen();
		}
		
		window.addEventListener('resize', function (e) {
	    	flipbookEL.style.width = '';
	      	flipbookEL.style.height = '';
	      	$(flipbookEL).turn('size', flipbookEL.clientWidth, flipbookEL.clientHeight);
	      	$("p").css('font-size','20px');
	      	$(flipbookEL).css('margin-top','0%');
	      	$(".close-fullscreen").hide();
			$(".fullscreen").show();
	    });
	}
	
function deleteReply(replyId,novelId,sectionId) {
	$.ajax({
		type: "DELETE",
		url: "/api/reply/" + replyId
	}).done((response) => {
		location.href='/section/read/'+novelId+'/'+ sectionId;
	}).fail((error) => {
		console.log(error);
		alert("요청을 처리할 수 없습니다.");
	});
}


$(document).ready(function() {
	
	// 별점 등록
	$("#starBtn").on("click", () => {
		console.log('111111111');
		const stars = $("input[name = reviewStar]");
		console.log(stars);
		let score;
		for (let i = 0; i < stars.length; i++){
			if(stars[i].checked){
				score = stars[i].value;
				let data = {
						sectionId: $("#sectionId").val(),
						score: score
				};
				
				$.ajax({
					type: "POST",
					url: "/api/score",
					contentType:"application/json; charset=utf-8",
					data: JSON.stringify(data),
					dataType:"json"
				}).done((response) => {
					location.href='/section/read/' + $("#novelId").val()+ '/' + $("#sectionId").val()+'?serviceTypeId='+'${serviceTypeId}';
				}).fail((error) => {
					console.log(error);
					alert("요청을 처리할 수 없습니다.");
				});
			}
		}
		
	});

		 
	
	// end of ready 
});
	</script>