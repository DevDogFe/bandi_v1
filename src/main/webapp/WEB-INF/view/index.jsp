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
.form--container{
	width: 300px;
	
}
</style>
</head>
<body>
	<h1>index</h1>
	<div class="form--container">
		
		<c:choose>
			<c:when test="${empty principal}">
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
					<a href="https://kauth.kakao.com/oauth/authorize?client_id=f2f5ec106cf03cddc10930e8d7c58d68&redirect_uri=http://localhost/auth/kakao/callback&response_type=code">카카오로 로그인</a>
				</form>
				<a href="/user">회원가입</a>
			</c:when>
			<c:otherwise>
				<h3>로그인 되었습니다.</h3>
				<button onclick="location.href='/logout'" class="btn btn-primary">로그아웃</button>
				<a href="/novel/registration">소설 등록</a>		
				<a href="/pay">작품 목록</a>		
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>