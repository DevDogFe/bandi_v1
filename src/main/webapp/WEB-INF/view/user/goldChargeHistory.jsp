<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>

<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/mypage/sidebar.css" />
<link rel="stylesheet" href="/assets/css/mypage/record.css" />

<div class="sectind-flex">
	<section class="left-sidebar">
		<div class="sidebar">
			<div class="logo_content">
				<div class="logo">
					<i class='bx bx-leaf'></i>
					<div class="logo_name">반디</div>
				</div>
			</div>
			<ul class="nav_list">
				<li><a href="/myInfo"> <i class='bx bx-user'></i> <span class="links_name">개인정보</span>
				</a></li>
				<li><a href="/myNovel"> <i class='bx bx-book-open'></i> <span class="links_name">내 작품</span>
				</a></li>
				<li><a href="/myFavorite"> <i class='bx bx-bookmark'></i> <span class="links_name">즐겨찾기 목록</span>
				</a></li>
				<li><a href="/purchase"> <i class='bx bx-book-add'></i> <span class="links_name">작품 구매 기록</span>
				</a></li>
				<li><a href="/rental"> <i class='bx bx-book-bookmark'></i> <span class="links_name">작품 대여 기록</span>
				</a></li>
				<li><a href="/goldCharge"> <i class='bx bx-coin-stack'></i> <span class="links_name">골드 충전 기록</span>
				</a></li>
				<li><a href="#"> <i class='bx bx-conversation'></i> <span class="links_name">1:1 문의</span>
				</a></li>
			</ul>
		</div>
	</section>
	<section class="main">
		<div class="reportList">
			<div class="main-header">
				<h3 class="mb-2">
					골드 충전 기록 <span class="more"><a href="/payment/charge">충전하기</a></span>
				</h3>
			</div>
			<c:choose>
				<c:when test="${empty goldChargeList }">
					<table class="table">
						<thead>
							<tr>
								<th scope="cols">날짜</th>
								<th scope="cols">금액</th>
								<th scope="cols">환불</th>
							</tr>
						</thead>
						<tbody class="reportList">
							<tr>
								<td>충전 기록이 없습니다.</td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<table class="table">
						<thead>
							<tr>
								<th scope="cols">날짜</th>
								<th scope="cols">금액</th>
								<th scope="cols">환불</th>
							</tr>
						</thead>
						<c:forEach items="${goldChargeList }" var="goldCharge">
							<form action="/payment/gold/refund" method="post">
								<input type="hidden" name="tid" value="${goldCharge.tid}"> <input type="hidden" name="RefundPrice" value="${goldCharge.price}"> <input type="hidden" name="id"
									value="${goldCharge.id}">
								<tbody class="reportList">
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
								</tbody>
							</form>
						</c:forEach>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
	</section>
</div>
<%@include file="/WEB-INF/view/layout/header.jsp"%>