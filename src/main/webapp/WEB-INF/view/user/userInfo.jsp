<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://unpkg.com/mvp.css@1.12/mvp.css"> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style type="text/css">
	.row{
		display: flex;
	}
	
	.row > *{
		margin: 0px 20px;
	}
	
	
</style>
</head>
<body>
	<h1>내 정보</h1>
	<a href="/update">정보 수정</a>

	<table class="table">
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
	<div class="row">
		<div style="width: 45%;">
			<h3>
				내 즐겨찾기 <span style="font-size: 16px"><a href="#">더보기</a></span>
			</h3>
			<table>
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
		</div>
		<div style="width: 45%;">
			<h3>
				내 작품 <span style="font-size: 16px"><a href="#">더보기</a></span>
			</h3>
			<c:choose>
				<c:when test="${empty myNovelList }">
					<div>회원님이 등록한 작품이 없습니다.</div>
				</c:when>
				<c:otherwise>
					<table>
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
		<div style="width: 30%;">
			<h3>
				골드 충전 기록 <span style="font-size: 16px"><a href="/payment/charge">충전하기</a></span>
			</h3>
			<c:choose>
				<c:when test="${empty goldChargeList }">
					<div>회원님이 등록한 작품이 없습니다.</div>
				</c:when>
				<c:otherwise>
					<table>
						<thead>
							<tr>
								<th>날짜</th>
								<th>금액</th>
								<th>환불</th>
							</tr>
						</thead>
						<c:forEach items="${goldChargeList }" var="goldCharge">
							<form action="/payment/gold/refund" method="post">
								<input type="hidden" name="tid" value="${goldCharge.tid}">
								<input type="hidden" name="RefundPrice" value="${goldCharge.price}">
								<input type="hidden" name="id" value="${goldCharge.id}">
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
		
		<div style="width: 30%;">
			<h3>
				소설 구매 기록 <span style="font-size: 16px"><a href="#">더보기</a></span>
			</h3>
			<c:choose>
				<c:when test="${empty purchaseList }">
					<div>회원님이 등록한 작품이 없습니다.</div>
				</c:when>
				<c:otherwise>
					<table>
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
		<div style="width: 30%;">
			<h3>
				소설 대여 기록 <span style="font-size: 16px"><a href="#">더보기</a></span>
			</h3>
			<c:choose>
				<c:when test="${empty rentalList }">
					<div>회원님의 대여 기록이 없습니다.</div>
				</c:when>
				<c:otherwise>
					<table>
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
	
	<script type="text/javascript">
		$(document).ready(() => {
			
		});
	</script>

</body>
</html>