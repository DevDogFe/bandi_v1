<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../layout/header.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<style type="text/css">
.list--link {
	text-decoration: none;
	color: #black;
}

.list--link:visited {
	color: #333;
}

.detail--table th {
	padding: 8px 10px;
}

.left--col {
	display: flex;
	justify-content: space-between;
}

section img {
	width: 150px;
	height: 200px;
}

.btn--container button {
	margin: 6px 0px 6px 8px;
}

.detail--information {
	color: gray;
}

.detail--information div {
	margin-right: 10px;
}

.novel--header {
	width: 100%;
}

.detail--overview {
	font-size: 17px;
	font-weight: bold;
}

.novel--title {
	font-weight: bold;
}

.favorite--btn {
	background: none;
	border: none;
}

.favorite--star {
	color: #FDD835;
	font-size: 40px;
}

.favorite--container{
	text-align: right;
	flex: 1;
}
</style>
<input type="hidden" id="novelId" value="${detail.id}">
<section>
	<article>
		<div class="novel--header d-flex justify-content-start align-items-start">
			<div class="d-flex flex-fill">
				<div class="me-3">
					<c:choose>
						<c:when test="${detail.cover != null }">
							<img alt="이미지 기간만료" src="/bandi/uploads/${detail.cover }">
						</c:when>
						<c:otherwise>
							<img alt="이미지 없음" src="/assets/images/noimg.jpg">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="d-flex flex-column justify-content-between">
					<div>
						<div>
							<h2 class="d-flex novel--title">${detail.title}</h2>
						</div>
						<div class="d-flex detail--information detail">
							<div>장르</div>
							<div>${detail.genreName}</div>
							<div>작가</div>
							<div>${detail.nickName}</div>
							<div>작품 등록일</div>
							<div>${detail.createdAt()}</div>
							<div>즐겨찾기</div>
							<div>${favorite}</div>
						</div>
					</div>
					<div class="detail--overview">
						<div>작품소개</div>
						<div>${detail.overview}</div>
					</div>
				</div>
				<div class="favorite--container">
					<c:if test="${principal != null }">
						<c:choose>
							<c:when test="${isFavorite }">
								<button type="button" class="favorite--btn" id="unfavorite">
									<i class='bx bxs-star favorite--star'></i>
								</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="favorite--btn" id="favorite">
									<i class='bx bx-star favorite--star'></i>
								</button>
							</c:otherwise>
						</c:choose>
					</c:if>
				</div>
			</div>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">표지 등록</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<form action="/novel/cover?novelId=${detail.id }&serviceTypeId=${detail.serviceTypeId}" method="post" enctype="multipart/form-data">
						<div class="modal-body">
							<div class="mb-3">
								<label for="formFile" class="form-label">이미지 파일 선택</label> <input class="form-control" name="coverFile" type="file" id="formFile">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="d-flex justify-content-end btn--container">
			<c:if test="${detail.userId == principal.id}">
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">표지 등록하기</button>
				<button onclick="location.href='/section/registration/${detail.id}'" class="btn btn btn-secondary">글 쓰기</button>
			</c:if>

		</div>
		<c:choose>
			<c:when test="${empty sectionList}">
				<h3>아직 글이 없습니다.</h3>
			</c:when>
			<c:otherwise>
				<table class="table">
					<thead>
						<tr class="table-secondary">
							<td>번호</td>
							<td>제목</td>
							<td>상태</td>
							<td>등록일</td>
							<td>조회수</td>
							<td>평점</td>
						</tr>
					</thead>
					<tbody>
						<c:set var="count" value="${sectionList.size()}"></c:set>
						<c:forEach items="${sectionList}" var="section" varStatus="vs">
							<c:choose>
								<c:when test="${section.userId != null}">
									<tr class="table-info">
										<td>${sectionList.size() - vs.index}</td>
										<td><a href="/section/read/${detail.id}/${section.id}?serviceTypeId=${detail.serviceTypeId}" class="list--link">${section.title}</a></td>
										<c:choose>
											<c:when test="${paymentList[vs.index] != null }">
												<c:if test="${paymentList[vs.index].purchaseSectionId != null || paymentList[vs.index].rentalSectionId != null}">
													<c:choose>
														<c:when test="${paymentList[vs.index].purchaseSectionId != null}">
															<td>구매 중</td>
														</c:when>
														<c:otherwise>
															<td>대여 : ${paymentList[vs.index].endFormat()}까지</td>
														</c:otherwise>
													</c:choose>
												</c:if>
											</c:when>
											<c:otherwise>
												<td>${vs.index}</td>
											</c:otherwise>
										</c:choose>
										<td>${section.createdAt()}</td>
										<td>${section.views}</td>
										<td><c:choose>
												<c:when test="${empty section.score }">
													-
												</c:when>
												<c:otherwise>
													${section.score()}
												</c:otherwise>
											</c:choose></td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr class="table-default">
										<td>${sectionList.size() - vs.index}</td>
										<td><a href="/section/read/${detail.id}/${section.id}?serviceTypeId=${detail.serviceTypeId}" class="list--link">${section.title}</a></td>
										<c:choose>
											<c:when test="${paymentList[vs.index] != null }">
												<c:if test="${paymentList[vs.index].purchaseSectionId != null || paymentList[vs.index].rentalSectionId != null}">
													<c:choose>
														<c:when test="${paymentList[vs.index].purchaseSectionId != null}">
															<td>구매 중</td>
														</c:when>
														<c:otherwise>
															<td>대여 : ${paymentList[vs.index].endFormat()}까지</td>
														</c:otherwise>
													</c:choose>
												</c:if>
												<c:if test="${paymentList[vs.index].purchaseSectionId == null && paymentList[vs.index].rentalSectionId == null}">
													<td></td>
												</c:if>
											</c:when>
											<c:otherwise>
												<td>${vs.index}</td>
											</c:otherwise>
										</c:choose>
										<td>${section.createdAt()}</td>
										<td>${section.views}</td>
										<td><c:choose>
												<c:when test="${empty section.score }">
													-
												</c:when>
												<c:otherwise>
													${section.score}
												</c:otherwise>
											</c:choose></td>
									</tr>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</tbody>
				</table>
			</c:otherwise>
		</c:choose>
	</article>
</section>
<script type="text/javascript">
	$(document).ready(() => {
			$("#unfavorite").on("click", () =>{
				$.ajax({
					type: "DELETE",
					url: "/api/unfavorite/" + $("#novelId").val()
				}).done((response) => {
					console.log(response);
					console.log(typeof response);
					location.href='/novel/detail/' + $("#novelId").val();
				}).fail((error) => {
					console.log(error);
					alert("요청을 처리할 수 없습니다.");
				});
			});
			
			$("#favorite").on("click", () =>{
				$.ajax({
					type: "POST",
					url: "/api/favorite/" + $("#novelId").val()
				}).done((response) => {
					console.log(response);
					console.log(typeof response);
					location.href='/novel/detail/' + $("#novelId").val();
				}).fail((error) => {
					console.log(error);
					alert("요청을 처리할 수 없습니다.");
				});
			});
		});
	</script>
<%@include file="../layout/footer.jsp"%>
