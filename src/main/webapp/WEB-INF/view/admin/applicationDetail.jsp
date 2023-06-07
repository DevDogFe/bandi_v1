<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/adminHeader.jsp"%>
<link rel="stylesheet" href="/assets/css/admin/adminCategory.css" />
<link rel="stylesheet" href="/assets/css/detail.css" />
<style>
#qna--list--container{
	margin-left: 20px; 
}

.board-detail h3.board-title{
	border-bottom: none;
}

.board-detail-wrap {
    margin-top: -37px;
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
					<h2 class="section-title">${application.title}</h2>
				</div>
 				<div class="board-detail">
					<h3 class="board-title">
						<span></span>
					</h3>
				</div> 
				<span class="board-detail-wrap">
				<span class="board-info-wrap">
				<span class="profile-info-wrap">
				<span class="profile-preview-wrap"></span> <span class="info-inner">
				<span class="name">${application.username} (${application.tel})</span>
				<span class="date">${application.createdAt()}</span>
				</span>
				<span class=“btn-right-wrap”>
				<span class=“modify-wrap”>
				</span>
				<span class="list-wrap">
					<button type="submit" class="btn-list" onclick="location.href='/application/delete/${application.id}'">삭제</button>
				</span>
				</span>
				</span>
				<span class="board-contents">
				<span id="_board-contents"> ${application.content} </span>
				</span>
				</span>
				</span>		
			
			</section>
		</div>
<!-- --------------------- -->
 		<%@include file="/WEB-INF/view/layout/footer.jsp"%>

