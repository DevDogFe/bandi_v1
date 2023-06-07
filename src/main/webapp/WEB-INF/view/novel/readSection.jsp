<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<!-- 작성한 css는 항상 밑에 있어야함 -->
<link href="/assets/css/book.css" rel="stylesheet">
<script src="/assets/js/turn.min.js"></script>
<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/readSection.css" />
<style type="text/css">
#starScore fieldset {
	display: inline-block;
	direction: rtl;
	border: 0;
}

#starScore fieldset legend {
	text-align: right;
}

#starScore input[type=radio] {
	display: none;
}

#starScore label {
	font-size: 2em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}

#starScore label:hover {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#starScore label:hover ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#starScore input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#reviewContents {
	width: 100%;
	height: 150px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 1.5px #D3D3D3;
	border-radius: 5px;
	font-size: 16px;
	resize: none;
}

#book-body {
	background-color: #D7CCC8;
	padding: 10px;
	border-radius: 5px;
}
</style>
			<div class="main-layout">
				<aside class="left-sidebar">
					<div class="left-sidebar-contents">
						<div class="contents-top">
							<div class="contents-title">
								<h2>유료 웹소설</h2>
							</div>
							<div class="contents-category">
								<a>최신작</a>
							</div>
						</div>
						<div class="contents-list">
							<ul>
								<c:set var="count" value="1"></c:set>
								<c:forEach items="${leftList }" end="20" var="novel">
									<c:choose>
										<c:when test="${count%2 == 0}">
											<li class="list-item"><span class="list-icon">${novel.serialCycle}</span> <a class="item-author">${novel.nickName}</a> <a class="item-title" href="/novel/detail/ ${novel.id}">${novel.title}</a></li>
										</c:when>
										<c:otherwise>
											<li class="list-item bold"><span class="list-icon">${novel.serialCycle}</span> <a class="item-author">${novel.nickName}</a> <a class="item-title" href="/novel/detail/ ${novel.id}">${novel.title}</a></li>
										</c:otherwise>
									</c:choose>

								</c:forEach>
							</ul>
						</div>
					</div>
				</aside>
				<section class="novel-content">
					<div class="novel-content-item">
						<div class="detail-box">
							<div class="work-box">
								<div class="cover">
									<c:choose>
										<c:when test="${detail.cover != null }">
											<img alt="이미지 기간만료" src="/bandi/uploads/${detail.cover }">
										</c:when>
										<c:otherwise>
											<img alt="이미지 없음" src="/assets/images/noimg.jpg">
										</c:otherwise>
									</c:choose>
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
										<span><img src="/assets/images/main/user-line.png">${favorite}</span><span><img
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
												<div class="page page-cover">
													<h1 class="book-cover">${section.title}</h1>
												</div>
												<div class="page">
													<h1 class="book-cover">(주)반디</h1>
												</div>
												<c:forEach items="${subStringList}" var="subString" varStatus="vs">
													<div class="page">
														<p class="book-font">${subString}</p>
													</div>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="mt-3">
							<c:if test="${section.prevTitle != '이전글이 없습니다'}">
								<button type="button" onclick="location.href='/section/read/${section.novelId}/${section.prevId}/${serviceTypeId}'" class="btn btn-primary btn-sm shadow-none">이전글:
									${section.prevTitle}</button>
							</c:if>
							<c:if test="${section.nextTitle != '다음글이 없습니다'}">
								<button type="button" onclick="location.href='/section/read/${section.novelId}/${section.nextId}/${serviceTypeId}'" class="btn btn-primary btn-sm shadow-none">다음글:
									${section.nextTitle}</button>
							</c:if>
						</div>
					</div>

					<div class="reply">
						<div>
							<form class="mb-3" name="starScore" id="starScore" method="post">
								<fieldset>
									<input type="hidden" value="${section.id }" id="sectionId">
									<button type="button" class="btn btn-primary btn-sm shadow-none" id="starBtn">별점 등록</button>
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
									<form action="/novel/reply?serviceTypeId=${serviceTypeId }" method="post">
										<div class="d-flex flex-row align-items-start">
											<textarea class="form-control ml-1 shadow-none textarea" name="content" maxlength="255" required="required"></textarea>
											<input type="hidden" name="novelId" value="${detail.id }">
											<input type="hidden" name="sectionId" value="${section.id }">
										</div>
										<div class="mt-2 text-right float-end">
											<button class="btn btn-primary btn-sm shadow-none" type="submit">등록</button>
										</div>
									</form>
								</div>
								<div class="comment-top">
									<div></div>
								</div>
								<!-- 등록된 댓글 -->
								<c:choose>
									<c:when test="${empty replyList.content }">
										<div class="comment-item">
											<div class="col-md-12">
												<div class="bg-white p-2"></div>
												<div class="mt-2">
													<p class="comment-text">댓글이 아직 없습니다. 댓글을 남겨주세요.</p>
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
															<button class="btn btn-outline-danger btn-sm ml-1 shadow-none" onclick="deleteReply(${reply.id},${section.novelId}, ${section.id}, ${ serviceTypeId})">삭제</button>
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
														href="/section/read/${section.novelId}/${section.id}/${serviceTypeId}?currentPage=${replyList.currentPage - 1}" class="page-link">Previous</a></li>
													<!-- Previous 끝 -->
													<!-- Page번호 시작 -->
													<c:forEach var="pNo" begin="${replyList.startPage }" end="${replyList.endPage }" step="1">
														<li class="  <c:if test=''>active</c:if>"><a href="/section/read/${section.novelId}/${section.id}/${serviceTypeId}?currentPage=${pNo}" class="page-link">${pNo}</a></li>
													</c:forEach>
													<!-- Page번호 끝 -->
													<!-- Next 시작 -->
													<li class="<c:if test='${replyList.endPage == replyList.currentPage }'>d-none</c:if>" id=""><a
														href="/section/read/${section.novelId}/${section.id}/${serviceTypeId}?currentPage=${replyList.currentPage + 1}" class="page-link">Next</a></li>
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
							<div class="username">${principal.nickName} 님</div>
							<div class="info-category">
								<span><img src="/assets/images/main/user-line.png">내정보</span> <span><img src="/assets/images/main/thumb-up-line.png">알림</span> <span><img
									src="/assets/images/main/star-line.png">구매목록</span>
							</div>
							<div class="gold-info">
								<div>보유골드</div>
								<span class="blue-span">${gold}</span>
							</div>
							<div class="right-box">
								<div class="right-box-cover">
									<c:choose>
										<c:when test="${lastNovel.cover != null }">
											<a><img alt="이미지 기간만료" src="/bandi/uploads/${lastNovel.cover}"></a>
										</c:when>
										<c:otherwise>
											<img alt="이미지 없음" src="/assets/images/noimg.jpg">
										</c:otherwise>
									</c:choose>
								</div>
								
								<div class="right-box-detail">
									<div class="right-detail-desc">
										<div class="desc-title">${lastNovel.title}</div>
										<c:choose>
											<c:when test="${lastNovel.serviceTypeId != 3}">
												<a href="/section/read/${lastNovel.novelId}/${lastNovel.sectionId}/${lastNovel.serviceTypeId}"><div class="desc-title">바로가기</div></a>
											</c:when>
											<c:otherwise>
												<a href="/contest/novel/read/${lastNovel.novelId}/${lastNovel.sectionId}"><div class="desc-title">바로가기</div></a>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</div>
						<div class="right-banner">
							<a href="/payment/charge"><img src="/assets/images/main/gold-charge.png"></a>
						</div>
						<div class="right-banner">
							<a href="/main"><img src="/assets/images/main/author-banner.png"></a>
						</div>
						<div class="recommend-list">
							<h3 class="recommend-header">
								<a>${genreList.get(0).genreName } 추천작</a>
							</h3>
							<ul>
								<c:forEach items="${genreList }" var="novel">
									<li><a href="#" class="recommend-item">
											<div class="recommend-img">
												<c:choose>
													<c:when test="${novel.cover != null }">
														<img alt="이미지 기간만료" src="/bandi/uploads/${novel.cover }">
													</c:when>
													<c:otherwise>
														<img alt="이미지 없음" src="/assets/images/noimg.jpg">
													</c:otherwise>
												</c:choose>
											</div>
											<div class="recommend-desc">
												<span>${novel.genreName} </span> <span class="bold-font">${novel.title}</span> <span>${novel.nickName}</span>
											</div>
									</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</aside>
			</div>
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
      	}else if($(window).width()>=1080&& $("#book-body").width()<1000){
      		mode = "middle";
      	}else{
      		mode = "big";
      		$(".book-font").css('font-size','40px');
      	}
      	
      	//화면 크기에따른 책 사이즈 변경
      	$(flipbookEL).turn('size', flipbookEL.clientWidth, flipbookEL.clientHeight);
    });
    
    // 책넘길때 폰트 초기화
    $("#flipbook").bind("turning", function(event, page, view) {
  	  	
    	if(mode=="middle"){
  	  		$(".book-font").css('font-size','20px');
  	  		$(".book-font").css('line-height','normal');
  	  		$(".book-cover").css('font-size','30px');
  	  	}else if(mode=='small'){
  	  		$(".book-font").css('font-size','5px');
  	  		$(".book-font").css('line-height','normal');
  	  		$(".book-cover").css('font-size','15px');
  	  	}else{
  	  		$(".book-font").css('font-size','40px');
  	  		$(".book-font").css('line-height','60px');
  	  		$(".book-cover").css('font-size','50px');
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
  		prevMode = mode;
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
	      	$(".book-font").css('font-size','40px');
	      	$(".book-cover").css('font-size','50px');
	      	$(".book-font").css('line-height','60px');
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
	      	$(".book-font").css('font-size','20px');
	      	$(".book-font").css('line-height','normal');
	      	$(".book-cover").css('font-size','30px');
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
		location.href='/section/read/' + ${detail.id}+ '/' + $("#sectionId").val()+'/'+${serviceTypeId};
	}).fail((error) => {
		console.log(error);
		alert("요청을 처리할 수 없습니다.");
	});
}


$(document).ready(function() {
	
	// 별점 등록
	$("#starBtn").on("click", () => {
		const stars = $("input[name = reviewStar]");
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
		<%@include file="/WEB-INF/view/layout/footer.jsp"%>
	