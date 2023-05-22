<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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
	<div class="category-list-table">
		<table>
			<tr>
				<c:forEach items="${boardTypeList }" var="type">
					<td class="category-list">
						<button type="submit" onclick="location.href='/board/list/${type.id}'">${type.boardName}</button>
					</td>
				</c:forEach>
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
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<c:forEach var="list" items="${boardList.content}">
			<tbody id="boardList" class="category">
				<tr>
					<td>${list.id}</td>
					<td>${list.username}</td>
					<td><a href="/board/detail/${list.id}" style="text-decoration: none; color: black;">${list.title}</a></td>
					<td>${list.categoryName}</td>
					<td>${list.createdAt()}</td>
					<td>${list.views}</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>

	<div>
		<form action="/board/list/${boardTypeId}" method="get">
			<select name="categoryId" id="categoryId">
					<option value="">전체</option>
				<c:forEach items="${categoryList }" var="category">
					<option value="${category.id }">${category.categoryName }</option>
				</c:forEach>
			</select> <select name="type">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select> <input type="text" name="keyword"></input>
			<button type="submit" class="btn btn-primary">검색</button>
			<button type="button" class="btn btn-primary" onclick="location.href='/board/write/${boardTypeId}'">글쓰기</button>
		</form>
	</div>
	<div class="col-sm-12 col-md-7">
		<div>
			<ul class="d-flex">
				<li class="<c:if test='${boardList.currentPage == 1}'>d-none</c:if>" id=""><a href="/board/list/${boardTypeId}?currentPage=${boardList.currentPage - 1}" class="page-link">Previous</a></li>
				<c:forEach var="pNo" begin="${boardList.startPage}" end="${boardList.endPage}" step="1">
					<li <c:if test="${pNo == boardList.currentPage}">class="active"</c:if>><a href="/board/list/${boardTypeId}?currentPage=${pNo}" class="page-link">${pNo}</a></li>
				</c:forEach>
				<li class="<c:if test='${boardList.endPage == boardList.currentPage }'>d-none</c:if>" id=""><a href="/board/list/${boardTypeId}?currentPage=${boardList.currentPage + 1}" class="page-link">Next</a></li>
			</ul>
		</div>
	</div>

</body>
</html>