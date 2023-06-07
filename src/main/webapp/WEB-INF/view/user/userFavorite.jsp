<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>

<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/mypage/sidebar.css" />
<link rel="stylesheet" href="/assets/css/mypage/record.css" />

			<%@include file="/WEB-INF/view/user/userLeftbar.jsp"%>
				<section class="main">
					<div class="report-list">
						<div class="main-header">
							<h3 class="mb-2">내 즐겨찾기</h3>
						</div>
						<c:choose>
							<c:when test="${empty favoriteList }">
								<table class="table">
									<thead>
										<tr>
											<th scope="cols">장르</th>
											<th scope="cols">제목</th>
											<th scope="cols">작가</th>
										</tr>
									</thead>
									<tbody class="reportList">
										<tr>
											<td>즐겨찾기에 등록된 작품이 없습니다.</td>
											<td></td>
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
											<th scope="cols">작가</th>
										</tr>
									</thead>
									<c:forEach items="${favoriteList }" var="novel">
										<tbody class="reportList">
											<tr>
												<td>${novel.genreName }</td>
												<td><a href="/novel/detail/${novel.id }">${novel.title }</a></td>
												<td>${novel.authorName }</td>
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
