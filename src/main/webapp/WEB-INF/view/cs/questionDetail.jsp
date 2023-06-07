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
<link rel="stylesheet" href="/assets/css/style.css" />
<link rel="stylesheet" href="/assets/css/board/boardDetail.css" />
</head>
<style>
.btn-modify{
	right: 30px;
}

.btn-delete {
 	right: 80px;
}
</style>
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
<%@include file="layout/csCategory.jsp"%>

			<section class="one-tab-list">
				<div class="section-title-wrap">
					<h2 class="section-title">${question.title}</h2>
				</div>
				<div class="board-detail">
					<h3 class="board-title">
						<span>${question.categoryName}</span>
					</h3>
				</div>
				<span class="board-detail-wrap"> 
					<span class="board-info-wrap"> 
						<span class="profile-info-wrap"> 
							<span class="profile-preview-wrap"></span>
							<span class="info-inner"> 
								<span class="name">${question.username}</span> 
								<span class="date">${question.createdAt()}</span>
							</span>
						<span class=“btn-right-wrap”> 
							<span class=“modify-wrap”> 
							<c:if test="${principalId == question.userId }">  
						            <button type="submit" class="btn-delete" onclick="location.href='/qna/question/update/${question.id}'">수정</button>
						            <button type="button" class="btn-modify" onclick="location.href='/qna/question/delete/${question.id}'">삭제</button>
							 </c:if> 
							</span>
							<span class="list-wrap">									
									<button type="submit" class="btn-list" onclick="location.href='/qna/list'">목록</button>
							</span> 
						</span> 
						</span>
						<span class="board-contents"> 
							<span id="_board-contents">${question.content}</span>
						</span>
					</span>
				</span>
			</section>


<%-- 	
	<ul>
		<li>${question.title}</li>
		<li>${question.categoryName}</li>
		<li>${question.username}</li>
		<li>${question.content}</li>
		<li>${question.createdAt()}</li>
	</ul> --%>
	
<%-- 	<c:if test="${principalId == question.userId }">
		<a href="/qna/question/update/${question.id}">수정</a>
		<a href="/qna/question/delete/${question.id}">삭제</a>
	</c:if> --%>

</body>
</html>