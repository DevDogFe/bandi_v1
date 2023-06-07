<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/adminHeader.jsp"%>
<link rel="stylesheet" href="/assets/css/admin/adminUserrole.css" />
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
				<div class="search-user-form">
					<form action="/admin/user" method="get">
						<div class="search-user">
							<select class="selectbox" name="type">
								<option value="all">전체</option>
								<option value="nickName">닉네임</option>
							</select>
							<div class="search">
								<input type="text" name="keyword"> <label class="searchlabel">Name</label> <span class="search-span"></span>
							</div>
							<button type="submit" id="button-search">검색</button>
						</div>
					</form>
				</div>
				<div class="scroll">
					<table class="table">
						<thead>
							<tr>
								<th scope="cols">#</th>
								<th scope="cols">이름</th>
								<th scope="cols">닉네임</th>
								<th scope="cols">등급</th>
								<th scope="cols"></th>
							</tr>
						</thead>
						<c:forEach var="list" items="${userList}">
							<tbody id="userList" class="userList">
								<tr class="user">
									<th scope="row">${list.id}</th>
									<td>${list.username}</td>
									<td>${list.nickName}</td>
									<td><select name="userRole" class="userRole">
											<c:forEach var="user" items="${userRoleList}">
												<option value="${user.id}" <c:if test="${user.id == list.userRole}">selected</c:if>>${user.role}</option>
											</c:forEach>
									</select></td>
									<td><c:if test="${param.type eq 'nickName'}">
											<button class="update-userrole" onclick="updateUserRole(${list.id})">수정</button>
										</c:if></td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
			</section>
		<%@include file="/WEB-INF/view/layout/footer.jsp"%>
	<script type="text/javascript" src="/assets/js/admin/adminUserRole.js"></script>
