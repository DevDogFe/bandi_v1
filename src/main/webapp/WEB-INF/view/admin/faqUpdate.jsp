<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/adminHeader.jsp"%>
<link rel="stylesheet" href="/assets/css/admin/adminCategory.css" />
<link rel="stylesheet" href="/assets/css/detail.css" />
<link rel="stylesheet" href="/assets/css/admin/faqUpdate.css" />

</head>
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

			<!-- faq detail -->
			<section class="flex-grow-1">
				<form action="/admin/faq/update/${faq.faqCategoryId}" method="post" class="faq--form--container">
					<div class="qna--header--form">
						<div class="qna--title-form">
							<input type="text" class="qna--title" name="question" value=" ${faq.question}">
							<div class="asd">
							<select name="faqCategoryId" class="qna--category">							
							<c:forEach var="category" items="${faqCategoryList}">
							 <c:choose>
							 	<c:when test="${category.id == faq.faqCategoryId}">
								<option selected="selected" value="${category.id}">${category.categoryName}</option>
								</c:when>
								<c:otherwise>
									<option value="${category.id}">${category.categoryName}</option>
								</c:otherwise>
								</c:choose>
								</c:forEach>
							</select>
							</div>
						</div>
						
						<div class="qna--button">
							<button type="submit"  >수정</button>
						</div>
					</div>
			<textarea id="summernote" name="answer">${faq.answer}</textarea>
		</form>
		</section>
		<script type="text/javascript">
			$('#summernote').summernote({
				height : 500,
				disableResizeEditor : true,
			});
		</script>

	<%@include file="/WEB-INF/view/layout/footer.jsp"%>
