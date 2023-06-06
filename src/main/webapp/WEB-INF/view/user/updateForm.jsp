<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>

<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/mypage/sidebar.css" />
<link rel="stylesheet" href="/assets/css/mypage/record.css" />
<link rel="stylesheet" href="/assets/css/mypage/userupdate.css" />

<div class="sectind-flex">
	<section class="left-sidebar">
		<div class="sidebar">
			<div class="logo_content">
				<div class="logo">
					<i class='bx bx-leaf'></i>
					<div class="logo_name">반디</div>
				</div>
			</div>
			<ul class="nav_list">
				<li><a href="/myInfo"> <i class='bx bx-user'></i> <span class="links_name">개인정보</span>
				</a></li>
				<li><a href="/myNovel"> <i class='bx bx-book-open'></i> <span class="links_name">내 작품</span>
				</a></li>
				<li><a href="/myFavorite"> <i class='bx bx-bookmark'></i> <span class="links_name">즐겨찾기 목록</span>
				</a></li>
				<li><a href="/purchase"> <i class='bx bx-book-add'></i> <span class="links_name">작품 구매 기록</span>
				</a></li>
				<li><a href="/rental"> <i class='bx bx-book-bookmark'></i> <span class="links_name">작품 대여 기록</span>
				</a></li>
				<li><a href="/goldCharge"> <i class='bx bx-coin-stack'></i> <span class="links_name">골드 충전 기록</span>
				</a></li>
				<li><a href="#"> <i class='bx bx-conversation'></i> <span class="links_name">1:1 문의</span>
				</a></li>
			</ul>
		</div>
	</section>
	<section class="main">
		<div class="reportList">
			<div class="main-header">
				<h3 class="mb-2">내 정보 수정</h3>
			</div>
			<form class="form" action="/user" method="post">
				<c:choose>
					<c:when test="${principal.external != null }">
						<input type="hidden" class="form-control" name="beforePassword" required value="111111">
						<input type="hidden" class="form-control" name="password" required value="111111">
						<input type="hidden" class="form-control" name="passwordCheck" required value="111111">
					</c:when>
					<c:otherwise>
						<div class="input-box">
							<label>비밀번호</label> <input type="password" id="beforePassword" minlength="3" name="beforePassword" required value="123">
						</div>
						<div class="input-box">
							<label>새 비밀번호</label> <input type="password" id="password" name="password" minlength="3" required value="456">
						</div>
						<div class="input-box">
							<label>비밀번호 확인</label> <input type="password" id="passwordCheck" name="passwordCheck" minlength="3" required value="456">
						</div>
					</c:otherwise>
				</c:choose>
				<div class="input-box">
					<label>닉네임</label> <input type="text" id="nickName" name="nickName" required value="${principal.nickName}">
					<div id="nickNameCheck"></div>
				</div>
				<div class="btn-flex">
					<button type="button" id="updateBtn" class="btn btn-primary">정보 수정</button>
				</div>
			</form>
		</div>
	</section>
</div>
<script type="text/javascript" src="/assets/js/user/updateForm.js"></script>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>
