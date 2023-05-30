<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

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
										<label for="username" class="form-label">ID</label> <input type="text" class="form-control" name="username" id="usernameL" required="required" value="qwe">
									</div>
									<div class="mb-3">
										<label for="password" class="form-label">Password</label> <input type="password" class="form-control" name="password" id="passwordL" required="required" value="123">
									</div>
									<div class="mb-3 form-check">
										<input type="checkbox" class="form-check-input" id="exampleCheck1"> <label class="form-check-label" for="exampleCheck1">Check me out</label>
									</div>
									<button type="button" id="loginBtn" class="btn btn-primary">Login</button>
									<br> <a href="/user">회원가입</a> <br> <a href="/findPwd">비밀번호 찾기</a> <a
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
				<h3>로그인 되었습니다.</h3>
				<c:choose>
					<c:when test="${\"kakao\".equals(principal.external) }">
						<button onclick="location.href='https://kauth.kakao.com/oauth/logout?client_id=f2f5ec106cf03cddc10930e8d7c58d68&logout_redirect_uri=http://localhost/logout'" class="btn btn-primary">로그아웃</button>
					</c:when>
					<c:when test="${\"naver\".equals(principal.external) }">
						<button onclick="logoutNaver();" class="btn btn-primary">로그아웃</button>
					</c:when>
					<c:otherwise>
						<button onclick="location.href='/logout'" class="btn btn-primary">로그아웃</button>
					</c:otherwise>
				</c:choose>
				<a href="/board/list">게시판</a>
				<a href="/myInfo">내 정보</a>
				<a href="/novel/registration">소설 등록</a>
				<a href="/pay">유료 작품 목록</a>
				<a href="/free">무료 작품 목록</a>
				<a href="#">내 즐겨찾기</a>
				<a href="#">내 작품</a>
				<a href="/admin/adminPage">관리자 페이지</a>
			</c:otherwise>
		</c:choose>
		<c:if test="${!empty principal }">
			<h3>${principal.getGeneration() }대${principal.gender}이좋아하는작품</h3>
			<table class="table">
				<c:forEach items="${ageGenderList }" var="novel">
					<tr>
						<td>${novel.title }</td>
					</tr>
				</c:forEach>
			</table>

			<h3>${principal.nickName}님이좋아하는장르소설top 5</h3>
			<table class="table">
				<c:forEach var="genre" items="${genreList}">
					<tr>
						<td>${genre.title}</td>
					</tr>
				</c:forEach>
			</table>

		</c:if>
		<c:if test="${!empty principal }">
			<h3>${principal.nickName }님이좋아할만한작품</h3>
			<table class="table">
				<c:forEach items="${totalRecommendList }" var="novel">
					<tr>
						<td>${novel.title }</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>

		<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=BbvLPxHgxKiCdntADysv&redirect_uri=http://localhost/naver/auth&state=test"><img height="50"
			src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>


	</div>
	<script type="text/javascript">
		$(document).ready(()=>{
			$("#loginBtn").on("click", () => {
				console.log($("#usernameL").val() + "/" + $("#passwordL").val());
				let data = {
						username: $("#usernameL").val(),
						password: $("#passwordL").val()
				};
				
				$.ajax({
					type: "POST",
					url: "/api/login",
					contentType:"application/json; charset=utf-8",
					data: JSON.stringify(data),
					dataType:"json"
				}).done((response) => {
					if(response.data){
						location.reload();
					} else {
						alert(response.message);
					}
				}).fail((error) => {
					console.log(error);
					alert("요청을 처리할 수 없습니다.");
				});
			});

		});
			function logoutNaver() {
				var naverPopUp;
			      naverPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_self", "width=10, height=10, left=-9999, top=-9999, visible=0");
			      naverPopUp.blur();
			      naverPopUp.close();
			      setTimeout(function() {
			         closePopUp1();
			         location.href = "http://localhost/logout";
			      }, 40);
			}
	</script>
</body>
</html>