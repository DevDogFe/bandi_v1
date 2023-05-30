<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<h1>회원가입</h1>
	<form action="/user" method="post">
			<input type="hidden" name="username" value="${user.username}">
			<input type="hidden" name="password" value="${user.password}">
			<input type="hidden" name="external" value="naver">
		<div class="mb-3">
			<label for="nickName" class="form-label">닉네임</label> <input type="text" class="form-control" id="nickName" name="nickName" required value="개">
			<button type="button" id="nicknameCheck" class="btn btn-secondary">닉네임 중복 확인</button>
		</div>
		<div class="mb-3">
			<label for="email" class="form-label">이메일</label> <input type="email" class="form-control" id="email" name="email" required value="dog@sample.com">
			<button type="button" id="emailCheck" class="btn btn-secondary">이메일 중복 확인</button>
		</div>
		<div class="mb-3">
			<label for="birthDate" class="form-label">생년월일</label> <input type="date" class="form-control" id="birthDate" name="birthDate" required value="1991-11-11">
		</div>
		<div class="mb-3 d-flex">
			<div>성별 &nbsp;&nbsp;&nbsp;</div>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="gender" id="female" value="여성"> <label class="form-check-label" for="female"> 여성 </label>
			</div>
			&nbsp;&nbsp;&nbsp;
			<div class="form-check">
				<input class="form-check-input" type="radio" name="gender" id="male" value="남성" checked> <label class="form-check-label" for="male"> 남성 </label>
			</div>
		</div>

		<button type="submit" class="btn btn-primary">가입하기</button>
	</form>
	<script type="text/javascript">
	$(document).ready(()=>{
		
		// 닉네임 중복확인
		$("#nicknameCheck").on("click", () => {
			$.ajax({
				type: "GET",
				url: "/api/nickname",
				data: {nickName: $("#nickName").val()}
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

</body>
</html>