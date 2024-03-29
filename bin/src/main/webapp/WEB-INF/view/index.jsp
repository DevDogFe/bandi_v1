<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<style type="text/css">
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
	<h1>index</h1>
	<div class="form--container">
		<!-- Button trigger modal -->
		<c:choose>
			<c:when test="${empty principal}">
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</button>

				<!-- Modal -->
				<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">로그인</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form action="/login" method="post">
									<div class="mb-3">
										<label for="username" class="form-label">ID</label> <input type="text" class="form-control" name="username" id="username" required="required" value="qwe">
									</div>
									<div class="mb-3">
										<label for="password" class="form-label">Password</label> <input type="password" class="form-control" name="password" id="password" required="required" value="123">
									</div>
									<div class="mb-3 form-check">
										<input type="checkbox" class="form-check-input" id="exampleCheck1"> <label class="form-check-label" for="exampleCheck1">Check me out</label>
									</div>
									<button type="submit" class="btn btn-primary">Submit</button>
									<br> <a href="/user">회원가입</a> <br> <a
										href="https://kauth.kakao.com/oauth/authorize?client_id=f2f5ec106cf03cddc10930e8d7c58d68&redirect_uri=http://localhost/auth/kakao/callback&response_type=code"> <img alt="카카오로그인"
										src="/assets/images/kakao_login/ko/kakao_login_medium_wide.png">
									</a>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save changes</button>
							</div>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${principal.external == true }">
						<button onclick="location.href='https://kauth.kakao.com/oauth/logout?client_id=f2f5ec106cf03cddc10930e8d7c58d68&logout_redirect_uri=http://localhost/logout'" class="btn btn-primary">로그아웃</button>
					</c:when>
					<c:otherwise>
						<button onclick="location.href='/logout'" class="btn btn-primary">로그아웃</button>
					</c:otherwise>
				</c:choose>
				<a href="/update">내 정보 수정</a>
				<a href="/novel/registration">소설 등록</a>
				<a href="/pay">유료 작품 목록</a>
				<a href="/free">무료 작품 목록</a>
				<a href="#">내 즐겨찾기</a>
				<a href="#">내 작품</a>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>