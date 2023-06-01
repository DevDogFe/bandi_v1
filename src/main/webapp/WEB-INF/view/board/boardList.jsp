<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp"%>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel="stylesheet">
<style>
.table_container {
	max-width: 80vw;
	margin-left: auto;
	margin-right: auto;
}

table.boardlist {
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #212529;
	text-align: left;
	box-sizing: border-box;
	border-collapse: collapse;
	width: 100%;
	margin-bottom: 1rem;
	background-color: transparent;
}

table.boardlist thead th {
	font-size: 1rem;
	line-height: 1.5;
	color: #212529;
	border-collapse: collapse;
	box-sizing: border-box;
	text-align: inherit;
	padding: .75rem;
	border-top: 1px solid #dee2e6;
	vertical-align: bottom;
	border-bottom: 2px solid #dee2e6;
}

table.boardlist td {
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #212529;
	text-align: left;
	border-collapse: collapse;
	box-sizing: border-box;
	padding: .75rem;
	vertical-align: top;
	border-top: 1px solid #dee2e6;
}

select {
	width: 85px;
	border-radius: 5px;
	color: #666;
	border: 1px solid #666;
	height: 33px;
	cursor: pointer;
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
	position: absolute;
	left: 200px;
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

input {
	border-radius: 5px;
	border: 1px solid #666;
	width: 350px;
	height: 33px;
}

</style>
<div class="table_container">
	<table class="boardlist">
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
</div>
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
		</select> <input type="text" name="keyword" placeholder="검색어를 입력해주세요."></input>
		<button type="submit" class="btn-search">검색</button>
	</form>
	<button type="button" class="btn-write" onclick="location.href='/board/write/${boardTypeId}'">
		<i class='bx bx-pencil'></i>글쓰기
	</button>
</div>
<div class="mb-5">
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