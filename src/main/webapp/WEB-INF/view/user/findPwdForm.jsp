<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="/assets/css/user/find.css" rel="stylesheet">
</head>
<body>
	<header></header>
	<section>
		<div class="mt-5">
			<h3>아이디 찾기</h3>
			<form action="/findId" method="get" class="form d-flex flex-column">
				<label class="mb-2">이메일</label> <input class="mb-3" type="text" name="email" placeholder="이메일입력하세요" value="khl4459@naver.com" required="required">
				<button type="submit">아이디 찾기</button>
			</form>
		</div>
		<div class="mt-5 find--password--container">
			<h3 class="mt-3">비밀번호 찾기</h3>
			<form action="/findPwd" method="post" class="form d-flex flex-column">
				<label class="mb-2">아이디</label> <input class="mb-3" type="text" name="username" placeholder="이름" required="required"> <label class="mb-2">이메일</label> <input type="text" name="email" placeholder="이메일입력하세요" required="required">
				<button type="submit">새 비밀번호 발급</button>
			</form>
		</div>
	</section>
</body>
</html>