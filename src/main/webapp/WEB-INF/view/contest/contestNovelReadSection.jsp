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
.list--link {
	text-decoration: none;
	color: #black;
}

.list--link:visited {
	color: #333;
}
</style>
</head>
<body>
	<section>
		<article>
			<h1>소설 제목</h1>
			<div class="novel--header d-flex">
				<div>
					<img alt="이미지 없음" src="/assets/images/noimg.jpg">
				</div>
				<div>
					<table>
						<tr>
							<td>제목</td>
							<td>${detail.title}</td>
						</tr>
						<tr>
							<td>장르</td>
							<td>${detail.genreName}</td>
							<td>작가</td>
							<td>${detail.username}</td>
						</tr>
						<tr>
							<td>작품 등록일</td>
							<td>${detail.createdAt()}</td>
						</tr>
						<tr>
							<td>즐겨찾기</td>
							<td>12</td>
						</tr>
					</table>
				</div>
			</div>
			<div>
				<div class="section--title">
					${section.title}
				</div>
				<div class="section--content">
					${section.content}
				</div>
			</div>
		</article>
	</section>
</body>
</html>