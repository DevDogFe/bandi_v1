<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>반디</title>
<script src="/assets/js/jquery.min.js"></script>
<!-- jquery-3.5.1이 위에 있어야 작동 -->
<!-- Slick.js -->

<!-- Slider.js no CDN -->
<!-- <script src="js/slick/slick.min.js"></script>
    <link rel="stylesheet" href="js/slick/slick.css">
    <link rel="stylesheet" href="js/slick/slick-theme.css"> -->

<!-- bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<!-- Slider.js CDN -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="/assets/js/custom-slick.js"></script>
<!-- 작성한 css는 항상 밑에 있어야함 -->
<link href="/assets/css/book.css" rel="stylesheet">
<script src="/assets/js/turn.min.js"></script>
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
</head>
<body>
	<div class="container">
		<div class="inner">
			<header>
				<div class="banner">
					<div class="lnb">
						<a href="#none"><em>for</em> member</a> <a href="#none">로그인</a> <a href="#none">회원가입</a>
					</div>
				</div>
				<nav>
					<div class="logo">
						<a href="#none"><img src="/assets/images/main/bandi-logo3.png"></a>
					</div>
					<ul class="gnb">
						<li><a href="#none">HOME</a></li>
						<li><a href="#none">소설</a></li>
						<li><a href="#none">공모전</a></li>
						<li class="dropdown"><a href="#none" class="dropbtn">게시판</a></li>
						<li><a href="#none">고객지원</a></li>
						<li><a href="#none">마이페이지</a></li>
					</ul>
				</nav>
			</header>
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
							<div class="username">asd1234 님</div>
							<div class="info-category">
								<span><img src="/assets/images/main/user-line.png">내정보</span> <span><img src="/assets/images/main/thumb-up-line.png">알림</span> <span><img
									src="/assets/images/main/star-line.png">구매목록</span>
							</div>
							<div class="gold-info">
								<div>보유골드</div>
								<span class="blue-span">${userGold}</span>
							</div>
							<div class="right-box">
								<div class="right-box-cover">
									<a><img src="/assets/images/main/ai1.jpg"></a>
								</div>
								<div class="right-box-detail">
									<div class="right-detail-desc">
										<div class="desc-title">버려진 숲의 마왕성 숲의 마왕성 마왕성 마왕성</div>
									</div>
								</div>
							</div>
						</div>
						<div class="right-banner">
							<img src="/assets/images/main/gold-charge.png">
						</div>
						<div class="right-banner">
							<img src="/assets/images/main/author-banner.png">
						</div>
						<div class="recommend-list">
							<h3 class="recommend-header">
								<a>추천작</a>
							</h3>
							<ul>
								<li><a class="recommend-item">
										<div class="recommend-img">
											<img src="/assets/images/main/ai1.jpg">
										</div>
										<div class="recommend-desc">
											<span>현대판타지</span> <span class="bold-font">천재들과 함께하는 연예계 생활</span> <span>김경은</span>
										</div>
								</a></li>
								<li><a class="recommend-item">
										<div class="recommend-img">
											<img src="/assets/images/main/ai2.jpg">
										</div>
										<div class="recommend-desc">
											<span>현대판타지</span> <span class="bold-font">천재들과 함께하는 연예계 생활</span> <span>김경은</span>
										</div>
								</a></li>
								<li><a class="recommend-item">
										<div class="recommend-img">
											<img src="/assets/images/main/ai3.jpg">
										</div>
										<div class="recommend-desc">
											<span>현대판타지</span> <span class="bold-font">천재들과 함께하는 연예계 생활</span> <span>김경은</span>
										</div>
								</a></li>
								<li><a class="recommend-item">
										<div class="recommend-img">
											<img src="/assets/images/main/ai4.jpg">
										</div>
										<div class="recommend-desc">
											<span>현대판타지</span> <span class="bold-font">천재들과 함께하는 연예계 생활</span> <span>김경은</span>
										</div>
								</a></li>
								<li><a class="recommend-item">
										<div class="recommend-img">
											<img src="/assets/images/main/ai2.jpg">
										</div>
										<div class="recommend-desc">
											<span>현대판타지</span> <span class="bold-font">천재들과 함께하는 연예계 생활</span> <span>김경은</span>
										</div>
								</a></li>
								<li><a class="recommend-item">
										<div class="recommend-img">
											<img src="/assets/images/main/ai1.jpg">
										</div>
										<div class="recommend-desc">
											<span>현대판타지</span> <span class="bold-font">천재들과 함께하는 연예계 생활</span> <span>김경은</span>
										</div>
								</a></li>
							</ul>
						</div>
					</div>
				</aside>
			</div>
		</div>
	</div>
	<footer>
		<div class="inner">
			<div class="footer-top">
				<ul>
					<li>(주)반디</li>
					<li><a href="#none">이용약관</a></li>
					<li><a href="#none">개인정보 처리방침</a></li>
					<li><a href="#none">청소년 보호 정책</a></li>
					<li><a href="#none">회사 소개</a></li>
				</ul>
			</div>
			<div class="footer-content">
				<ul class="community">
					<!-- 제목 줄은 a없이-->
					<li>게시판</li>
					<li><a href="#none">Subscribe</a></li>
					<li><a href="#none">Give A Gift</a></li>
					<li><a href="#none">Customer Service FAQ</a></li>
					<li><a href="#none">Access Your Subscription</a></li>
				</ul>
				<ul class="network">
					<li>Network</li>
					<li><a href="#none">Privacy Policy</a></li>
					<li><a href="#none">Terms Of Service</a></li>
					<li><a href="#none">Advertise</a></li>
					<li><a href="#none">Jobs</a></li>
				</ul>
				<ul class="help">
					<li>Help Preserve This Project</li>
					<li>We may earn a commission if you purchase an item featured on our site.</li>
					<li>Copyright © 2020 CodingWorks. All rights reserved.</li>
				</ul>
			</div>
		</div>
	</footer>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script type="text/javascript" src="/assets/js/novel/novelDetail.js"></script>
	