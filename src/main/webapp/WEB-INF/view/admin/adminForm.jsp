<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<ul><a href="/report/reportList">신고게시물 처리</a></ul>
		<ul><a href="/admin/adminCategory">카테고리 관리</a></ul>
		<ul>
			<a href="/admin/novelChange">소설 타입 변경</a>
		</ul>
		<ul><a href="/admin/genre">장르 관리</a></ul>
		<ul><a href="/admin/user">유저롤 변경</a></ul>
	</div>
	<div class="main">
		
	</div>
</body>
</html>