<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<style>
.nav-item a {
	color: black;
}

.nav-item a:hover {
	color: #ccc;
	font-weight: bold;
}
</style>
<body>
	<%-- <ul class="nav justify-content-center">
		<c:forEach var="boardType" items="${boardType}">
			<li class="nav-item"><a class="nav-link" href="/board/list/${boardType.id}">${boardType.boardName}</a></li>
		</c:forEach>
	</ul> --%>
	<div class="category-list-table">
		<table>
			<tr>
				<td class="category-list">
					<button type="submit" name="boardName" value="자유" onclick="location.href='/board/list?type=자유'">자유</button>
				</td>
				<td class="category-list">
					<button type="submit" name="boardName" value="추천" onclick="location.href='/board/list?type=추천'">추천</button>
				</td>
				<td class="category-list">
					<button type="submit" name="boardName" value="팬아트" onclick="location.href='/board/list?type=팬아트'">팬아트</button>
				</td>
				<td class="category-list">
					<button type="submit" name="boardName" value="홍보" onclick="location.href='/board/list?type=홍보'">홍보</button>
				</td>

			</tr>
		</table>
	</div>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">작성자</th>
				<th scope="col">제목</th>
				<th scope="col">분류</th>
				<th scope="col">날짜</th>
			</tr>
		</thead>
		<c:forEach var="list" items="${list}">
			<tbody>
				<tr>
					<td>${list.id}</td>
					<td>${list.username}</td>
					<td><a href="/board/detail/${list.id}" style="text-decoration: none; color: black;">${list.title}</a></td>
					<td>${list.categoryName}</td>
					<td>${list.createdAt}</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
	<button type="button" class="btn btn-primary" onclick="location.href='/board/write'">글쓰기</button>
</body>
</html>