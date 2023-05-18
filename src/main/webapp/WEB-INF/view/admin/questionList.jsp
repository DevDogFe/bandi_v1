<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>질문(관리자)</h2>

	<!--<button id="btn" value="">전체</button>  -->
	<button class="btn" value="">전체</button>
	<button class="btn" value="0">미처리</button>
	<button class="btn" value="1">처리완료</button>
	<table>
		<thead>
			<tr>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일자</th>
				<th>처리상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="question" items="${questionList}">
				<tr id="qna">
					<td>${question.categoryName}</td>
					<td><a href="/admin/question/${question.id}">${question.title}</a></td>
					<td>${question.username}</td>
					<td>${question.createdAt()}</td>
					<td>${question.proceed}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<script>
       $(document).ready(function() {
    	      $(".btn").on("click", function() {
    	         location.href = "/admin/questionList?proceed=" + $(this).val();
    	      });
    	   });
	</script>



</body>
</html>
