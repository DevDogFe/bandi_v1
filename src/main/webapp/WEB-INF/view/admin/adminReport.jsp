<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/adminHeader.jsp"%>
<link rel="stylesheet" href="/assets/css/admin/adminReport.css" />
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
				</div>
			</section>
			<section>
				<div class="reportList">
					<div class="scroll">
						<table class="table">
							<thead>
								<tr>
									<th scope="cols">#</th>
									<th scope="cols">신고자</th>
									<th scope="cols">신고사유</th>
									<th scope="cols">날짜</th>
									<th scope="cols">확인</th>
									<th scope="cols"></th>
								</tr>
							</thead>
							<c:forEach var="list" items="${reportList}">
								<input type="hidden" name="id" id="id-${list.id}" value="${list.id}">
								<tbody id="reportList-${list.id}" class="reportList">
									<tr>
										<th scope="row">${list.id}</th>
										<td>${list.username}</td>
										<td>${list.categoryName}</td>
										<td>${list.createdAt()}</td>
										<td>${list.proceed}</td>
										<td><button class="btncheck" onclick="detailPopup(${list.id})">확인</button></td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
				</div>
			</section>
		<%@include file="/WEB-INF/view/layout/footer.jsp"%>
	<script type="text/javascript" src="/assets/js/admin/adminReport.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>