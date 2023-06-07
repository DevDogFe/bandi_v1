<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/adminHeader.jsp"%>
<link rel="stylesheet" href="/assets/css/admin/adminCategory.css" />
<link rel="stylesheet" href="/assets/css/detail.css" />

</head>
<style>
#qna--list--container {
	margin-left: 20px;
}

.section-title {
	margin-left: 5px;
}

.board-detail-wrap {
	border-bottom: 1px solid #999;
}

.board-detail {
	border: none;
}

#answer--wrap {
	margin-top: 0;
	margin-left: -20px;
	border-bottom: 1px solid #f2f2f2;
}

form button{
	background-color: #3b6bc9;
	border-radius: 3px;
	color: #fff;
	border: none;
	width: 80px;
	height: 35px;	
}

</style>
		</div>
		<div class="d-flex align-items-start">
			<section class="d-flex">
				<div class="sidebar">
					<div class="logo_content">
						<div class="logo">
							<i class='bx bx-leaf'></i>
							<div class="logo_name">반디</div>
						</div>
					</div>
					<ul class="nav_list">
						<li><a href="/admin/dashboard"> <i class='bx bx-chalkboard'></i> <span class="links_name">대시보드</span>
						</a></li>
						<li><a href="/report/reportList"> <i class='bx bxs-bell-minus'></i> <span class="links_name">신고 게시물 처리</span>
						</a></li>
						<li><a href="/admin/adminCategory"> <i class='bx bx-bookmark-alt-plus'></i> <span class="links_name">카테고리 관리</span>
						</a></li>
						<li><a href="/admin/novelChange"> <i class='bx bx-book-reader'></i> <span class="links_name">소설 타입 변경</span>
						</a></li>
						<li><a href="/admin/genre"> <i class='bx bx-book-add'></i> <span class="links_name">장르 관리</span>
						</a></li>
						<li><a href="/admin/user"> <i class='bx bx-user'></i> <span class="links_name">사용자 변경</span>
						</a></li>
						<li><a href="/admin/faqList"> <i class='bx bx-conversation'></i> <span class="links_name">자주 묻는 질문</span>
						</a></li>
						<li><a href="/admin/qnaList"> <i class='bx bx-message-square-dots'></i> <span class="links_name">Q&A</span>
						</a></li>
						<li><a href="/admin/applicationList"> <i class='bx bx-message-square-dots'></i> <span class="links_name">연재 문의</span>
						</a></li>
					</ul>
				</div>
			</section>

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
							</span> <span class="list-wrap">
									<button type="button" class="btn-list"  onclick="location.href='/admin/qnaList'">목록</button>
							</span>
						</span>
					</span> <span class="board-contents"> <span id="_board-contents"> ${question.content} </span>
					</span>
				</span>
				</span>
				<!-- 답 -->
				<c:choose>
					<c:when test="${answer == null}">
						<div class="bg-light comment-form">
							<div class="comment-header ms-1">
								<h5 class="me-2">답</h5>
							</div>
							<form action="/admin/answer/${question.id}" method="post">
								<textarea class="form-control ml-1 shadow-none textarea" name="content"></textarea>
								<div class="mt-2 text-right float-end" id="answer--submit">
									<button type="submit">등록</button>
								</div>
							</form>
						</div>
						<div class="comment-top">
							<div></div>
						</div>
					</c:when>

					<c:otherwise>

						<div class="board-detail">
							<h3 class="board-title">
								<span>답</span>
							</h3>
						</div>
						<span class="board-detail-wrap"> <span class="board-info-wrap"> <span class=“modify-wrap”>
									<button type="button" class="btn-modify" onclick="location.href='/admin/answer/update/${question.id}'">수정</button>
							</span> <span class="list-wrap">
									<button type="submit" class="btn-list" onclick="location.href='/admin/answer/delete/${question.id}'">삭제</button>
							</span> <span class="board-contents"> <span id="_board-contents">${answer.content}</span>
							</span>

						</span>

						</span>

					</c:otherwise>
				</c:choose>
			</section>

			<%@include file="/WEB-INF/view/layout/footer.jsp"%>
			
