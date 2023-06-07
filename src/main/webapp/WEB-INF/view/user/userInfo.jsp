<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>

<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/mypage/sidebar.css" />
<link rel="stylesheet" href="/assets/css/mypage/record.css" />
<link rel="stylesheet" href="/assets/css/mypage/userInfo.css" />
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
				<li><a href="/qna/userList"> <i class='bx bx-conversation'></i> <span class="links_name">1:1 문의</span>
				</a></li>
			</ul>
		</div>
	</section>
	<section class="main">
		<div class="reportList">
			<div class="section-title-wrap form-title">
				<div class="main-header">
					<h2 class="mb-2">
						내 정보 <span class="more"><a href="/update">내 정보 수정</a></span>
					</h2>
				</div>
				<div class="right-wrap">
					<span class="icon-required"></span>
				</div>
			</div>
			<div class="form-wrap my-profile-form">
				<div class="form-group row my-profile-img my-info-memo">
					<div class="form-label-wrap">
						<label class="form-label">프로필</label>
					</div>
					<span class="form-value profile-img"> <span class="profile-img-upload-wrap has-email"> <span class="profile-preview-wrap has-profile"
							style="background-image: url(/assets/images/board/profile.png);"></span> <span class="btn-wrap"> <span class="email">${principal.email}</span>
						</span>
					</span>
					</span>
				</div>
				<div class="form-group row">
					<div class="form-label-wrap">
						<label for="inputId" class="form-label">아이디</label>
					</div>
					<div class="form-value has-btn">
						<input type="text" maxlength="10" value="${principal.username}" readonly="readonly">
					</div>
				</div>
				<div class="form-group row">
					<div class="form-label-wrap">
						<label for="inputNick" class="form-label">닉네임</label>
					</div>
					<div class="form-value has-btn">
						<input type="text" maxlength="10" value="${principal.nickName}" readonly="readonly">
					</div>
				</div>
				<div class="form-group row">
					<div class="form-label-wrap">
						<label for="inputBirth" class="form-label">생년월일</label>
					</div>
					<div class="form-value">
						<input type="text" maxlength="8" value="${principal.birthDate}(${principal.getAge()}세)" readonly="readonly">
					</div>
				</div>
				<div class="form-group row">
					<div class="form-label-wrap">
						<label for="rdoGenderMan" class="form-label">성별</label>
					</div>
					<div class="form-value">
						<input type="text" maxlength="8" value="${principal.gender}" readonly="readonly">
					</div>
				</div>
				<div class="form-group row">
					<div class="form-label-wrap">
						<label for="gold" class="form-label">골드</label>
					</div>
					<div class="form-value">
						<input type="text" maxlength="8" value="${gold}" readonly="readonly">
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>
