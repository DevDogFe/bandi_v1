<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/registration.css" />
<div class="main-layout">
	<section class="main-form mb-5" style="width: 100%">
		<div class="registration-form">
			<h1>소설 등록</h1>
			<form action="/novel/registration" method="post" class="form">
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
					<div id="serviceTypeId" name="serviceTypeId" class="select-box mb-3">
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
						<c:choose>
							<c:when test="${empty contestList }">
								<option id="contestOptionId" value="">진행중인 공모전이 없습니다.</option>
							</c:when>
							<c:otherwise>
								<c:forEach items="${contestList}" var="contest" varStatus="vs">
									<option id="contestOptionId${vs.index+1}" value="${contest.id}">${contest.title}</option>
								</c:forEach>

							</c:otherwise>
						</c:choose>
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
					<label class="mb-2">작품소개</label>
					<textarea id="overview" name="overview" class="form-control" required="required" rows="10"> 단종의 강함을 따라잡기 위해 세조가 수련을 시작하다.</textarea>
				</div>
				<div class="d-flex flex-row-reverse">
					<button class="submit-button" type="submit">등록</button>
				</div>
			</form>
		</div>
	</section>

</div>
<script src="/assets/js/novel/registrationForm.js"></script>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>
