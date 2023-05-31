<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Noto Sans KR', sans-serif;
}

.sidebar {
	position: fixed;
	left: 0;
	top: 0;
	height: 100%;
	width: 78px;
	background: #11101D;
	padding: 6px 14px;
	z-index: 99;
	transition: all 0.5s ease;
}

.sidebar.open {
	width: 250px;
}

.sidebar .logo-details {
	height: 60px;
	display: flex;
	align-items: center;
	position: relative;
}

.sidebar .logo-details .icon {
	opacity: 0;
	transition: all 0.5s ease;
}

.sidebar .logo-details .logo_name {
	color: #fff;
	font-size: 20px;
	font-weight: 600;
	opacity: 0;
	transition: all 0.5s ease;
}

.sidebar.open .logo-details .icon, .sidebar.open .logo-details .logo_name {
	opacity: 1;
}

.sidebar .logo-details #btn {
	position: absolute;
	top: 50%;
	right: 0;
	transform: translateY(-50%);
	font-size: 22px;
	transition: all 0.4s ease;
	font-size: 23px;
	text-align: center;
	cursor: pointer;
	transition: all 0.5s ease;
}

.sidebar.open .logo-details #btn {
	text-align: right;
}

.sidebar i {
	color: #fff;
	height: 60px;
	min-width: 50px;
	font-size: 28px;
	text-align: center;
	line-height: 60px;
}

.sidebar .nav-list {
	margin-top: 20px;
	height: 100%;
}

.sidebar li {
	position: relative;
	margin: 8px 0;
	list-style: none;
}

.sidebar li .tooltip {
	position: absolute;
	top: -20px;
	left: calc(100% + 15px);
	z-index: 3;
	background: #fff;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3);
	padding: 6px 12px;
	border-radius: 4px;
	font-size: 15px;
	font-weight: 400;
	opacity: 0;
	white-space: nowrap;
	pointer-events: none;
	transition: 0s;
}

.sidebar li:hover .tooltip {
	opacity: 1;
	pointer-events: auto;
	transition: all 0.4s ease;
	top: 50%;
	transform: translateY(-50%);
}

.sidebar.open li .tooltip {
	display: none;
}

.sidebar li a {
	display: flex;
	height: 100%;
	width: 100%;
	border-radius: 12px;
	align-items: center;
	text-decoration: none;
	transition: all 0.4s ease;
	background: #11101D;
}

.sidebar li a:hover {
	background: #FFF;
}

.sidebar li a .links_name {
	color: #fff;
	font-size: 15px;
	font-weight: 400;
	white-space: nowrap;
	opacity: 0;
	pointer-events: none;
	transition: 0.4s;
}

.sidebar.open li a .links_name {
	opacity: 1;
	pointer-events: auto;
}

.sidebar li a:hover .links_name, .sidebar li a:hover i {
	transition: all 0.5s ease;
	color: #11101D;
}

.sidebar li i {
	height: 50px;
	line-height: 50px;
	font-size: 18px;
	border-radius: 12px;
}

.main-section {
	position: relative;
	min-height: 100vh;
	top: 0;
	left: 78px;
	width: calc(100% - 78px);
	transition: all 0.5s ease;
	z-index: 2;
	/* background: #f3f3f3; */
	background: #ccc;
}

.sidebar.open ~ .main-section {
	left: 250px;
	width: calc(100% - 250px);
}

@media ( max-width : 420px) {
	.sidebar li .tooltip {
		display: none;
	}
}

.search {
	position: relative;
	width: 300px;
	margin-left: 100px;
}

input {
	font-size: 15px;
	color: #222222;
	width: 300px;
	border: none;
	border-bottom: solid; # aaaaaa 1px;
	padding-bottom: 10px;
	margin-top: 20px;
	position: relative;
	background: none;
	z-index: 5;
	position: relative;
}

input::placeholder {
	color: #aaaaaa;
}

input:focus {
	outline: none;
}

.search-span {
	display: block;
	position: absolute;
	bottom: 0;
	left: 0%;
	background-color: #666;
	width: 0;
	height: 2px;
	border-radius: 2px;
	transition: 0.5s;
}

.search label {
	position: absolute;
	color: #aaa;
	left: 10px;
	font-size: 20px;
	bottom: 8px;
	transition: all .2s;
}

input:focus ~ .searchlabel, input:valid ~ searchlabel {
	font-size: 16px;
	bottom: 40px;
	color: #666;
	font-weight: bold;
}

input:focus ~ search-span, input:valid ~ search-span {
	width: 100%;
}

#button-add {
	position: absolute;
	top: 25px;
	left: 430px;
	font-size: 20px;
	width: 50px;
	height: 35px;
	border: none;
	background-color: #062647;
	color: #ffffff;
	background-color: #062647;
	cursor: pointer;
}

.selectbox {
	position: absolute;
	border-radius: 8px;
	width: 80px;
	height: 30px;
	font-size: 18px;
	top: 30px;
}

.category-list button {
	border: none;
	background: none;
	font-size: 20px;
	margin-left: 20px;
	margin-top: 60px;
	cursor: pointer;
}

.category-list button:hover {
	border-bottom: 3px solid black;
}

table.table {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	width: 1000px;
	margin-top: 50px;
}

table.table thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 3px solid #036;
}

table.table td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	font-size: 17px;
}

.delete-category {
	border: none;
	background: none;
	cursor: pointer;
	font-size: 17px;
}

.delete-category:hover {
	font-weight: bold;
}

.container {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	margin-bottom: 10px;
	margin-top: 30px;
	display: inline-block;
}

.main-container {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	margin-top: 10px;
	margin-top: 10px;
	width: 90%;
	height: 90%;
	background: #ffffff;
	margin-top: 25px;
	box-shadow: 30px 30px 70px rgba(0, 0, 0, 0.2);
}

.nav {
	background-color: #ffffff;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 15px;
	justify-content: flex-end;
}

.menu {
	list-style: none;
	display: flex;
	flex-direction: row;
}

.menu li {
	padding: 0 15px;
	font-size: 15px;
}

.menu li a {
	text-decoration: none;
	color: black;
}
</style>
<body>
	<div class="sidebar">
		<div class="logo-details">
			<i class='bx bx-leaf icon'></i>
			<div class="logo_name">반디</div>
			<i class='bx bx-menu' id="btn"></i>
		</div>
		<ul class="nav-list">
			<li><a href="/report/reportList"> <i class='bx bxs-bell-minus'></i> <span class="links_name">신고 게시물 처리</span>
			</a> <span class="tooltip">신고 게시물 처리</span></li>
			<li><a href="/admin/adminCategory"> <i class='bx bx-bookmark-alt-plus'></i> <span class="links_name">카테고리 관리</span>
			</a> <span class="tooltip">카테고리 관리</span></li>
			<li><a href="/admin/novelChange"> <i class='bx bx-book-reader'></i> <span class="links_name">소설 타입 변경</span>
			</a> <span class="tooltip">소설 타입 변경</span></li>
			<li><a href="/admin/genre"> <i class='bx bx-book-add'></i> <span class="links_name">장르 관리</span>
			</a> <span class="tooltip">장르 관리</span></li>
			<li><a href="/admin/user"> <i class='bx bx-user'></i> <span class="links_name">유저롤 변경</span>
			</a> <span class="tooltip">사용자 변경</span></li>
			<li><a href="#"> <i class='bx bx-conversation'></i> <span class="links_name">자주 묻는 질문</span>
			</a> <span class="tooltip">자주 묻는 질문</span></li>
			<li><a href="#"> <i class='bx bx-message-square-dots'></i> <span class="links_name">질의 응답</span>
			</a> <span class="tooltip">질의 응답</span></li>
		</ul>
	</div>
	<section class="main-section">
		<section class="nav">
			<ul class="menu">
				<li><a href="#">Main</a></li>
				<li><a href="#">Logout</a></li>
			</ul>
		</section>
		<div class="main-container">
			<div class="container">
				<form action="/admin/category" method="post">
					<div class="board">
						<select class="selectbox" name="boardTypeId" id="boardTypeId">
							<c:forEach var="boardType" items="${boardTypeList}">
								<option value="${boardType.id}" class="boardType-option">${boardType.boardName}</option>
							</c:forEach>
						</select>
						<div class="search">
							<input type="text" name="categoryName"> <label class="searchlabel">Name</label> <span class="search-span"></span>
						</div>
						<button type="submit" id="button-add">등록</button>
					</div>
				</form>
				<div class="category-list-table">
					<table>
						<tr>
							<c:forEach items="${boardTypeList}" var="type">
								<td class="category-list">
									<button type="submit" onclick="location.href='/admin/adminCategory/${type.id}'">${type.boardName}</button>
								</td>
							</c:forEach>
						</tr>
					</table>
				</div>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">카테고리</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<c:forEach var="list" items="${categoryList}">
						<tbody id="categoryList" class="category">
							<tr>
								<td>${list.categoryName}</td>
								<td><button class="delete-category" onclick="deleteCategory(${list.id})">삭제</button></td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
		</div>
	</section>
	<script>
		  let sidebar = document.querySelector(".sidebar");
		  let closeBtn = document.querySelector("#btn");
		  let searchBtn = document.querySelector(".bx-search");
		  closeBtn.addEventListener("click", ()=>{
		    sidebar.classList.toggle("open");
		    menuBtnChange();
		  });
		  searchBtn.addEventListener("click", ()=>{ 
		    sidebar.classList.toggle("open");
		    menuBtnChange(); 
		  });
		  function menuBtnChange() {
		   if(sidebar.classList.contains("open")){
		     closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");
		   }else {
		     closeBtn.classList.replace("bx-menu-alt-right","bx-menu");
		   }
		  }
  </script>
	<script>
		function deleteCategory(id) {
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