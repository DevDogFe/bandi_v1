<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style type="text/css">
.list--link{
	text-decoration: none;
	color: #black;
}
.list--link:visited {
	color:#333;
}
</style>
</head>
<body>
	<section>
		<article>
			<h1>${serviceType} 소설</h1>
			<table class="table">
				<thead>
					<tr class="table-secondary">
						<td>작품 제목</td>
						<td>작가</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${novelList}" var="novel">
						<tr>
							<td><a href="/novel/detail/${novel.id}" class="list--link">${novel.title}</a></td>
							<td><a href="#" class="list--link">${novel.username}</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</article>
	</section>
</body>
</html>