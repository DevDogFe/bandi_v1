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
			<div class="novel--header">
				<div>
					<img alt="/assets/images/noimg.jpg" src="이미지 없음">
				</div>
				<div>
					<table>
						<tr>
							<td>제목</td>
							<td>단종이 너무 강함</td>
						</tr>
						<tr>
							<td>장르</td>
							<td>대체 역사</td>
							<td>작가</td>
							<td>단종</td>
						</tr>
						<tr>
							<td>작품 등록일</td>
							<td>2023.05.12</td>
						</tr>
						<tr>
							<td>즐겨찾기</td>
							<td>12</td>
						</tr>
					</table>
				</div>
			</div>

			<c:choose>
				<c:when test="${empty sectionList}">
					<h3>아직 글이 없습니다.</h3>
				</c:when>
				<c:otherwise>
					<table class="table">
						<thead>
							<tr class="table-secondary">
								<td>제목</td>
								<td>등록일</td>
								<td>조회수</td>
								<td>평점</td>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<c:forEach items="${sectionList}" var="section">
						<tr>
							<td><a href="#" class="list--link">${section.title}</a></td>
							<td>${section.createdAt}</td>
							<td>${section.views}</td>
							<td>${section.score}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</article>
	</section>
</body>
</html>