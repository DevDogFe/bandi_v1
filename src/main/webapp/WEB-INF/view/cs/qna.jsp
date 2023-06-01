<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<%-- <%@include file="../layout/header.jsp"%>--%>
<!DOCTYPE html>
<html lang="en">
<style>
.qna--answer {
	/*색상 변경*/
	
}

.qna--table {
	border: 1px solid black;
}

.qna--bottom {
	display: flex;
	justify-content: space-between;
}

.qna--search {
	border: 1px solid black;
}

.qna--button {
	border: 1px solid black;
}

.qna--button a {
	border: 1px solid black;
	padding: 0 20px;
}

.qna--page {
	display: flex;
	justify-content: center;
}

table {
	text-align: center;
}

.qna--answer{
	background-color: #f5f5dc;
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
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
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

<!--  <div class="cs--container">
	<div class="cs--container--title">
		<div class="title--cs">
			<h3>고객 센터</h3>
		</div>
		<div class="cs--category">
			<ul>
				<li>Q&A</li>
				<li>FAQ</li>
				<li>공지</li>
				<li>제휴문의</li>
			</ul>
		</div>
	</div>  -->

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
								<td>RE:</td>
								<td colspan="1"><a href="/qna/answer/${qna.id}">${qna.answer}</a></td>
								<td></td>
								<td></td>
								<td>${qna.answerCreatedAt()}</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<br>
		<div class="qna--bottom">
			<!-- 검색 -->
			<div class="qna--search">
				<form action="/qna/list" method="get">
					<select name="faqCategoryId">
						<option value="0">카테고리</option>
						<c:forEach var="category" items="${faqCategorylist}">
							<option value="${category.id}">${category.categoryName}</option>
						</c:forEach>
					</select> <input type="text" name="keyword">
					<button type="submit">검색</button>
				</form>
			</div>

			<!-- button -->
			<div class="qna--button">
				<a href="/qna/write">문의하기</a> <a href="/faq/list">자주묻는질문</a>
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
<!-- </section> -->

<%@include file="../layout/footer.jsp"%>