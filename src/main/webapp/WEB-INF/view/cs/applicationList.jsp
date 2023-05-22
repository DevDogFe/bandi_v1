<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>마이페이지(연재문의글조회)</h2>
	<a href="/application/write">연재문의</a>
	<table>
		<tr>
			<th>제목</th>
			<th>작성일</th>
		</tr>
		<c:forEach var="application" items="${application}">
			<tr>
				<td><a href="/application/detail/${application.id}">${application.title}</a></td>
				<td>${application.createdAt()}</td>
			</tr>
		</c:forEach>

	</table>

</body>
</html>