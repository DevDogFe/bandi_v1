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

.no--data {
	padding: 10px;
}
</style>
<section>

	<h1 class="mt-5 m-3">
		내 정보 &nbsp;&nbsp;<span class="more"><a href="/update">내 정보 수정</a></span>
	</h1>


	<table class="table info--table mb-5">
		<colgroup>
			<col style="width: 15%">
			<col style="width: 80%">
		</colgroup>
		<tr>
			<th>아이디</th>
			<td>${principal.username}</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>${principal.nickName}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${principal.email}</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${principal.gender}</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>${principal.birthDate}(${principal.getAge()}세)</td>
		</tr>
		<tr>
			<th>골드</th>
			<td>${gold}</td>
		</tr>
	</table>
	<div class="d-flex justify-content-between table--container">
		<div class="row">
			<div>
				<h3 class="mb-2">
					내 즐겨찾기 &nbsp;&nbsp;<span class="more"><a href="/library">더보기</a></span>
				</h3>
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
			<h3 class="mb-2">
				내 작품 &nbsp;&nbsp;<span class="more"><a href="/library">더보기</a></span>
			</h3>
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

	<div class="d-flex justify-content-between table--container">
		<div class="row">
			<h3 class="mb-2">회차 구매 기록</h3>
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
					<div class="no--data">구매기록이 없습니다.</div>
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
						<c:forEach items="${purchaseList }" var="purchase" begin="0" end="2">
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
			<h3 class="mb-2">회차 대여 기록</h3>
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
					<div class="no--data">회원님의 대여 기록이 없습니다.</div>
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
						<c:forEach items="${rentalList}" var="rental" begin="0" end="2">
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

	<div class="row">
		<h3 class="mb-2">
			골드 충전 기록 <span class="more"><a href="/payment/charge">충전하기</a></span>
		</h3>
		<c:choose>
			<c:when test="${empty goldChargeList }">
				<table class="novel--table">
					<thead>
						<tr>
							<th>날짜</th>
							<th>금액</th>
							<th>환불</th>
						</tr>
					</thead>
				</table>
				<div class="no--data">충전 기록이 없습니다.</div>
			</c:when>
			<c:otherwise>
				<table class="novel--table">
					<thead>
						<tr>
							<th>날짜</th>
							<th>금액</th>
							<th>환불</th>
						</tr>
					</thead>
					<c:forEach items="${goldChargeList }" var="goldCharge">
						<form action="/payment/gold/refund" method="post">
							<input type="hidden" name="tid" value="${goldCharge.tid}"> <input type="hidden" name="RefundPrice" value="${goldCharge.price}"> <input type="hidden" name="id"
								value="${goldCharge.id}">
							<tr>
								<td>${goldCharge.createdAt()}</td>
								<td><a href="">${goldCharge.price}</a></td>
								<c:choose>
									<c:when test="${(gold - goldCharge.price) >= 0}">
										<td><button type="submit" class="btn btn-primary">환불 신청</button></td>
									</c:when>
									<c:otherwise>
										<td><button type="submit" class="btn btn-primary" disabled>환불 신청</button></td>
									</c:otherwise>
								</c:choose>
							</tr>
						</form>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
	<br>
</section>

<script type="text/javascript">
		$(document).ready(() => {
			
		});
	</script>

<%@include file="../layout/footer.jsp"%>