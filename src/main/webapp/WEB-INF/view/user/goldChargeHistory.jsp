<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>

<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/mypage/sidebar.css" />
<link rel="stylesheet" href="/assets/css/mypage/record.css" />

<%@include file="/WEB-INF/view/user/userLeftbar.jsp"%>
	<section class="main">
		<div class="reportList">
			<div class="main-header">
				<h3 class="mb-2">
					골드 충전 기록 <span class="more"><a href="/payment/charge">충전하기</a></span>
				</h3>
			</div>
			<c:choose>
				<c:when test="${empty goldChargeList }">
					<div class="scroll">
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
					</div>
				</c:when>
				<c:otherwise>
					<div class="scroll">
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
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</section>
</div>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>