
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/mypage/sidebar.css" />
<link rel="stylesheet" href="/assets/css/mypage/record.css" />
<link rel="stylesheet" href="/assets/css/mypage/userInfo.css" />
</head>
<style>
.qna--answer {
	background-color: #f1f1f1;
}

.main-header{
	display: flex;
	justify-content: space-between;
	
}

.qna--button button{
	background-color: #3b6bc9;
	border-radius: 3px;
	color: #fff;
	border: none;
	width: 80px;
	height: 35px; 
}

</style>
			<%@include file="/WEB-INF/view/user/userLeftbar.jsp"%>
				<section class="main">
					<div class="report-list">
						<div class="main-header ">
							<h3 class="mb-2">1:1 문의 조회</h3>

							 <div class="qna--button"> 
								<button onclick="location.href='/qna/write'">문의하기</button>
							 </div> 
						</div>
						<c:choose>
							<c:when test=" ${empty questionList } ">
								<table class="table">
									<thead>
										<tr>
											<th scope="cols">카테고리</th>
											<th scope="cols">제목</th>
											<th scope="cols">작성일자</th>
											<th scope="cols">처리결과</th>
										</tr>
									</thead>
									<tbody class="reportList">
										<tr>
											<td>문의내역이 없습니다.</td>
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
												<th scope="cols">카테고리</th>
												<th scope="cols">제목</th>
												<th scope="cols">작성일자</th>
												<th scope="cols">처리결과</th>
											</tr>
										</thead>
										<c:forEach var="question" items="${questionList}">
											<tbody class="reportList">
												<tr>
													<td>${question.categoryName}</td>
													<td><a href="/qna/question/${question.id}">${question.title}</a></td>
													<td>${question.createdAt()}</td>
													<c:choose>
														<c:when test="${question.proceed == 0}">
															<td>처리중</td>
														</c:when>
														<c:otherwise>
															<td>처리완료</td>
														</c:otherwise>
													</c:choose>
												</tr>
												<c:if test="${question.answer != null}">
													<tr class="qna--answer">
														<td></td>
														<td><a href="/qna/answer/${question.id}">[RE]: ${question.title}</a></td>
														<td>${question.answerCreatedAt()}</td>
														<td></td>
													</tr>
												</c:if>
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>