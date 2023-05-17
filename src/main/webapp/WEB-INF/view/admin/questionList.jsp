<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../layout/header.jsp"%>

<section>
	<table>
		<thead>
			<tr>
				<th>관리자</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="question" items="${questionList}">
				<tr>
					<td>${question.categoryName}</td>
					<td><a href="/admin/question/${question.id}">${question.title}</a></td>
					<td>${question.username}</td>
					<td>${question.createdAt()}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</section>
<%@include file="../layout/footer.jsp"%>