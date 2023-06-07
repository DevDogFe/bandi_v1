<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../layout/header.jsp"%>
<script src="/vendor/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/registration.css" />
<script>
	$(document).ready(function() {
		$("#addContestForm").css('display', 'none');
		$("#serviceTypeId").on("change", function() {
			if ($(this).val() == 3) {
				$("#addContestForm").show();
				// 서비스 타입 공모전 선택 시 contestId에 기본값 설정
				$("#contestId").val($("#contestOptionId1").val());
			} else {
				$("#addContestForm").hide();
				$("#contestId").val(0);
			}
		});

		$("#contestFormId").on("change", function() {

			let contestOptionId = $("#contestFormId").val();
			// input값 변경으로 공모전 id post 하기
			$("#contestId").val($("#contestOptionId" + contestOptionId).val());
		});
	})
</script>
<div class="main-layout">
	<section class="main-form">
		<div class="registration-form">
			<h1>소설 등록</h1>
			<form action="#" class="form">
				<div class="input-box">
					<label>제목</label> <input type="text" id="title" name="title" placeholder="Enter full name" required />
				</div>
				<div class="input-box">
					<label>장르</label>
					<div class="select-box">
						<select id="genreId" name="genreId" class="form-select">
							<c:forEach items="${genreList}" var="genre">
								<option value="${genre.id}">${genre.name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="input-box">
					<label>서비스 타입</label>
					<div id="serviceTypeId" name="serviceTypeId" class="select-box">
						<select id="serviceTypeId" name="serviceTypeId">
							<c:forEach items="${serviceTypeList}" var="serviceType">
								<c:choose>
									<c:when test="${serviceType.name == '공모전'}">
										<option id="selectContest" value="${serviceType.id}">${serviceType.name }</option>
									</c:when>
									<c:otherwise>
										<option value="${serviceType.id}">${serviceType.name }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
				</div>
				<div id="addContestForm">
					<label for="contestFormId" class="form-label">공모전</label> <select id="contestFormId" name="contestFomrId" class="form-select">
						<c:forEach items="${contestList}" var="contest" varStatus="vs">
							<option id="contestOptionId${vs.index+1}" value="${contest.id}">${contest.title}</option>
						</c:forEach>
					</select> <input id="contestId" name="contestId" type="hidden" value="0">
				</div>
				<div class="input-box">
					<label>연재 요일</label>
					<div class="select-box">
						<select id="serialCycle" name="serialCycle">
							<option value="월">월</option>
							<option value="화">화</option>
							<option value="수">수</option>
							<option value="목">목</option>
							<option value="금">금</option>
							<option value="토">토</option>
							<option value="일">일</option>
						</select>
					</div>
				</div>
				<div class="input-box">
					<label>작품소개</label>
					<textarea id="content" name="content" class="form-control" required="required" rows="10"> 단종의 강함을 따라잡기 위해 세조가 수련을 시작하다.</textarea>
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
					<a>${principal.getGeneration() } ${principal.gender } 추천작</a>
				</h3>
				<ul>
					<c:forEach items="${recommendList }" var="novel">
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
