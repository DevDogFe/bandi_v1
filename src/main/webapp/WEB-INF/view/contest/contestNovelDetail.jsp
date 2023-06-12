<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/registration.css" />
<link rel="stylesheet" href="/assets/css/novelDetail.css" />
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<style type="text/css">
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

.favorite--btn {
	background: none;
	border: none;
}
</style>
			<div class="main-layout">
				<input type="hidden" id="novelId" value="${detail.id}">
				<section class="detail-content">
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
										<label>작품소개</label>
										<div>${detail.overview}</div>
									</div>
								</div>
								<div class="favorite--container">
									<button class="first--btn" onclick="location.href='/contest/novel/detail/${detail.id}'">1회 보기</button>
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
														<tr class="table-dodgerblue">
															<td>
																<div class="list--title">
																	<a href="/contest/novel/read/${detail.id}/${section.id}" class="list--link title--col">${section.title}</a>
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
																	<c:choose>
																		<c:when test="${paymentList[vs.index].purchaseSectionId != null || paymentList[vs.index].rentalSectionId != null}">
																			<c:choose>
																				<c:when test="${paymentList[vs.index].purchaseSectionId != null}">
																					<td class="status--td">
																						<div class="list--status status--buy"></div>
																					</td>
																				</c:when>
																				<c:otherwise>
																					<td class="status--td">
																						<div class="list--status status--rent"></div>
																						<div class="list--detail"></div>
																					</td>
																				</c:otherwise>
																			</c:choose>
																		</c:when>
																		<c:otherwise>
																			<td class="status--td">
																				<div class="list--status status--buy"></div>
																			</td>
																		</c:otherwise>
																	</c:choose>
																</c:when>
																<c:otherwise>
																	<td class="status--td">
																		<div class="list--status status--buy"></div>
																	</td>
																</c:otherwise>
															</c:choose>
														</tr>
													</c:when>
													<c:otherwise>
														<tr class="table-default">
															<td>
																<div class="list--title">
																	<a href="/contest/novel/read/${detail.id}/${section.id}" class="list--link title--col">${section.title}</a>
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
																<div class="list--status status--buy"></div>
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
				<aside class="right-sidebar">
					<div class="right-sidebar-contents">
						<div class="my-info">
							<div class="username">${principal.nickName} 님</div>
							<div class="info-category">
								<span><img src="/assets/images/main/user-line.png">내정보</span> <span><img src="/assets/images/main/thumb-up-line.png">알림</span> <span><img
									src="/assets/images/main/star-line.png">구매목록</span>
							</div>
							<div class="gold-info">
								<div>보유골드</div>
								<span class="blue-span">${gold}</span>
							</div>
							<div class="right-box">
								<div class="right-box-cover">
									<c:choose>
										<c:when test="${lastNovel.cover != null }">
											<a><img alt="이미지 기간만료" src="/bandi/uploads/${lastNovel.cover}"></a>
										</c:when>
										<c:otherwise>
											<img alt="이미지 없음" src="/assets/images/noimg.jpg">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="right-box-detail">
									<div class="right-detail-desc">
										<div class="right-detail-desc">
										<c:choose>
											<c:when test="${lastNovel == null}">
												<div class="desc-title">소설 조회 <br> 기록이 없습니다.</div>
											</c:when>
											<c:otherwise>
												<div class="desc-title">${lastNovel.title}</div>
												<c:choose>
													<c:when test="${lastNovel.serviceTypeId != 3}">
														<a href="/section/read/${lastNovel.novelId}/${lastNovel.sectionId}/${lastNovel.serviceTypeId}"><div class="desc-title">바로가기</div></a>
													</c:when>
													<c:otherwise>
														<a href="/contest/novel/read/${lastNovel.novelId}/${lastNovel.sectionId}"><div class="desc-title">바로가기</div></a>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="right-banner">
							<a href="/payment/charge"><img src="/assets/images/main/gold-charge.png"></a>
						</div>
						<div class="right-banner">
							<a href="/main"><img src="/assets/images/main/author-banner.png"></a>
						</div>
						<div class="recommend-list">
						<c:if test="${!empty genreList }">
							<h3 class="recommend-header">
								<a>${genreList.get(0).genreName } 추천작</a>
							</h3>
							<ul>
								<c:forEach items="${genreList }" var="novel">
									<li><a href="/novel/detail/${novel.id}" class="recommend-item">
									<div class="recommend-img">
										<c:choose>
											<c:when test="${novel.cover != null }">
												<img alt="이미지 기간만료" src="/bandi/uploads/${novel.cover }" style="width: 100%; height: 100%;">
											</c:when>
											<c:otherwise>
												<a href="/novel/detail/${novel.id }"> <img alt="이미지 없음" src="/assets/images/noimg.jpg" style="width: 100%; height: 100%;"></a>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="recommend-desc">
										<span>${novel.genreName} </span> <span class="bold-font">${novel.title}</span> <span>${novel.nickName}</span>
							
									</div></a></li>
								</c:forEach>
							</ul>
							</c:if>
						</div>
					</div>
				</aside>
			</div>
	<script type="text/javascript" src="/assets/js/novel/contestNovelDetail.js"></script>
	<%@include file="/WEB-INF/view/layout/footer.jsp"%>
	