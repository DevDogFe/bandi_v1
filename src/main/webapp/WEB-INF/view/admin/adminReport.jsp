<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
			<a href="#">신고게시물 처리</a>
		</ul>
		<ul>
			<a href="#">카테고리 관리</a>
		</ul>
		<ul>
			<a href="#">장르 관리</a>
		</ul>
		<ul>
			<a href="#">유저롤 변경</a>
		</ul>
	</div>
	<div class="main">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">신고자</th>
					<th scope="col">신고사유</th>
					<th scope="col">날짜</th>
					<th scope="col">확인</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<c:forEach var="list" items="${reportList}">
				<input type="hidden" name="id" id="id-${list.id}" value="${list.id}">
				<tbody id="reportList-${list.id}" class="reportList">
					<tr>
						<td>${list.id}</td>
						<td>${list.username}</td>
						<td>${list.categoryName}</td>
						<td>${list.createdAt()}</td>
						<td>${list.proceed}</td>
						<td><button class="btn btn-primary" onclick="detailPopup(${list.id})">확인</button></td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
	<script type="text/javascript">
		function detailPopup(id) {
			  var url = "/report/reportDetail/" + $("#id-" + id).val();
			  var name = "신고접수확인";
			  var option = "width=500,height=500,top=100,left=200,location=no";
			  window.open(url, name, option);
			}
	</script>
</body>
</html>