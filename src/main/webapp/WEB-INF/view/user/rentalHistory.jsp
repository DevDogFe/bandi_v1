<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>

<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/mypage/sidebar.css" />
<link rel="stylesheet" href="/assets/css/mypage/record.css" />

<%@include file="/WEB-INF/view/user/userLeftbar.jsp"%>
	<section class="main">
		<div class="reportList">
			<div class="main-header">
				<h3 class="mb-2">회차 대여 기록</h3>
			</div>
			<c:choose>
				<c:when test="${empty rentalList }">
					<div class="scroll">
						<table class="table">
							<thead>
								<tr>
									<th scope="cols">날짜</th>
									<th scope="cols">제목</th>
									<th scope="cols">회차</th>
									<th scope="cols">금액</th>
								</tr>
							</thead>
							<tbody class="reportList">
								<tr>
									<td>회원님의 대여 기록이 없습니다.</td>
									<td></td>
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
									<th scope="cols">제목</th>
									<th scope="cols">회차</th>
									<th scope="cols">금액</th>
								</tr>
							</thead>
							<c:forEach items="${rentalList }" var="rental" begin="0" end="2">
								<tbody class="reportList">
									<tr>
										<td><a href="">${rental.beginRental()}</a></td>
										<td><a href="">${rental.novelTitle}</a></td>
										<td><a href="">${rental.sectionTitle}</a></td>
										<td><a href="">${rental.price}</a></td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</section>
</div>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>
