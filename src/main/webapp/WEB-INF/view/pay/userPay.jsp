<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/registration.css" />
      	<div class="main-layout">
      		<section class="main-form">
      			<div class="registration-form">
      				<div class="top">
						<h1>구매가 필요한 유료 작품입니다.</h1>
					</div>
					<div class="bottom mt-5">
						<h1>골드 사용하기</h1>
						<div class="bottom-inner m-3" >
							<form class="form" action="/payment/gold/purchase/${serviceTypeId}" method="post">
							<input type="hidden" name="sectionId" value="${paySection.id}">
							<input type="hidden" name="novelId" value="${paySection.novelId}">
							<input type="hidden" name="quantity" value="1">
							<input type="hidden" name="itemName" value="${paySection.title}">
							<input type="hidden" name="totalAmount" value="${paySection.listPrice}">
							<button type="submit" class="pay-btn gold-purchase" >구매 ${paySection.listPrice} G</button>
						</form>
						<form class="form" action="/payment/gold/rental/${serviceTypeId}" method="post">
							<input type="hidden" name="sectionId" value="${paySection.id}">
							<input type="hidden" name="novelId" value="${paySection.novelId}">
							<input type="hidden" name="quantity" value="1">
							<input type="hidden" name="itemName" value="${paySection.title}">
							<input type="hidden" name="totalAmount" value="${paySection.rentPrice}">
							<button type="submit" class="pay-btn gold-rental">대여 ${paySection.rentPrice} G</button>
						</form>
						</div>
						<h1>결제 방법을 선택해주세요</h1>
						<div class="bottom-inner m-3">
						<form class="form" action="/payment/kakaoPay/ready/${serviceTypeId}" method="post">
							<input type="hidden" name="sectionId" value="${paySection.id}">
							<input type="hidden" name="novelId" value="${paySection.novelId}">
							<input type="hidden" name="quantity" value="1">
							<input type="hidden" name="itemName" value="${paySection.title}">
							<input type="hidden" name="totalAmount" value="${paySection.listPrice}">
							<button type="submit" class="pay-btn purchase">구매 ${paySection.listPrice} G</button>
						</form>
						<form class="form" action="/payment/kakaoPay/ready/${serviceTypeId}" method="post">
							<input type="hidden" name="sectionId" value="${paySection.id}">
							<input type="hidden" name="novelId" value="${paySection.novelId}">
							<input type="hidden" name="quantity" value="1">
							<input type="hidden" name="itemName" value="${paySection.title}">
							<input type="hidden" name="totalAmount" value="${paySection.rentPrice}">
							<input type="hidden" name="isRental" value="true">
							<button type="submit" class="pay-btn rental">3일 대여 ${paySection.rentPrice} G</button>
							<button type="button" class="pay-btn charge"
								onclick="location.href='/payment/charge'">골드 충전하기</button>
						</form>
						</div>
					</div>
      			</div>
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
										<div class="desc-title">${lastNovel.title}</div>
										<c:choose>
											<c:when test="${lastNovel.serviceTypeId != 3}">
												<a href="/section/read/${lastNovel.novelId}/${lastNovel.sectionId}/${lastNovel.serviceTypeId}"><div class="desc-title">바로가기</div></a>
											</c:when>
											<c:otherwise>
												<a href="/contest/novel/read/${lastNovel.novelId}/${lastNovel.sectionId}"><div class="desc-title">바로가기</div></a>
											</c:otherwise>
										</c:choose>
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
							<h3 class="recommend-header">
								<a>${genreList.get(0).genreName } 추천작</a>
							</h3>
							<ul>
								<c:forEach items="${genreList }" var="novel">
									<li><a class="recommend-item">
											<div class="recommend-img">
												<c:choose>
													<c:when test="${novel.cover != null }">
														<img alt="이미지 기간만료" src="/bandi/uploads/${novel.cover }">
													</c:when>
													<c:otherwise>
														<img alt="이미지 없음" src="/assets/images/noimg.jpg">
													</c:otherwise>
												</c:choose>
											</div>
											<div class="recommend-desc">
												<span>${novel.genreName} </span> <span class="bold-font">${novel.title}</span> <span>${novel.nickName}</span>
											</div>
									</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</aside>
      	</div>
      <%@include file="/WEB-INF/view/layout/footer.jsp"%>
