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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<!-- Slider.js CDN -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="/assets/js/custom-slick.js"></script>
<!-- 작성한 css는 항상 밑에 있어야함 -->
<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/list.css" />
<link rel="stylesheet" href="/assets/css/readSection.css" />
<link rel="stylesheet" href="/assets/css/board/boardDetail.css" />
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
			<section class="one-tab-list">
				<div class="section-title-wrap">
					<h2 class="section-title">${boardDetail.boardName} 게시판</h2>
				</div>
				<div class="board-detail">
					<h3 class="board-title">
						<span>${boardDetail.title}</span>
					</h3>
				</div>
				<span class="board-detail-wrap"> <span class="board-info-wrap"> <span class="profile-info-wrap"> <span class="profile-preview-wrap"></span> <span class="info-inner"> <span class="name">${boardDetail.username}</span> <span class="date">${boardDetail.createdAt()}</span> <span class="date">${boardDetail.categoryName}</span>
						</span> <span class=“btn-right-wrap”> <span class=“modify-wrap”> <c:if test="${principal.id == boardDetail.userId }">
										<button type="submit" class="btn-delete" onclick="location.href='/board/delete/${boardDetail.id}'">삭제</button>
										<button class="btn-report" id="report-btn" onclick="popup()">신고</button>
										<button type="button" class="btn-modify" onclick="location.href='/board/update/${boardDetail.id}'">수정</button>
										</c:if>
										<c:if test="${principal != null }">
											<c:choose>
												<c:when test="${isLike}">
													<button type="button" id="unlike" class="heart">
														<img src="/assets/images/like_icon/like.png"> 공감
													</button>
												</c:when>
												<c:otherwise>
													<button type="button" id="like" class="heart">
														<img src="/assets/images/like_icon/unlike.png"> 공감
													</button>
												</c:otherwise>
											</c:choose>
										</c:if>
										<c:if test="${principal == null }">
											<button type="button" id="noUser" class="heart">
												<img src="/assets/images/like_icon/unlike.png"> 공감
											</button>
										</c:if>
							</span> <span class="list-wrap">
									<button type="submit" class="btn-list" onclick="location.href='/board/list'">목록</button>
							</span>
						</span>
					</span> <span class="board-contents"> <span id="_board-contents"> <c:forEach var="file" items="${fileList}">
									<img src="/bandi/uploads/${file.encodedFileName}" style="max-width: 300px; max-height: 300px;">
								</c:forEach>${boardDetail.content}
						</span>
					</span>
				</span>
				</span>

			</section>
			<section>
				<div class="reply">
					<div>
						<div class="comments-content">
							<!-- 댓글 등록 -->
							<div class="bg-light comment-form">
								<div class="comment-header ms-1">
									<h5 class="me-2">댓글</h5>
								</div>
								<c:choose>
									<c:when test="${empty principal.id}">
										<div class="d-flex flex-row align-items-start">
											<textarea class="form-control ml-1 shadow-none textarea" id="content" name="content" placeholder="댓글을 등록하려면 로그인해야합니다." readonly="readonly"></textarea>
										</div>
										<div class="mt-2 text-right float-end">
											<button class="btn btn-primary btn-sm shadow-none" type="submit">등록</button>
										</div>
									</c:when>
									<c:otherwise>
										<form action="/board/reply" method="post">
											<div class="d-flex flex-row align-items-start">
												<input type="hidden" id="boardId" name="boardId" value="${boardDetail.id}"> <img src="/assets/images/main/ai1.jpg" class="rounded-circle" width="40">
												<textarea class="form-control ml-1 shadow-none textarea" id="content" name="content" placeholder="비방이나 부적절한 표현은 삼가해주시길 바랍니다."></textarea>
											</div>
											<div class="mt-2 text-right float-end">
												<button class="btn btn-primary btn-sm shadow-none" type="submit">등록</button>
												<button class="btn btn-outline-danger btn-sm ml-1 shadow-none" type="button">삭제</button>
											</div>
										</form>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="comment-top">
								<div></div>
							</div>
							<!-- 등록된 댓글 -->
							<c:if test="${not empty replyList.content}">
								<c:forEach var="reply" items="${replyList.content}">
									<div class="comment-item">
										<div class="col-md-12">
											<div class="bg-white p-2">
												<div class="d-flex flex-row user-info">
													<img src="/assets/images/main/ai1.jpg" width="40" class="rounded-circle">
													<div class="d-flex flex-column justify-content-start ml-2">
														<span class="d-block font-weight-bold name">${reply.username}</span> <span class="date text-black-50">${reply.createdAt()}</span>
													</div>
												</div>
											</div>
											<div class="mt-2">
												<p class="comment-text">${reply.content}</p>
											</div>
										</div>
										<div class="bg-white">
											<div class="d-flex flex-row justify-content-end fs-12">
												<div class="like p-2 cursor">
													<span class="ml-1"><button class="btn btn-outline-danger btn-sm ml-1 shadow-none" onclick="deleteReply(${reply.id})">삭제</button></span>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
			</section>
			<section>
				<nav class="paging " aria-label="Page navigation example">
					<div></div>
					<div>
						<ul class="pagination">
							<li class="<c:if test='${replyList.currentPage == 1}'>d-none</c:if>" id=""><a href="/board/detail/${boardDetail.id}?currentPage=${replyList.currentPage - 1}" class="page-link">Previous</a></li>
							<c:forEach var="pNo" begin="${replyList.startPage}" end="${replyList.endPage}" step="1">
								<li <c:if test="${pNo == replyList.currentPage}">class="active"</c:if>><a href="/board/detail/${boardDetail.id}?currentPage=${pNo}" class="page-link">${pNo}</a></li>
							</c:forEach>
							<li class="<c:if test='${replyList.endPage == replyList.currentPage }'>d-none</c:if>" id=""><a href="/board/detail/${boardDetail.id}?currentPage=${replyList.currentPage + 1}" class="page-link">Next</a></li>
						</ul>
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
					<li>We may earn a commission if you purchase an item featured on our site.</li>
					<li>Copyright © 2020 CodingWorks. All rights reserved.</li>
				</ul>
			</div>
		</div>
		<script type="text/javascript">
			
			$("#unlike").on("click", ()=>{
				$.ajax({
					type: "DELETE",
					url: "/api/unlike/" + $("#boardId").val()
				}).done((response) => {
					location.href='/board/detail/' + $("#boardId").val();
				}).fail((error) => {
					console.log(error);
					alert("요청 실패")
				});
			});
			
			$("#noUser").on("click", ()=>{
				alert('로그인이 필요한 기능입니다.');
			});				
			
			$("#like").on("click", ()=>{
				$.ajax({
					type: "POST",
					url: "/api/like/" + $("#boardId").val()
				}).done((response) => {
					location.href='/board/detail/' + $("#boardId").val();
				}).fail((error) => {
					console.log(error);
					alert("요청 실패")
				});
			});
			
			
		$(document).ready(() => {

		});
	</script>
		<script type="text/javascript">
		function deleteReply(id) {
	        $.ajax({
	            type: "DELETE",
	            url: "/api/deletereply/" + id,
	        }).done(function(response) {
	            console.log(response);
	            console.log(id);
	            location.href = '/board/detail/' + $("#boardId").val();
	        }).fail(function(error) {
	            alert("요청 실패");
	        });
	    }
	</script>
		<script type="text/javascript">
		function popup() {
			var url = "/report/reportPopup/" + $("#boardId").val();
			var name = "신고하기";
			var option = "width = 500, height = 500, top = 100, left = 200, location = no";
            window.open(url, name, option)
		}
	</script>
	</footer>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>