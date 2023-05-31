<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp"%>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel="stylesheet">
<style>
table {
	border-spacing: 0;
	border-collapse: collapse;
	table-layout: fixed;
}

table.table thead {
	display: table-header-group;
	vertical-align: middle;
	border-color: inherit;
}

table.table thead tr th {
	height: 37px;
}

table.table tbody {
	display: table-row-group;
	vertical-align: middle;
	border-color: inherit;
}

table.table tbody tr td {
	padding: 10px 8px 8px;
	font-size: 1.2rem;
	letter-spacing: 0px;
	border: none;
	border-bottom: 1px solid #ededed;
	color: #333;
	font-family: "Lato", "Noto Sans KR";
}

table.table tbody tr td a {
	height: 51px;
	line-height: 1.2ren;
	color: #333;
	font-family: "Lato", "Noto Sans KR";
}

table.table tbody tr td .username {
	text-align: center;
	color: #333;
	font-size: 1.4rem;
	letter-spacing: -0.7px;
}

.categoryId {
	width: 100%;
	height: 32px;
	color: #666;
	background: #fff;
	padding: 0 33px 0 10px;
	border: 1px solid #d5d5d5;
	border-radius: 5px;
	font-size: 1.3rem;
	letter-spacing: -0.65px;
	line-height: 1.3;
	webkit-appearance: none;
}

.search {
	display: flex;
	justify-content: center;
}

.btn-search {
	background: #fff;
	border-color: #999;
	color: #666;
	border-radius: 5px;
	border: 1px solid #666;
	width: 70px;
	height: 35px;
}

.btn-write {
	color: #666;
	background: #fff;
	border-radius: 30px;
	border: 1px solid #666;
	width: 120px;
	height: 45px;
}

.bx-pencil {
	margin-right: 3px;
	font-size: 15px;
}
</style>
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
				<td class="username">${list.username}</td>
				<td class="title"><a href="/board/detail/${list.id}" style="text-decoration: none;">${list.title}</a></td>
				<td>${list.categoryName}</td>
				<td>${list.createdAt()}</td>
				<td>${list.views}</td>
			</tr>
		</tbody>
	</c:forEach>
</table>

<div class="search">
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
		<button type="submit" class="btn-search">검색</button>
	</form>
</div>
<button type="button" class="btn-write" onclick="location.href='/board/write/${boardTypeId}'">
	<i class='bx bx-pencil'></i>글쓰기
</button>
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

<%@include file="../layout/footer.jsp"%>