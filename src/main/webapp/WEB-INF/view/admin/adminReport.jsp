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
}

.sidebar.open ~ .main-section {
	left: 250px;
	width: calc(100% - 250px);
}

.main-section .main-content {
	display: inline-block;
	font-size: 25px;
	font-weight: 500;
	margin: 18px
}

@media ( max-width : 420px) {
	.sidebar li .tooltip {
		display: none;
	}
}

table.table {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	width: 1000px;
}

table.table thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 3px solid #036;
}

table.table tbody th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}

table.table td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	font-size: 17px;
}

.btn-check {
	border: none;
	background: none;
	cursor: pointer;
	font-size: 17px;
}

.btn-check:hover {
	font-weight: bold;
}
.container {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	margin-top: 10px;
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
		<div class="container">
			<table class="table">
				<thead>
					<tr>
						<th scope="cols">#</th>
						<th scope="cols">신고자</th>
						<th scope="cols">신고사유</th>
						<th scope="cols">날짜</th>
						<th scope="cols">확인</th>
						<th scope="cols"></th>
					</tr>
				</thead>
				<c:forEach var="list" items="${reportList}">
					<input type="hidden" name="id" id="id-${list.id}" value="${list.id}">
					<tbody id="reportList-${list.id}" class="reportList">
						<tr>
							<th scope="row">${list.id}</th>
							<td>${list.username}</td>
							<td>${list.categoryName}</td>
							<td>${list.createdAt()}</td>
							<td>${list.proceed}</td>
							<td><button class="btn-check" onclick="detailPopup(${list.id})">확인</button></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
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
	<script type="text/javascript">
		function detailPopup(id) {
			  var url = "/report/reportDetail/" + $("#id-" + id).val();
			  var name = "신고접수확인";
			  var option = "width=600,height=730,top=100,left=200, location=no";
			  window.open(url, name, option);
			}
	</script>
</body>
</html>