<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>

<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/mypage/sidebar.css" />
<link rel="stylesheet" href="/assets/css/mypage/record.css" />

	<%@include file="/WEB-INF/view/user/userLeftbar.jsp"%>
	<section class="main">
		<div class="report-list">
			<div class="main-header d-flex align-items-end justify-content-between">
				<h3 class="mb-2">내 작품</h3> <a style="padding-bottom: 10px; padding-right: 20px;" href="/novel/registration">작품 등록</a>
			</div>
			<c:choose>
				<c:when test="${empty myNovelList }">
					<table class="table">
						<thead>
							<tr>
								<th scope="cols">장르</th>
								<th scope="cols">제목</th>
							</tr>
						</thead>
						<tbody class="reportList">
							<tr>
								<td>회원님이 등록한 작품이 없습니다.</td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<div class="scroll">
						<table class="table">
							<thead>
								<tr>
									<th scope="cols">장르</th>
									<th scope="cols">제목</th>
								</tr>
							</thead>
							<c:forEach items="${myNovelList }" var="novel">
								<tbody class="reportList">
									<tr>
										<td>${novel.genreName }</td>
										<td><a href="/novel/detail/${novel.id }">${novel.title }</a></td>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>
