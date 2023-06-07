<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/adminHeader.jsp"%>
<link rel="stylesheet" href="/assets/css/admin/adminCategory.css" />
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
				<div class="search-form">
					<div class="category-list-table">
						<table>
							<tr>
								<c:forEach items="${boardTypeList}" var="type">
									<td class="category-list">
										<button type="submit" onclick="location.href='/admin/adminCategory/${type.id}'">${type.boardName}</button>
									</td>
								</c:forEach>
							</tr>
						</table>
					</div>
					<form action="/admin/category" method="post">
						<div class="board">
							<select class="selectbox" name="boardTypeId" id="boardTypeId">
								<c:forEach var="boardType" items="${boardTypeList}">
									<option value="${boardType.id}" class="boardType-option">${boardType.boardName}</option>
								</c:forEach>
							</select>
							<div class="search">
								<input type="text" name="categoryName"> <label class="searchlabel">Name</label> <span class="search-span"></span>
							</div>
							<button type="submit" id="button-add">등록</button>
						</div>
					</form>
				</div>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">카테고리</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<c:forEach var="list" items="${categoryList}">
						<tbody id="categoryList" class="category">
							<tr>
								<td>${list.categoryName}</td>
								<td><button class="delete-category" onclick="deleteCategory(${list.id})">삭제</button></td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</section>
		<%@include file="/WEB-INF/view/layout/footer.jsp"%>
	<script type="text/javascript" src="/assets/js/admin/adminCategory.js"></script>