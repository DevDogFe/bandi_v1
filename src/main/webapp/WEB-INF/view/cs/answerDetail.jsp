<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<script src="/assets/js/custom-slick.js"></script>
<link rel="stylesheet" href="/assets/css/admin/admin.css" />
<link rel="stylesheet" href="/assets/css/admin/adminCategory.css" />
<link rel="stylesheet" href="/assets/css/detail.css" />
<link rel="stylesheet" href="/assets/css/cs/answerDetail.css" />
<%@include file="layout/csCategory.jsp"%>


<!-- Q&A detail -->
<section class="flex-grow-1" id="qna--list--container">
	<div class="section-title-wrap">
		<h2 class="section-title">${question.title}</h2>
	</div>
	<div class="board-detail">
		<h3 class="board-title">
			<span>${question.categoryName}</span>
		</h3>
	</div>
	<span class="board-detail-wrap"> <span class="board-info-wrap"> <span class="profile-info-wrap"> <span class="profile-preview-wrap"></span> <span class="info-inner"> <span
					class="name">${question.username}</span> <span class="date">${question.createdAt()}</span>
			</span> <span class=“btn-right-wrap”> <span class=“modify-wrap”>
						<button type="button" class="btn-modify" onclick="location.href='/qna/question/delete/${question.id}'">삭제</button>
				</span> <span class="list-wrap">
						<button type="button" class="btn-list" onclick="location.href='/qna/list'">목록</button>
				</span>
			</span>
		</span> <span class="board-contents"> <span id="_board-contents"> ${question.content} </span>
		</span>
	</span>
	</span>

	<!-- 답 -->
	<div class="board-detail">
		<h3 class="board-title">
			<span>답</span>
		</h3>
	</div>
	<span class="board-detail-wrap"> <span class="board-info-wrap"> <span class="board-contents"> <span id="_board-contents">${answer.content}</span>
	</span>
	</span>
	</span>
</section>
</div>
</section>

<%@include file="/WEB-INF/view/layout/footer.jsp"%>