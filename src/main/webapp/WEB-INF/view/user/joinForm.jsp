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
		<div class="mb-3">
			<label for="username" class="form-label">아이디</label> <input type="text" class="form-control" id="username" name="username" required value="zxc">
		</div>
		<div class="mb-3">
			<label for="password" class="form-label">비밀번호</label> <input type="password" class="form-control" id="password" name="password" required value="456">
		</div>
		<div class="mb-3">
			<label for="passwordCheck" class="form-label">비밀번호 확인</label> <input type="password" class="form-control" id="passwordCheck" name="passwordCheck" required value="456">
		</div>
		<div class="mb-3">
			<label for="nickName" class="form-label">닉네임</label> <input type="text" class="form-control" id="nickName" name="nickName" required value="개">
		</div>
		<div class="mb-3">
			<label for="email" class="form-label">이메일</label> <input type="email" class="form-control" id="email" name="email" required value="dog@sample.com">
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
			<input type="hidden" name="external" value="false">
		</div>

		<button type="submit" class="btn btn-primary">가입하기</button>
	</form>

</body>
</html>