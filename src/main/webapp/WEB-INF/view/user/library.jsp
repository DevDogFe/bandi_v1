<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../layout/header.jsp"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style type="text/css">
.row {
	display: flex;
	width: 45%;
}

.row>* {
	margin: 0px 20px;
}

section {
	width: 1300px;
	margin: auto;
}

.novel--table {
	width: 100%;
}

.novel--table thead {
	background-color: #779C74;
}

.table--container {
	margin-top: 20px;
	margin-bottom: 50px;
}

.info--table {
	width: 40%;
}

.info--table th {
	text-align: right;
}

.info--table td {
	padding-left: 40px;
}

.novel--table th {
	padding: 10px;
	text-align: center;
}

.novel--table td {
	padding: 5px 0;
	text-align: center;
}

.more {
	font-size: 18px;
	font-weight: bold;
}

h1, h3 {
	font-weight: bold;
}

.nove--col1 {
	width: 15%;
}

.nove--col2 {
	width: 70%;
}

.nove--col3 {
	width: 15%;
}
.no--data{
	padding: 10px;
}
</style>
<section>


	<div class="d-flex justify-content-between table--container">
		<div class="row">
			<div>
				<h3 class="mb-2">내 즐겨찾기</h3>
				<c:choose>
					<c:when test="${empty favoriteList }">
						<table class="novel--table">
							<colgroup>
								<col class="nov--col1">
								<col class="nov--col2">
								<col class="nov--col3">
							</colgroup>
							<thead>
								<tr>
									<th>장르</th>
									<th>제목</th>
									<th>작가</th>
								</tr>
							</thead>
						</table>
						<div class="no--data">즐겨찾기에 등록된 작품이 없습니다.</div>
					</c:when>
					<c:otherwise>
						<table class="novel--table">
							<colgroup>
								<col class="nov--col1">
								<col class="nov--col2">
								<col class="nov--col3">
							</colgroup>
							<thead>
								<tr>
									<th>장르</th>
									<th>제목</th>
									<th>작가</th>
								</tr>
							</thead>
							<c:forEach items="${favoriteList }" var="novel">
								<tr>
									<td>${novel.genreName }</td>
									<td><a href="/novel/detail/${novel.id }">${novel.title }</a></td>
									<td>${novel.authorName }</td>
								</tr>
							</c:forEach>
						</table>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="row">
			<h3 class="mb-2">내 작품</h3>
			<c:choose>
				<c:when test="${empty myNovelList }">
					<table class="novel--table">
						<thead>
							<tr>
								<th>장르</th>
								<th>제목</th>
							</tr>
						</thead>
					</table>
					<div class="no--data">회원님이 등록한 작품이 없습니다.</div>
				</c:when>
				<c:otherwise>
					<table class="novel--table">
						<thead>
							<tr>
								<th>장르</th>
								<th>제목</th>
							</tr>
						</thead>
						<c:forEach items="${myNovelList }" var="novel">
							<tr>
								<td>${novel.genreName }</td>
								<td><a href="/novel/detail/${novel.id }">${novel.title }</a></td>
							</tr>
						</c:forEach>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
	</div>


	<br>
</section>

<script type="text/javascript">
		$(document).ready(() => {
			
		});
	</script>

<%@include file="../layout/footer.jsp"%>