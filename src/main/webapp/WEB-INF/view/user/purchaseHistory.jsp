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

.info--table td {
	padding-left: 20px;
}

.novel--table th {
	padding: 10px;
	text-align: center;
}

.novel--table td {
	padding: 5px 0;
	text-align: center;
}

h1, h3 {
	font-weight: bold;
}

.no--data {
	padding: 10px;
}
</style>
<section>

	<h1 class="mb-4">구매내역</h1>

	<div class="d-flex justify-content-between table--container">
		<div class="row">
			<h3 class="mb-5">회차 구매 기록</h3>
			<c:choose>
				<c:when test="${empty purchaseList }">
					<table class="novel--table">
						<thead>
							<tr>
								<th>날짜</th>
								<th>제목</th>
								<th>회차</th>
								<th>금액</th>
							</tr>
						</thead>
					</table>
					<div>구매기록이 없습니다.</div>
				</c:when>
				<c:otherwise>
					<table class="novel--table">
						<thead>
							<tr>
								<th>날짜</th>
								<th>제목</th>
								<th>회차</th>
								<th>금액</th>
							</tr>
						</thead>
						<c:forEach items="${purchaseList }" var="purchase">
							<tr>
								<td>${purchase.createdAt()}</td>
								<td><a href="">${purchase.novelTitle}</a></td>
								<td><a href="">${purchase.sectionTitle}</a></td>
								<td><a href="">${purchase.price}</a></td>
							</tr>
						</c:forEach>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="row">
			<h3 class="mb-5">회차 대여 기록</h3>
			<c:choose>
				<c:when test="${empty rentalList }">
					<table class="novel--table">
						<thead>
							<tr>
								<th>날짜</th>
								<th>제목</th>
								<th>회차</th>
								<th>금액</th>
							</tr>
						</thead>
					</table>
					<div>회원님의 대여 기록이 없습니다.</div>
				</c:when>
				<c:otherwise>
					<table class="novel--table">
						<thead>
							<tr>
								<th>날짜</th>
								<th>제목</th>
								<th>회차</th>
								<th>금액</th>
							</tr>
						</thead>
						<c:forEach items="${rentalList}" var="rental">
							<tr>
								<td>${rental.beginRental()}</td>
								<td><a href="">${rental.novelTitle}</a></td>
								<td><a href="">${rental.sectionTitle}</a></td>
								<td><a href="">${rental.price}</a></td>
							</tr>
						</c:forEach>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</section>

<script type="text/javascript">
		$(document).ready(() => {
			
		});
	</script>

<%@include file="../layout/footer.jsp"%>