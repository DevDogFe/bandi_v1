<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
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
			<a href="/admin/genre">장르 관리</a>
		</ul>
		<ul>
			<a href="/admin/user">유저롤 변경</a>
		</ul>
	</div>
	<div class="main">
		<form action="/admin/user" method="get">
			<div class="input-group mb-3">
				<select name="type">
					<option value="all">전체</option>
					<option value="nickName">닉네임</option>
				</select> <input class="form-control" type="text" name="keyword">
				<button class="btn btn-outline-secondary" type="submit"
					id="button-addon2">검색</button>
			</div>
		</form>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">이름</th>
					<th scope="col">닉네임</th>
					<th scope="col">등급</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<c:forEach var="list" items="${userList}">
				<tbody id="userList" class="userList">
					<tr class="user">
						<td>${list.id}</td>
						<td>${list.username}</td>
						<td>${list.nickName}</td>
						<td><select name="userRole" class="userRole">
								<c:forEach var="user" items="${userRoleList}">
									<option value="${user.id}"
										<c:if test="${user.id == list.userRole}">selected</c:if>>${user.role}</option>
								</c:forEach>
						</select></td>
						<td><c:if test="${param.type eq 'nickName'}">
								<button class="btn btn-primary"
									onclick="updateUserRole(${list.id})">수정</button>
							</c:if></td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
	<script>
	  function updateUserRole(userId) {
	    var selectedUserRole = $(".userList").find("select.userRole").val();
	    var checkList = $('.user');
	    var td = checkList.children();
	    var userId = td.eq(0).text();
	    $.ajax({
	      type: "POST",
	      url: "/api/userRole",
	      contentType: "application/json",
	      dataType: "json",
	      data: JSON.stringify({
	        id: userId,
	        userRole: selectedUserRole
	      })
	    }).done(function(response) {
	    	alert("수정 성공");
	    }).fail(function(error) {
	      alert("요청 실패");
	    });
	  }
</script>
</body>
</html>