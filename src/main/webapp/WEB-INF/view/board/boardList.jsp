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
			</tr>
		</thead>
		<c:forEach var="list" items="${list}">
			<tbody id="boardList" class="category">
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
	<button type="button" class="btn btn-primary" onclick="location.href='/board/write/${boardTypeId}'">글쓰기</button>
	<div class="categoryId">
		<select name="categoryId" id="categoryId">
			<c:forEach items="${categoryList }" var="category">
				<option value="${category.id }">${category.categoryName }</option>
			</c:forEach>
		</select>
	</div>
	<div>
		<input type="text">
		<button type="button">검색</button>
	</div>
	<!-- <form id="form1" action="/board/list/2" method="get">
		<input type="hidden" name="c1" value="">
		<input type="hidden" name="c2" value="">
		<input type="hidden" name="c3" value="">
	</form> -->

	<script type="text/javascript">
	     $(document).ready(function () {
	         $(".categoryId").on("change", () => {
	             let selectBox = document.getElementById("categoryId");
	             let value = selectBox.options[selectBox.selectedIndex].value;
	            
	             $.ajax({
	                 type: "get",
	                 url: "/api/list/" + value,
	                 contentType: "application/json"
	             }).done(function (response) {
	                 
	                 $.each(response, function (index, item) {
	                	  for(i = 0; i < response.length;i++){ 
	                		   $(".category").empty(); 
	                     var newRow = "<tr>" +
	                         "<td>" + item.id + "</td>" +
	                         "<td>" + item.username + "</td>" +
	                         "<td><a href='/board/detail/" + item.id + "' style='text-decoration: none; color: black;'>" + item.title + "</a></td>" +
	                         "<td>" + item.categoryName + "</td>" +
	                         "<td>" + item.createdAt + "</td>" +
	                         "</tr>";
	                      $("#boardList").append(newRow); 
	                	  }
	                 });
	             }).fail(function (error) {
	                 alert("서버오류");
	             });
	         });
	     });
	</script>
</body>
</html>