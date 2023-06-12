<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>

<!-- 작성한 css는 항상 밑에 있어야함 -->
<link href="/assets/css/book.css" rel="stylesheet">
<script src="/assets/js/turn.min.js"></script>
<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/registration.css" />
<div class="main-layout">
	<section class="main-form" style="width: 100%;">
		<div class="registration-form">
			<h1>회원 가입</h1>
			<form action="/user" method="post" class="form">
				<input type="hidden" name="username" value="${user.username}"> <input type="hidden" name="password" value="${user.password}"> <input type="hidden" name="external" value="kakao">
				<div class="input-box">
					<label>닉네임</label> <input type="text" id="nickName" name="nickName" placeholder="Enter full name (3-20자)" required />
					<div id="nickNameCheck"></div>
				</div>
				<div class="input-box">
					<label>이메일</label> <input type="text" name="email" id="email" placeholder="Enter email address" required />
					<div class="d-flex flex-row-reverse">
						<button type="button" id="emailAuth" class="btn btn-secondary">이메일 인증</button>
					</div>
				</div>
				<div class="input-box">
					<label>인증번호</label> <input type="text" class="form-control" id="authKey" name="authKey" disabled="disabled">
					<div class="d-flex flex-row-reverse">
						<button type="button" id="confirm" class="btn btn-secondary">인증확인</button>
					</div>
				</div>
				<div class="input-box">
					<label>생년월일</label> <input type="date" class="form-control" id="birthDate" name="birthDate" required value="1991-09-29">
				</div>
				<div class="gender-box">
					<h3>성별</h3>
					<div class="gender-option">
						<div class="gender">
							<input type="radio" value="남성" id="check-male" name="gender" checked /> <label for="check-male">남자</label>
						</div>
						<div class="gender">
							<input type="radio" value="여성" id="check-female" name="gender" /> <label for="check-female">여자</label>
						</div>
					</div>
				</div>
				<button class="submit-button" id="joinBtn" onsubmit="alertJoin()" type="button">등록</button>
			</form>
		</div>
	</section>

</div>
<script type="text/javascript" src="/assets/js/user/joinFormForExternal.js"></script>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>