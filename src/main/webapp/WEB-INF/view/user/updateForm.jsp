<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
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
		</div>
		<div class="mb-3">
			<label for="email" class="form-label">이메일</label> <input type="email" class="form-control" id="email" name="email" required value="${principal.email}">
		</div>

		<button type="button" id="updateBtn" class="btn btn-primary">정보 수정</button>
	</form>
	<script type="text/javascript">
		$(document).ready(() => {
			$("#updateBtn").on("click", () =>{
				// MIME TYPE => application/json
				// js -> json 문자열로 변경하는 방법
				// object -> json 문자열로 변경
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
		});
	</script>

</body>
</html>