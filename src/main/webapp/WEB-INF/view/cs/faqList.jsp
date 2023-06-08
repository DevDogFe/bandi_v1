<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>

<!-- 작성한 css는 항상 밑에 있어야함 -->
<link rel="stylesheet" href="/assets/css/cs/faqList.css" />
<link rel="stylesheet" href="/assets/css/summernote/summernote-lite.css">
<link rel="stylesheet" href="/assets/css/cs/csCategory.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
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
		<div class="faq--category">
			<ul>
				<li><a href="/faq/list">전체</a></li>
				<c:forEach var="category" items="${faqCategoryList}">
					<li><a href="/faq/list/${category.id}">${category.categoryName}</a></li>
				</c:forEach>
			</ul>
		</div>
		<br>


		<div class="faq--list">
			<!-- 질문 & 답 내용 -->
			<dl class="faq--content">
				<c:forEach var="faq" items="${faqPageUtil.content}">
					<dt class="category--line" onclick="openCloseAnswer(${faq.id})">
						<span>[${faq.categoryName}]&nbsp;${faq.question}</span><a class="faq--question" id="que-${faq.id}"> <span id="toggle-${faq.id}" class="material-symbols-outlined">expand_more </span>
						</a>
					</dt>
					<!-- 답 -->
					<dd class="faq--answer" id="ans-${faq.id}">
						<p>${faq.answer}</p>
					</dd>
				</c:forEach>
			</dl>
		</div>

		<!-- 페이징 처리 -->
		<div class="faq--page mt-2">
			<div>
				<ul class="d-flex">
					<li class="<c:if test='${faqPageUtil.currentPage == 1}'>d-none</c:if>"><a href="/faq/list?currentPage=${faqPageUtil.currentPage - 1}" class="page-link">Previous</a></li>
					<c:forEach var="pNo" begin="${faqPageUtil.startPage}" end="${faqPageUtil.endPage}" step="1">
						<li <c:if test="${pNo == faqPageUtil.currentPage}">class="active"</c:if>><a href="/faq	/list?currentPage=${pNo}" class="page-link">${pNo}</a></li>
					</c:forEach>
					<li class="<c:if test='${faqPageUtil.endPage == faqPageUtil.currentPage }'>d-none</c:if>"><a href="/faq/list?currentPage=${faqPageUtil.currentPage + 1}" class="page-link">Next</a></li>
				</ul>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript" src="/assets/js/cs/faqList.js"></script>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>