<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/adminHeader.jsp"%>
<!-- 작성한 css는 항상 밑에 있어야함 -->
<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/admin/admin.css" />
<link rel="stylesheet" href="/assets/css/admin/adminCategory.css" />
<link rel="stylesheet" href="/assets/css/admin/adminQuestionList.css" />
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

	<!-- Q&A List -->
	<section>
		<div class="admin--qna--container">
			<div class="scroll">
				<table class="table">
					<div class="qna--btn--list">
						<button class="qnaList--btn" value="-1">전체</button>
						<button class="qnaList--btn" value="0">미처리</button>
						<button class="qnaList--btn" value="1">처리완료</button>
					</div>
					<thead>
						<tr>
							<th>카테고리</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일자</th>
							<th>처리상태</th>
						</tr>
					</thead>
					<tbody id="qnaListBody">
						<c:forEach var="question" items="${questionList}">
							<tr id="qna" class="qna--table">
								<td class="qna--table" style="width: 220px;">${question.categoryName}</td>
								<td class="qna--table"><a href="/admin/question/${question.id}">${question.title}</a></td>
								<td class="qna--table">${question.username}</td>
								<td class="qna--table">${question.createdAt()}</td>
	
								<c:choose>
									<c:when test="${question.proceed == 0}">
										<td class="qna--table">미처리</td>
									</c:when>
									<c:otherwise>
										<td class="qna--table">처리</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</section>
</div>
<script type="text/javascript" src="/assets/js/admin/adminQuestionList.js"></script>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>
