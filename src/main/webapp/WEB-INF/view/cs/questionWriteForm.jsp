<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!DOCTYPE html>

<html>
<style>
.qna--header--form {
	display: flex;
}

.qna--title {
	height: 40px;
	width: 400px;
	margin-top: 20px;
	border-radius: 5px;
}

.qna--category {
	height: 40px;
	border-radius: 5px;
}

.qna--button {
	flex: 3;
	display: flex;
	justify-content: flex-end;
	margin-top: 10px;
	height: 50px;
}

.qna--button a {
	font-style: none;
}

.qna--button button {
	
}
</style>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>반디</title>
<script src="/assets/js/jquery.min.js"></script>

<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/assets/css/summernote/summernote-lite.css">
<!-- include summernote css/js -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link href="/assets/css/style.css" rel="stylesheet">

</head>
<body>
	<div class="container">
		<div class="inner">
			<header>
				<div class="banner">
					<div class="lnb">
						<a href="#none"><em>for</em> member</a> <a href="#none">로그인</a> <a href="#none">회원가입</a>
					</div>
				</div>
				<nav>
					<div class="logo">
						<a href="#none"><img src="/assets/images/main/bandi-logo3.png"></a>
					</div>
					<ul class="gnb">
						<li><a href="#none">HOME</a></li>
						<li><a href="#none">소설</a></li>
						<li><a href="#none">공모전</a></li>
						<li class="dropdown"><a href="#none" class="dropbtn">게시판</a></li>
						<li><a href="#none">고객지원</a></li>
						<li><a href="#none">마이페이지</a></li>
					</ul>
				</nav>
			</header>
			<%-- <%@include file="../layout/header.jsp"%> --%>

			<form action="/qna/write" method="post">
				<div class="qna--header--form">

					<div class="qna--title-form">
						<input type="text" class="qna--title" name="title" placeholder="  제목을 입력해주세요"> <select name="faqCategoryId" class="qna--category">
							<option value="0">카테고리</option>
							<c:forEach var="category" items="${faqCategorylist}">
								<option value="${category.id}">${category.categoryName}</option>
							</c:forEach>
						</select>
					</div>

					<div class="qna--button">
						<button class="btn btn-outline-primary">
							<a href="/faq/list">자주묻는질문</a>
						</button>
						<button type="submit" class="btn btn-outline-primary">등록</button>
					</div>

				</div>

				<textarea id="summernote" class="summernote" name="content"></textarea>
			</form>
			<!-- 비밀글 -->
			<!-- <input type="checkbox" name="isSecret"> <input type="text" name="password"> -->

			<script type="text/javascript">
				$('#summernote').summernote({
					placeholder : "내용을 입력 해주세요",
					tabsize : 2,
					height : 500,
					// 에디터 로딩후 포커스를 맞출지 여부
					focus : true,
					lang : 'ko-KR',
					// 크기 조절 기능 삭제
					disableResizeEditor : true,
					callbacks : {
						onInit : function(c) {
							c.editable.html('');
						}
					}
				});
			</script>
</body>
</html>

