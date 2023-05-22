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
	<h1>연재조회(관리자)</h1>
	<table>
		<tr>
			<th>제목</th>
			<th>작성자</th>	
			<th>작성일</th>	
		</tr>
		<c:forEach var="application" items="${applicationList}">
			<tr>
				<td><a href="/admin/applicationDetail/${application.id}">${application.title}</a></td>
				<td>${application.username}</td>
				<td>${application.uploadFileName}</td>
				<td>${application.createdAt()}</td>
			</tr>

		</c:forEach>

	</table>
</body>
</html>