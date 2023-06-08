<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<!-- 작성한 css는 항상 밑에 있어야함 -->
<link rel="stylesheet" href="/assets/css/style.css" />
<link rel="stylesheet" href="/assets/css/board/boardDetail.css" />
<link rel="stylesheet" href="/assets/css/cs/questionDetail.css" />
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

		<section class="one-tab-list">
			<div class="section-title-wrap">
				<h2 class="section-title">${question.title}</h2>
			</div>
			<div class="board-detail">
				<h3 class="board-title">
					<span>${question.categoryName}</span>
				</h3>
			</div>
			<div class="board-detail-wrap"> <span class="board-info-wrap"> <span class="profile-info-wrap"> <span class="profile-preview-wrap"></span> <span class="info-inner"> <span
							class="name">${question.username}</span> <span class="date">${question.createdAt()}</span>
					</span> <span class=“btn-right-wrap”> <span class=“modify-wrap”> 
					<c:if test="${principal.id == question.userId }">
									<button type="submit" class="btn-delete" onclick="location.href='/qna/question/update/${question.id}'">수정</button>
									<button type="button" class="btn-modify" onclick="location.href='/qna/question/delete/${question.id}'">삭제</button>
								</c:if>
						</span> <span class="list-wrap">
								<button type="submit" class="btn-list" onclick="location.href='/qna/list'">목록</button>
						</span>
					</span>
				</span> <span class="board-contents"> <span id="_board-contents">${question.content}</span>
				</span>
			</span>
			</div>
		</section>

	</div>
</section>

<%@include file="/WEB-INF/view/layout/footer.jsp"%>