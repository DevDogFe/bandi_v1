<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../layout/header.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<section>
	<h1>정보 수정</h1>
	<form action="/user" method="post">
		<c:choose>
			<c:when test="${principal.external }">
				<input type="hidden" class="form-control" id="beforePassword" name="beforePassword" required value="111111">
				<input type="hidden" class="form-control" id="password" name="password" required value="111111">
				<input type="hidden" class="form-control" id="passwordCheck" name="passwordCheck" minlength="3" required value="111111">
			</c:when>
			<c:otherwise>
				<div class="mb-3">
					<label for="beforePassword" class="form-label">비밀번호</label> <input type="password" class="form-control" id="beforePassword" name="beforePassword" required value="123">
				</div>
				<div class="mb-3">
					<label for="password" class="form-label">새 비밀번호</label> <input type="password" class="form-control" id="password" name="password" required value="456">
				</div>
				<div class="mb-3">
					<label for="passwordCheck" class="form-label">비밀번호 확인</label> <input type="password" class="form-control" id="passwordCheck" name="passwordCheck" minlength="3" required value="456">
				</div>
			</c:otherwise>
		</c:choose>
		<div class="mb-3">
			<label for="nickName" class="form-label">닉네임</label> <input type="text" class="form-control" id="nickName" name="nickName" required value="${principal.nickName}">
			<button type="button" id="nicknameCheck" class="btn btn-secondary">닉네임 중복 확인</button>
		</div>
		<div class="mb-3">
			<label for="email" class="form-label">이메일</label> <input type="email" class="form-control" id="email" name="email" required value="${principal.email}">
			<button type="button" id="emailCheck" class="btn btn-secondary">이메일 중복 확인</button>
		</div>

		<button type="button" id="updateBtn" class="btn btn-primary">정보 수정</button>
	</form>
	<script type="text/javascript">
		$(document).ready(() => {
			// 패스워드 패스워드 확인 맞는지 확인
			$("#updateBtn").on("click", () =>{
				if($("#password").val() == $("#passwordCheck").val()){
					let data = {
							beforePassword: $("#beforePassword").val(),
							password: $("#password").val(),
							passwordCheck: $("#passwordCheck").val(),
							nickName: $("#nickName").val(),
							email: $("#email").val()
							};
					console.log(JSON.stringify(data));
					
					$.ajax({
						type: "PUT",
						url: "/update",
						contentType:"application/json; charset=utf-8",
						data: JSON.stringify(data),
						dataType:"json"
					}).done((response) => {
						console.log(response);
						console.log(typeof response);
						alert("성공");
						location.href='/index';
					}).fail((error) => {
						console.log(error);
						alert("서버오류");
					});
				} else {
					alert("비밀번호와 비밀번호확인의 값이 일치해야합니다.")
				}
			});
			// 닉네임 중복확인
			$("#nickname").on("keyup", () => {
				$.ajax({
					type: "GET",
					url: "/api/nickname",
					data: {nickName: $("#nickName").val()}
				}).done(response) => {
					if(response.data){
						alert('이미 사용중인 아이디입니다.');
					} else{
						alert('사용 가능한 아이디입니다.');
					}
				}).fail((error) => {
					console.log(error);
					alert("요청을 처리할 수 없습니다.");
				});
			});
			// 이메일 중복 확인
			$("#emailCheck").on("click", () => {
				$.ajax({
					type: "GET",
					url: "/api/email",
					data: {email: $("#email").val()}
				}).done((response) => {
					if(response){
						alert('이미 사용중인 아이디입니다.');
					} else{
						alert('사용 가능한 아이디입니다.');
					}
				}).fail((error) => {
					console.log(error);
					alert("요청을 처리할 수 없습니다.");
				});
			});
		});
	</script>
</section>
<%@include file="../layout/footer.jsp"%>
