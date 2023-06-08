<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<!-- 작성한 css는 항상 밑에 있어야함 -->
<link rel="stylesheet" href="/assets/css/cs/qnaList.css" />
<link rel="stylesheet" href="/assets/css/summernote/summernote-lite.css">
<link rel="stylesheet" href="/assets/css/cs/csCategory.css" />

<section>
	<div class="cs--container">
		<div class="cs--container--title">
			<div class="cs--title">
				<h3>고객 센터</h3>
			</div>
			<div class="cs--category">
				<ul>
					<li><a href="/qna/list">Q&A</a></li>
					<li><a href="/faq/list">FAQ</a></li>
					<li><a href="/application/write">제휴문의</a></li>
				</ul>
			</div>
		</div>


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
									<td></td>
									<td></td>
									<td><a href="/qna/answer/${qna.id}">[RE]: ${qna.title}</a></td>
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
					<button onclick="location.href='/qna/write'">문의하기</button>
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

<%@include file="/WEB-INF/view/layout/footer.jsp"%>