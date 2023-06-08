<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/adminHeader.jsp"%>
<link rel="stylesheet" href="/assets/css/admin/adminApplicationList.css" />
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

	<!-- application List -->
	<section>
		<div class="admin--apply--container">

			<table class="table">
				<thead>
					<tr>
						<th>NO</th>
						<th>제목</th>
						<th>작성자</th>
						<th>연락처</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="application" items="${applicationList}">
						<tr>
							<td>${application.id}</td>
							<td><a href="/admin/applicationDetail/${application.id}">${application.title}</a></td>
							<td>${application.username}</td>
							<td>${application.tel}</td>
							<td>${application.createdAt()}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- page -->
			<%-- 					<div class="apply--page mt-2">
						<div>
							<ul class="apply--page d-flex">
								<li class="<c:if test='${faqPageUtil.currentPage == 1}'>d-none</c:if>"><a href="/faq/list?currentPage=${faqPageUtil.currentPage - 1}" class="page-link">Previous</a></li>
								<c:forEach var="pNo" begin="${faqPageUtil.startPage}" end="${faqPageUtil.endPage}" step="1">
									<li <c:if test="${pNo == faqPageUtil.currentPage}">class="active"</c:if>><a href="/faq	/list?currentPage=${pNo}" class="page-link">${pNo}</a></li>
								</c:forEach>
								<li class="<c:if test='${faqPageUtil.endPage == faqPageUtil.currentPage }'>d-none</c:if>"><a href="/faq/list?currentPage=${faqPageUtil.currentPage + 1}" class="page-link">Next</a></li>
							</ul>
						</div>
					</div> --%>
			<!-- page END -->

		</div>
	</section>
</div>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>
