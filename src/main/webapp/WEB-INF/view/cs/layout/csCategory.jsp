<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/assets/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="/assets/css/summernote/summernote-lite.css">


<style>
* {
	box-sizing: border-box;
}

body {
	/* height: 100%; */
	
}

.cs--category {
	display: flex;
	align-items: center;
}

.cs--category ul {
	margin: 0 10px;
}

.cs--category ul li {
	display: inline-block;
	padding: 0 20px;
	border-left: 1px solid #d1d4d6;
}

.cs--category ul li a {
	font-size: 20px;
}

.cs--container--title {
	display: flex;
}

.cs--container {
	margin: 50px 50px;
}

.cs--title {
	
}

.cs--title h3 {
	font-size: 40px;
	padding: 10px;
}

a {
	color: #212121;
}
</style>

<section>
	<div class="cs--container">
		<div class="cs--container--title">
			<div class="cs--title">
				<h3>고객 센터</h3>
			</div>
			<div class="cs--category">
				<ul>
					<li><a href="/qna/list">Q&A</a></li>
					<li><a href="/faq/list">FAQ</a></li>
					<li><a href="/application/write">제휴문의</a></li>
				</ul>
			</div>
		</div>