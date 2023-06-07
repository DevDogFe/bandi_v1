<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/adminHeader.jsp"%>
<link rel="stylesheet" href="/assets/css/admin/adminCategory.css" />
<link rel="stylesheet" href="/assets/css/admin/adminFaqList.css" />
</head>
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

			<!-- FAQ List -->
			<section>
				<div class="admin--faq--container">
					
						<div class="faq--btn--list">
							<select id="category" name="categoryId">
								<option value="0">전체</option>
								<c:forEach var="category" items="${faqCategoryList}">
									<option value="${category.id}">${category.categoryName}</option>
								</c:forEach>
							</select>					
							<button id="delete--btn">삭제</button>
							<a href="/admin/faq"><button>글쓰기</button></a>
						</div>
						
						<table class="table">
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 40%;">
							<col style="width: 40%;">
							<col style="width: 10%;">
						</colgroup>					
						<thead>
							<tr>
								<th id="check--All"></th>
								<th>질문</th>
								<th>답변</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody id="faqListBody">

							<c:forEach var="faq" items="${faqPageUtil.content}">
								<tr class="faq--table">
									<td class="faq--table"><input type="checkbox" id="check--id" name="check--id" value="${faq.id}"></td>
									<td class="faq--table">${faq.question}</td>
									<td class="faq--table">${faq.answer}</td>
									<td class="faq--table"><a href="/admin/faq/update/${faq.id}"><button>수정</button></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="faq--page mt-2">
						<div>
							<ul class="faq--page d-flex">
								<li class="<c:if test='${faqPageUtil.currentPage == 1}'>d-none</c:if>"><a href="/admin/faqList?currentPage=${faqPageUtil.currentPage - 1}" class="page-link">Previous</a></li>
								<c:forEach var="pNo" begin="${faqPageUtil.startPage}" end="${faqPageUtil.endPage}" step="1">
									<li <c:if test="${pNo == faqPageUtil.currentPage}">class="active"</c:if>><a href="/admin/faqList?currentPage=${pNo}" class="page-link">${pNo}</a></li>
								</c:forEach>
								<li class="<c:if test='${faqPageUtil.endPage == faqPageUtil.currentPage }'>d-none</c:if>"><a href="/admin/faqList?currentPage=${faqPageUtil.currentPage + 1}" class="page-link">Next</a></li>
							</ul>
						</div>
					</div>	
				</div>
			</section>
		<%@include file="/WEB-INF/view/layout/footer.jsp"%>
	<script type="text/javascript" src="/assets/js/admin/adminFaqList.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>