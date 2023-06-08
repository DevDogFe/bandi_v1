<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<section class="big-testimonial">
	<div class="inner">
		<div class="big-testimonial-content">
			<div class="bigSlider">
				<div>
					<p class="big-banner">
						<img src="/assets/images/main/topSlider.png">
					</p>
				</div>
				<div>
					<p class="big-banner">
						<img src="/assets/images/main/topSlider2.png">
					</p>
				</div>
				<div>
					<p class="big-banner">
						<img src="/assets/images/main/topSlider.png">
					</p>
				</div>
				<div>
					<p class="big-banner">
						<img src="/assets/images/main/topSlider2.png">
					</p>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- 유료 -->
<section class="ranking pay">
	<div class="inner">
		<div class="ranking-content">
			<c:choose>
				<c:when test="${empty principal }">
					<h2>유료 웹소설 베스트</h2>
				</c:when>
				<c:otherwise>
					<h2>${novelList1.get(0).genreName}장르인기소설</h2>
				</c:otherwise>
			</c:choose>
			<div class="row"></div>
			<div class="items">
				<c:forEach items="${novelList1 }" var="novel">
					<div class="item" onclick="location.href='/novel/detail/${novel.id }'" style="cursor: pointer;">
						<div class="up-image">
							<c:choose>
								<c:when test="${novel.cover != null }">
									<img alt="이미지 기간만료" src="/bandi/uploads/${novel.cover }">
								</c:when>
								<c:otherwise>
									<img alt="이미지 없음" src="/assets/images/noimg.jpg">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="down-desc">
							<h3>${novel.title }</h3>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</section>
<c:if test="${!empty principal }">
	<c:if test="${!empty novelList2 }">
		<section class="ranking pay">
			<div class="inner">
				<div class="ranking-content">
					<h2>${principal.nickName}님맞춤추천리스트</h2>
					<div class="row"></div>
					<div class="items">
						<c:forEach items="${novelList2 }" var="novel">
							<div class="item" onclick="location.href='/novel/detail/${novel.id }'" style="cursor: pointer;">
								<div class="up-image">
									<c:choose>
										<c:when test="${novel.cover != null }">
											<img alt="이미지 기간만료" src="/bandi/uploads/${novel.cover }">
										</c:when>
										<c:otherwise>
											<img alt="이미지 없음" src="/assets/images/noimg.jpg">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="down-desc">
									<h3>${novel.title }</h3>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</section>
	</c:if>
</c:if>
<section class="vertical-list">
	<div class="list-header">
		<h2>웹소설 통합 랭킹</h2>
	</div>
	<div class="list-body">
		<ul>
			<c:forEach items="${novelList3 }" var="novel" begin="0" end="4">
				<li class="li-item"><a href="#" class="li-link">
						<div class="li-thumbnail">
							<c:choose>
								<c:when test="${novel.cover != null }">
									<img alt="이미지 기간만료" src="/bandi/uploads/${novel.cover }">
								</c:when>
								<c:otherwise>
									<img alt="이미지 없음" src="/assets/images/noimg.jpg">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="li-info-area">
							<p>
								<span class="li-title">${novel.title }</span>
							</p>
							<p>
								<span class="li-desc">${novel.genreName }</span>
							</p>
							<p>
								<span class="li-desc"><i class='bx bxs-star'></i> ${novel.favoriteCount }</span>
							</p>
						</div>
				</a></li>
			</c:forEach>
		</ul>
		<ul>
			<c:forEach items="${novelList3 }" var="novel" begin="5" end="9">
				<li class="li-item"><a href="#" class="li-link">
						<div class="li-thumbnail">
							<c:choose>
								<c:when test="${novel.cover != null }">
									<img alt="이미지 기간만료" src="/bandi/uploads/${novel.cover }">
								</c:when>
								<c:otherwise>
									<img alt="이미지 없음" src="/assets/images/noimg.jpg">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="li-info-area">
							<p>
								<span class="li-title">${novel.title }</span>
							</p>
							<p>
								<span class="li-desc">${novel.genreName }</span>
							</p>
							<p>
								<span class="li-desc"><i class='bx bxs-star'></i> ${novel.favoriteCount }</span>
							</p>
						</div>
				</a></li>
			</c:forEach>
		</ul>
		<ul>
			<c:forEach items="${novelList3 }" var="novel" begin="10" end="14">
				<li class="li-item"><a href="#" class="li-link">
						<div class="li-thumbnail">
							<c:choose>
								<c:when test="${novel.cover != null }">
									<img alt="이미지 기간만료" src="/bandi/uploads/${novel.cover }">
								</c:when>
								<c:otherwise>
									<img alt="이미지 없음" src="/assets/images/noimg.jpg">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="li-info-area">
							<p>
								<span class="li-title">${novel.title }</span>
							</p>
							<p>
								<span class="li-desc">${novel.genreName }</span>
							</p>
							<p>
								<span class="li-desc"><i class='bx bxs-star'></i> ${novel.favoriteCount }</span>
							</p>
						</div>
				</a></li>
			</c:forEach>
		</ul>
</section>
<!-- Slider -->
<section class="testimonial2">
	<div class="inner">
		<div class="testimonial2-content">
			<div class="topSlider">
				<div>
					<p class="top-banner">
						<img src="/assets/images/main/bandi-copy-banner1.jpg">
					</p>
				</div>
				<div>
					<p class="top-banner">
						<img src="/assets/images/main/bandi-copy-banner2.jpg">
					</p>
				</div>
				<div>
					<p class="top-banner">
						<img src="/assets/images/main/bandi-copy-banner3.jpg">
					</p>
				</div>
				<div>
					<p class="top-banner">
						<img src="/assets/images/main/bandi-copy-banner2.jpg">
					</p>
				</div>
				<div>
					<p class="top-banner">
						<img src="/assets/images/main/bandi-copy-banner1.jpg">
					</p>
				</div>
				<div>
					<p class="top-banner">
						<img src="/assets/images/main/bandi-copy-banner3.jpg">
					</p>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="vertical-list">
	<div class="list-header">
		<h2>무료소설 인기작</h2>
	</div>
	<div class="list-body">
		<ul>
			<c:forEach items="${novelList4 }" var="novel" begin="0" end="4">
				<li class="li-item"><a href="#" class="li-link">
						<div class="li-thumbnail">
							<c:choose>
								<c:when test="${novel.cover != null }">
									<img alt="이미지 기간만료" src="/bandi/uploads/${novel.cover }">
								</c:when>
								<c:otherwise>
									<img alt="이미지 없음" src="/assets/images/noimg.jpg">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="li-info-area">
							<p>
								<span class="li-title">${novel.title }</span>
							</p>
							<p>
								<span class="li-desc">${novel.genreName }</span>
							</p>
							<p>
								<span class="li-desc"><i class='bx bxs-star'></i> ${novel.favoriteCount }</span>
							</p>
						</div>
				</a></li>
			</c:forEach>
		</ul>
		<ul>
			<c:forEach items="${novelList4 }" var="novel" begin="5" end="9">
				<li class="li-item"><a href="#" class="li-link">
						<div class="li-thumbnail">
							<c:choose>
								<c:when test="${novel.cover != null }">
									<img alt="이미지 기간만료" src="/bandi/uploads/${novel.cover }">
								</c:when>
								<c:otherwise>
									<img alt="이미지 없음" src="/assets/images/noimg.jpg">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="li-info-area">
							<p>
								<span class="li-title">${novel.title }</span>
							</p>
							<p>
								<span class="li-desc">${novel.genreName }</span>
							</p>
							<p>
								<span class="li-desc"><i class='bx bxs-star'></i> ${novel.favoriteCount }</span>
							</p>
						</div>
				</a></li>
			</c:forEach>
		</ul>
		<ul>
			<c:forEach items="${novelList4 }" var="novel" begin="10" end="14">
				<li class="li-item"><a href="#" class="li-link">
						<div class="li-thumbnail">
							<c:choose>
								<c:when test="${novel.cover != null }">
									<img alt="이미지 기간만료" src="/bandi/uploads/${novel.cover }">
								</c:when>
								<c:otherwise>
									<img alt="이미지 없음" src="/assets/images/noimg.jpg">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="li-info-area">
							<p>
								<span class="li-title">${novel.title }</span>
							</p>
							<p>
								<span class="li-desc">${novel.genreName }</span>
							</p>
							<p>
								<span class="li-desc"><i class='bx bxs-star'></i> ${novel.favoriteCount }</span>
							</p>
						</div>
				</a></li>
			</c:forEach>
		</ul>
	</div>
</section>

<!-- Slider -->
<section class="testimonial">
	<div class="inner">
		<div class="testimonial-content">
			<h2>
				태그 <b>추천</b> 작품
			</h2>
			<hr>
			<div class="mySlider">
				<div>
					<p class="client">
						<img src="/assets/images/main/ai1.jpg"> <span><b>나 혼자만 강화술사</b></span>
					</p>
					<p class="comment">세상에 강화템은 많지만 오직 나만이 강화할 수 있다.</p>
					<p class="comment">세상에 강화템은 많지만 오직 나만이 강화할 수 있다.</p>

				</div>
				<div>
					<p class="client">
						<img src="/assets/images/main/ai2.jpg"> <span><b>내 집에 영약 광산이 열렸다</b></span>
					</p>
					<p class="comment">Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt voluptates velit doloribus, iure dolores porro commodi, ipsa corrupti dolorem alias libero quasi enim vero
						tempora et sit in, quaerat consequuntur.</p>
				</div>
				<div>
					<p class="client">
						<img src="/assets/images/main/ai3.jpg"> <span><b>해고 후 상속 대박</b></span>
					</p>
					<p class="comment">Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt voluptates velit doloribus, iure dolores porro commodi, ipsa corrupti dolorem alias libero quasi enim vero
						tempora et sit in, quaerat consequuntur.</p>
				</div>
				<div>
					<p class="client">
						<img src="/assets/images/main/ai1.jpg"> <span><b>나 혼자만 강화술사</b></span>
					</p>
					<p class="comment">Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt voluptates velit doloribus, iure dolores porro commodi, ipsa corrupti dolorem alias libero quasi enim vero
						tempora et sit in, quaerat consequuntur.</p>
				</div>
				<div>
					<p class="client">
						<img src="/assets/images/main/ai2.jpg"> <span><b>내 집에 영약 광산이 열렸다</b></span>
					</p>
					<p class="comment">Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt voluptates velit doloribus, iure dolores porro commodi, ipsa corrupti dolorem alias libero quasi enim vero
						tempora et sit in, quaerat consequuntur.</p>
				</div>
				<div>
					<p class="client">
						<img src="/assets/images/main/ai3.jpg"> <span><b>해고 후 상속 대박</b></span>
					</p>
					<p class="comment">Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt voluptates velit doloribus, iure dolores porro commodi, ipsa corrupti dolorem alias libero quasi enim vero
						tempora et sit in, quaerat consequuntur.</p>
				</div>

			</div>
		</div>
	</div>
</section>

<%@include file="/WEB-INF/view/layout/footer.jsp"%>
