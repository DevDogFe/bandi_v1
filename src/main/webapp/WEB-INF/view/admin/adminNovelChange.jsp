<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<style>
.sidebar {
	display: table-cell;
	width: 15%;
	min-width: 200px;
	background-color: #0A8A8A;
	vertical-align: top;
	margin-left: 20px;
	padding-bottom: 100%;
}

.main {
	display: table-cell;
	width: 85%;
}

.sidebar ul {
	color: white;
	font-size: 20px;
}

.sidebar ul a {
	
}
</style>
<body>
	<div class="sidebar">
		<ul>
			<a href="/report/reportList">신고게시물 처리</a>
		</ul>
		<ul>
			<a href="/admin/adminCategory">카테고리 관리</a>
		</ul>
		<ul>
			<a href="#">장르 관리</a>
		</ul>
		<ul>
			<a href="#">유저롤 변경</a>
		</ul>
	</div>
	<div class="main">
		<nav class="navbar navbar-light bg-light">
  			<div class="container-fluid">
    			<form class="d-flex">
      				<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
      				<button id="search" class="btn btn-outline-success" type="button"
      					onclick="searchNovelList(${list.id})">Search</button>
    			</form>
  			</div>
		</nav>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">소설 리스트</th>
					<th scope="col"></th>
					<th scope="col"></th>
				</tr>
			</thead>
			<c:forEach var="list" items="${categoryList}">
				<tbody id="categoryList" class="category">
					<tr>
						<td>${list.categoryName}</td>
						<td><button class="btn btn-danger" onclick="deleteCategory(${list.id})">삭제</button></td>
						<td><button class="btn btn-primary">수정</button></td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
	<script>
		function searchNovelList(id) {
			var selectedOptionId = $("#boardTypeId option:selected").val();
			$.ajax({
				type: "DELETE",
				url: "/api/category/" + id,
			}).done(function(response){
				location.href = '/admin/adminCategory/' + selectedOptionId;
			}).fail(function(error){
				alert("요청 실패");
			});
		}
	</script>
</body>
</html>