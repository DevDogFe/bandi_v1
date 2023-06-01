<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/assets/css/style.css" rel="stylesheet">


<style>
* {
	box-sizing: border-box;
}

body {
	height: 100%;
	min-height: 100%;
}

.cs--category {
	display: flex;
	align-items: center;
}

.cs--category ul {
	/* border: 1px solid black; */
	margin: 0 10px;
}

.cs--category ul li {
	display: inline-block;
	/* border: 1px solid black; */
	padding: 0 20px;
}

.cs--category ul li a {
	font-size: 20px;
}

.cs--container--title {
	border: 1px solid black;
	display: flex;
}

.cs--container {
	width: 100%;
	/* border: 1px solid black; */
	padding: 40px 50px 0;
	margin: 50px 50px;
}

.title--cs {
	border: 1px solid black;
}

.title--cs h3 {
	font-size: 40px;
	padding: 10px;
}

</style>


<!-- <section> -->
	<div class="cs--container">
		<div class="cs--container--title">
			<div class="title--cs">
				<h3>고객 센터</h3>
			</div>
			<div class="cs--category">
				<ul>
					<li>Q&A</li>
					<li>FAQ</li>
					<li>공지</li>
					<li>제휴문의</li>
				</ul>
			</div>
		</div> 