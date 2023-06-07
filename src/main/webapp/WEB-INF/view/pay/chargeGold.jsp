<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/registration.css" />
      	<div class="main-layout">
      		<section class="main-form">
      			<div class="registration-form">
      				<h1>골드 충전</h1>
      				<form action="/payment/kakaoPay/gold/ready" method="post" class="form">
      					<div class="input-box mt-5">
      						<label>아래에서 충전 금액을 선택해주세요</label>
      						<div class="select-box mb-5">
      							<select id="goldSelectForm" aria-label="Default select example">
									<option selected>골드 충전 선택</option>
									<option value="1000">1000</option>
									<option value="3000">3000</option>
									<option value="5000">5000</option>
									<option value="10000">10000</option>
									<option value="50000">50000</option>
									<option value="100000">100000</option>
								</select>
      						</div>
      					</div>
      					<input type="hidden" name="sectionId" value="0">
						<input type="hidden" name="novelId" value="0">
						<input type="hidden" name="quantity" value="1"> 
						<input type="hidden" name="itemName" value="골드"> 
						<input id="totalAmount" type="hidden" name="totalAmount" value="0">
      					<div id="chargeBtn" class="d-flex flex-row-reverse">
      						<button class="submit-button" type="submit">충전하기</button>
      					</div>
      				</form>
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
