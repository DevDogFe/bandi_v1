<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp"%>
<%@include file="layout/csCategory.jsp"%>
<style>
.qna--answer{
	/*색상 변경*/
}

.qna--table {
	border: 1px solid black;
}

.qna--bottom{
	display: flex;
	justify-content: space-between;
	
}
.qna--search {
	border: 1px solid black;
}

.qna--button {
	border: 1px solid black;
}

.qna--button a {
	border: 1px solid black;
	padding: 0 20px;
}

.qna--page {
	display: flex;
	justify-content: center;
}

table{
	text-align: center;
}
</style>

<div class="qna--container">
	<br>
	<div class="qna--table">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">NO</th>
					<th scope="col">카테고리</th>
					<th scope="col">질문제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
			<tbody>

				<!-- 질문 -->
				<c:forEach var="qna" items="${qnaPageUtil.content}">
					<tr>
						<td>${qna.id}</td>
						<td>${qna.categoryName}</td>
						<td><a href="/qna/question/${qna.id}">${qna.title}</a></td>
						<td>${qna.nickName()}</td>
						<td>${qna.createdAt()}</td>
					</tr>

					<!-- 답 TODO-->
					<c:if test="${qna.answer != null}">
						<tr class="qna--answer">
							<td>RE:</td>
							<td colspan="1"><a href="/qna/answer/${qna.id}">${qna.answer}</a></td>
							<td></td>
							<td></td>
							<td>${qna.answerCreatedAt()}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<br>
	<div class="qna--bottom">
		<!-- 검색 -->
		<div class="qna--search">
			<form action="/qna/list" method="get">
				<select name="faqCategoryId">
					<option value="0">카테고리</option>
					<c:forEach var="category" items="${faqCategorylist}">
						<option value="${category.id}">${category.categoryName}</option>
					</c:forEach>
				</select> <input type="text" name="keyword">
				<button type="submit">검색</button>
			</form>
		</div>
		
		<!-- button -->
		<div class="qna--button">
			<a href="/qna/write">문의하기</a> <a href="/faq/list">자주묻는질문</a>
		</div>
	</div>

	<!-- 페이징 처리 -->
	<div class="qna--page">
		<div>
			<ul class="d-flex">
				<li class="<c:if test='${qnaPageUtil.currentPage == 1}'>d-none</c:if>"><a href="/qna/list?currentPage=${qnaPageUtil.currentPage - 1}" class="page-link">Previous</a></li>
				<c:forEach var="pNo" begin="${qnaPageUtil.startPage}" end="${qnaPageUtil.endPage}" step="1">
					<li <c:if test="${pNo == qnaPageUtil.currentPage}">class="active"</c:if>><a href="/qna/list?currentPage=${pNo}" class="page-link">${pNo}</a></li>
				</c:forEach>
				<li class="<c:if test='${qnaPageUtil.endPage == qnaPageUtil.currentPage }'>d-none</c:if>"><a href="/qna/list?currentPage=${qnaPageUtil.currentPage + 1}" class="page-link">Next</a></li>
			</ul>
		</div>
	</div>
	<!-- 페이징 처리 끝 -->
</div>
<!-- -------------------------------- -->
</div>
</section>

<%@include file="../layout/footer.jsp"%>