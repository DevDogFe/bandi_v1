<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<!-- 작성한 css는 항상 밑에 있어야함 -->
<link href="/assets/css/book.css" rel="stylesheet">
<script src="/assets/js/turn.min.js"></script>
<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/registration.css" />
			<div class="main-layout">
				<section class="main-form">
					<div class="registration-form">
						<h1>회차 등록</h1>
						<form class="form" action="/section/registration" method="post">
							<input type="hidden" name="novelId" value="${novelId}">
							<div class="input-box">
								<label>제목</label> <input type="text" id="title" name="title" placeholder="Enter full name" required />
							</div>
							<c:choose>
								<c:when test="${serviceTypeId == 1 }">
									<div class="input-box mb-5">
										<label>회차 가격설정</label>
										<div class="select-box mb-5">
											<select id="listPrice" name="listPrice">
												<option value="0" selected="selected">무료</option>
												<option value="200">200</option>
											</select>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="listPrice" value="0">
								</c:otherwise>
							</c:choose>

							<div class="input-box">
								<label>본문</label>
								<textarea id="content" name="content" class="form-control" required="required" rows="15"></textarea>
							</div>
							<div class="d-flex flex-row-reverse">
								<button class="submit-button" type="submit">등록</button>
							</div>
						</form>
					</div>
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
								<span class="blue-span">1000</span>
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
		<%@include file="/WEB-INF/view/layout/footer.jsp"%>
		