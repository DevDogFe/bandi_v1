<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../layout/header.jsp"%>

<section>

	<table>
		<thead>
			<tr>
				<th>제목</th>
				<th>카테고리</th>
				<th>작성자</th>
				<th>작성일자</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<c:forEach var="qna" items="${qnaList}">
				<td>${qna.id}</td>
				<td>${qna.faqCategoryId}</td>
				<td>${qna.title}</td>
				<td>${qna.questContent}</td>
				<td>${qna.questcreatedAt}</td>
				<!-- 답변 -->
				<td>${qna.ansContent}</td>
				<td>${qna.anscreatedAt}</td>
				
				</c:forEach>
			</tr>
		</tbody>
	</table>
	
	</section>
<%@include file="../layout/footer.jsp"%>