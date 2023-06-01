<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../layout/header.jsp"%>
<html>
<section>
	<div class="container--qna">
		<table>
			<thead>
				<tr>
					<th>NO</th>
					<th>카테고리</th>
					<th>질문제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="qna" items="${qnaPageUtil.content}">
					<tr>
						<td>${qna.id}</td>
						<td>${qna.categoryName}</td>
						<td><a href="/qna/question/${qna.id}">${qna.title}</a></td>
						<td>${qna.nickName()}</td>
						<td>${qna.createdAt()}</td>

					</tr>
					<c:if test="${qna.answer != null }">
						<tr>
							<td></td>
							<td><a href="/qna/answer/${qna.id}">${qna.answer}</td>
							<td>${qna.answerCreatedAt()}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>

		<form action="/qna/list" method="get">
			<select name="faqCategoryId">
				<option value="0">카테고리</option>
				<c:forEach var="category" items="${faqCategorylist}">
					<option value="${category.id}">${category.categoryName}</option>
				</c:forEach>
			</select> <input type="text" name="keyword">
			<button type="submit">검색</button>
		</form>


		<!-- 페이징 처리 -->
		<div class="col-sm-12 col-md-7">
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
</section>

<%@include file="../layout/footer.jsp"%>