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

.novel--header img {
	width: 180px;
	height: 240px;
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

.favorite--container {
	flex: 1;
	display: flex;
	justify-content: flex-end;
	align-items: flex-start;
}

.first--btn {
	font-size: 18px;
	padding: 8px 15px;
	background-color: #92D400;
	color: white;
	border: none;
	border-radius: 5px;
	margin-right: 15px;
}

.list--title {
	font-size: 25px;
	font-weight: bold;
	margin-bottom: 10px;
	margin-top: 5px;
	padding-left: 15px;
}

.list--detail {
	color: #aaa;
	margin-top: 5px;
	padding-left: 15px;
}

.list--status {
	font-size: 18px;
	font-weight: bold;
}

.status--td div {
	text-align: center;
}

.status--td {
	height: 100%;
}

.status--buy {
	margin-top: 20px;
}

.status--rent {
	margin-top: 8px;
}

.bottom--container {
	display: flex;
	border-top: 1px solid #ccc;
	margin-top: 30px;
}

.bottom--article {
	flex: 10;
	border-right: 1px solid #aaa;
	padding: 30px;
}

.bottom--aside {
	flex: 3;
	padding: 30px;
}

.list--head {
	border-bottom: 3px solid black;
}

.rec--box {
	display: flex;
	margin-bottom: 15px;
	max-width: 290px;
	overflow: hidden;
}

.rec--box img {
	width: 120px;
	height: 150px;
	margin-right: 30px;
}

.rec--title {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 10px;
    display: block;
	overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}

.rec--detail {
	color: #aaa;
}

.rec--info {
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.aside--head{
	text-align: center;
	margin-bottom: 20px;
}
</style>
<input type="hidden" id="novelId" value="${detail.id}">
<section>
	<article>
		<div class="novel--header d-flex justify-content-start align-items-start">
			<div class="d-flex flex-fill">
				<div class="me-4">
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
					<button class="first--btn" onclick="location.href='/section/read/${detail.id}/${detail.firstSectionId}?serviceTypeId=${detail.serviceTypeId}'">1회 보기</button>
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
		<div class="bottom--container">
			<div class="bottom--article">
				<c:choose>
					<c:when test="${empty sectionList}">
						<h3>아직 글이 없습니다.</h3>
					</c:when>
					<c:otherwise>
						<table class="table section--list">
							<colgroup>
								<col style="width: 70%;">
								<col style="width: 30%;">
							</colgroup>
							<tr class="list--head">
								<td colspan="2"><div class="list--title" style="text-align: center">회차목록</div></td>
							</tr>
							<c:forEach items="${sectionList}" var="section" varStatus="vs">
								<c:choose>
									<c:when test="${section.userId != null}">
										<tr class="table-info">
											<td>
												<div class="list--title">
													<a href="/section/read/${detail.id}/${section.id}?serviceTypeId=${detail.serviceTypeId}" class="list--link title--col">${section.title}</a>
												</div>
												<div class="list--detail">
													${section.createdAt()}&nbsp;&nbsp;<i class='bx bx-show'></i>&nbsp;${section.views}&nbsp;&nbsp;<i class='bx bxs-star'></i>
													<c:choose>
														<c:when test="${empty section.score }">
													-
												</c:when>
														<c:otherwise>
													${section.score()}
												</c:otherwise>
													</c:choose>
												</div>
											</td>
											<c:choose>
												<c:when test="${paymentList[vs.index] != null }">
													<c:if test="${paymentList[vs.index].purchaseSectionId != null || paymentList[vs.index].rentalSectionId != null}">
														<c:choose>
															<c:when test="${paymentList[vs.index].purchaseSectionId != null}">
																<td class="status--td">
																	<div class="list--status status--buy">구매 완료</div>
																</td>
															</c:when>
															<c:otherwise>
																<td class="status--td">
																	<div class="list--status status--rent">대여 중</div>
																	<div class="list--detail">(만료: ${paymentList[vs.index].endFormat()})</div>
																</td>
															</c:otherwise>
														</c:choose>
													</c:if>
												</c:when>
												<c:otherwise>
													<td class="status--td">
														<div class="list--status status--buy">🟡${section.listPrice}G</div>
													</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:when>
									<c:otherwise>
										<tr class="table-default">
											<td>
												<div class="list--title">
													<a href="/section/read/${detail.id}/${section.id}?serviceTypeId=${detail.serviceTypeId}" class="list--link title--col">${section.title}</a>
												</div>
												<div class="list--detail">
													${section.createdAt()}&nbsp;&nbsp;<i class='bx bx-show'></i>&nbsp;${section.views}&nbsp;&nbsp;<i class='bx bxs-star'></i>
													<c:choose>
														<c:when test="${empty section.score }">
													-
												</c:when>
														<c:otherwise>
													${section.score()}
												</c:otherwise>
													</c:choose>
												</div>
											</td>
											<td class="status--td">
												<div class="list--status status--buy">${section.listPrice}G</div>
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</table>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="bottom--aside">
				<div>
					<h3 class="mb-3 aside--head">
						<b>맞춤 추천</b>
					</h3>
					<c:forEach items="${recommendList }" var="novel">
						<div class="rec--box">
							<div>
								<a href="/novel/detail/${novel.id }"> <c:choose>
										<c:when test="${novel.cover != null }">
											<img alt="이미지 기간만료" src="/bandi/uploads/${novel.cover }">
										</c:when>
										<c:otherwise>
											<img alt="이미지 없음" src="/assets/images/noimg.jpg">
										</c:otherwise>
									</c:choose>
								</a>
							</div>
							<div class="rec--info">
								<div class="rec--title">
									<a href="/novel/detail/${novel.id }">${novel.title }</a>
								</div>
								<div class="rec--detail">${novel.genreName }&nbsp;&nbsp;${novel.author}</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
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
