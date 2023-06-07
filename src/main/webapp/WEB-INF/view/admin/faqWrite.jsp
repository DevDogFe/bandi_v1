<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/adminHeader.jsp"%>
<link rel="stylesheet" href="/assets/css/admin/adminCategory.css" />
<link rel="stylesheet" href="/assets/css/detail.css" />

</head>
<style>
.faq--form--container{
 	margin-top: 20px;
	margin-left: 10px; 
}

.qna--header--form {
	display: flex;
	margin-top: 30px;
}

.qna--title {
	height: 40px;
	width: 400px;
	margin-top: 1px;
	border-radius: 5px;
}

.qna--category {
	height: 40px;
	border-radius: 5px;
	margin-bottom: 10px;
	margin-left: 10px;
}

.qna--button {
	flex: 3;
	display: flex;
	justify-content: flex-end;
}

input {
	border: 1px solid black;
	font-size: 15px;
	padding-top: 5px;
	
}

.qna--button button{
	width: 60px;
	margin-right: 10px;
	margin-top: 5px;
	background-color: #546E7A;
	border: none;
	border-radius: 3px;
	height: 35px; 
	color: #fff;
	font-size: 20px;
	
}
.qna--title-form{
	display: flex;
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

			<!-- faq detail -->
			<section class="flex-grow-1">
				<form action="/admin/faq" method="post" class="faq--form--container">
					<div class="qna--header--form">
						<div class="qna--title-form">
							<input type="text" class="qna--title" name="question" >
							<div class="asd">
							<select name="faqCategoryId" class="qna--category">	
							<option value="0">카테고리</option>						
							<c:forEach var="category" items="${faqCategoryList}">
									<option value="${category.id}">${category.categoryName}</option>	
							</c:forEach>
							</select>
							</div>
						</div>
						
						<div class="qna--button">
							<button type="submit" >등록</button>
						</div>
					</div>
			<textarea id="summernote" name="answer"></textarea>
		</form>
		</section>
		<script type="text/javascript">
			$('#summernote').summernote({
				height : 500,
				disableResizeEditor : true,
			});
		</script>

	<%@include file="/WEB-INF/view/layout/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
