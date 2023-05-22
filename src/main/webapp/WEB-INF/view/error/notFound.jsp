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

.material-symbols-outlined {
	color: red;
	font-size: 140px;
}

.title--container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin: 10px;
}

.content--container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	font-size: 12px;
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
}
</style>
</head>
<body>
	<div class="main--container">
		<img alt="반디" src="/assets/images/bandi-removebg.png" id="logo">
		<div class="title--container">
			<h2>페이지를 찾을 수 없습니다</h2>
			<h2>404 Page Not Found</h2>
		</div>
		<div class="content--container">
			<p>
				페이지가 존재하지 않거나, 사용할 수 없는 페이지입니다 <br> 입력하신 주소가 정확한지 다시 한번 확인해주시기 바랍니다
			</p>
		</div>
		<div>
			<a onclick="history.back();">이전 화면</a> <a onclick="location.href='localhost/main';">메인으로</a>
		</div>
	</div>
</body>
</html>