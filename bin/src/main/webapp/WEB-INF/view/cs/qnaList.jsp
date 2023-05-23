<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../layout/header.jsp"%>

<section>
	<a href="/qna/write">문의하기</a>
	<table>
		<thead>
			<tr>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성일자</th>
				<th>처리결과</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="question" items="${questionList}">
				<tr>
					<td>${question.categoryName}</td>
					<td><a href="/qna/question/${question.id}">${question.title}</a></td>
					<td>${question.createdAt()}</td>
					<td>${question.proceed}</td>
				</tr>
				<c:choose>
					<c:when test="${question.answer != null }">
						<tr>
							<td><a href="/qna/answer/${question.id}">${question.answer}</td>
							<td>${question.answerCreatedAt()}</td>
						</tr>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</tbody>
	</table>

</section>

<%@include file="../layout/footer.jsp"%>