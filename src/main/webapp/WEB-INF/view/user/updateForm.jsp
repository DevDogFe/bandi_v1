<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>

<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/mypage/sidebar.css" />
<link rel="stylesheet" href="/assets/css/mypage/record.css" />
<link rel="stylesheet" href="/assets/css/mypage/userupdate.css" />

<%@include file="/WEB-INF/view/user/userLeftbar.jsp"%>
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
						<label>비밀번호</label> <input type="password" id="beforePassword" minlength="3" name="beforePassword" required>
					</div>
					<div class="input-box">
						<label>새 비밀번호</label> <input type="password" id="password" name="password" minlength="3" required>
					</div>
					<div class="input-box">
						<label>비밀번호 확인</label> <input type="password" id="passwordCheck" name="passwordCheck" minlength="3" required>
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
<script type="text/javascript" src="/assets/js/user/updateForm.js"></script>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>
