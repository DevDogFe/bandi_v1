<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/adminHeader.jsp"%>
<link rel="stylesheet" href="/assets/css/admin/adminUserrole.css" />

<style type="text/css">
.search-btn {
	font-size: 20px;
	width: 60px;
	height: 35px;
	border: none;
	color: #ffffff;
	background-color: #546E7A;
	cursor: pointer;
	margin-left: 10px;
	margin-top: 15px;
	border-radius: 3px;
}
</style>
</div>
<div class="sectind-flex">
	<section>
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
	<section>
		<div class="search-user-form scroll">
			<div class="search-user">
				<div class="search">
					<input id="search-input" type="text" name="keyword"><span class="search-span"></span>
				</div>
				<button type="button" id="search-btn" class="search-btn">검색</button>
			</div>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">소설 제목</th>
					<th scope="col">이름</th>
					<th scope="col">서비스 타입</th>
					<th scope="col">변경할 타입</th>
					<th scope="col">수정</th>
					<th scope="col">삭제</th>
				</tr>
			</thead>
			<tbody id="novelList" class="novelList">
			</tbody>
		</table>
	</section>
	<%@include file="/WEB-INF/view/layout/footer.jsp"%>
	<script type="text/javascript" src="/assets/js/admin/adminNovelChange.js"></script>