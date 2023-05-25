<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error page</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	background-color: #f6f6f6;
	font-family: 'Noto Sans KR', sans-serif;
}

.main--container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 500px;
}

.title--container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin: 10px;
}

.main--container a {
	text-decoration: none;
	color: #ccc;
	border: 1px solid #031734;
	background-color: #031734;
	font-size: 13px;
	margin: 20px;
	padding: 5px;
	display: flex;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="main--container">
		<img alt="반디" src="/assets/images/bandi-removebg.png" id="logo">
		<div class="title--container">
			<h2>신고가 접수되었습니다</h2>
		</div>
		<div>
			<a onclick="window.close();">확인</a>
		</div>
	</div>
</body>
</html>