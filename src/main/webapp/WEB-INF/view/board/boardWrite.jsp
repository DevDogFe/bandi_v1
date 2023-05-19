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
<!-- 	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('#boardTypeSelect')
									.on(
											'change',
											function() {
												//[1  3]
												//
												//document.querySelect('select');
												//console.log(document.getElementsByClassName('form-select')[4].style.display ='none'	);
												console
														.log(document
																.getElementsByClassName('form-select'));
												var boardType = document
														.getElementById('boardTypeSelect');
												var value = (boardType.options[boardType.selectedIndex].value);
												if (value == 0) {
													document
															.getElementsByClassName('form-select')[1].style.display = 'none';
													document
															.getElementsByClassName('form-select')[2].style.display = 'none';
													document
															.getElementsByClassName('form-select')[3].style.display = 'none';
													document
															.getElementsByClassName('form-select')[4].style.display = 'none';
												}
												if (value == 1) {
													document
															.getElementsByClassName('form-select')[1].style.display = 'block';
													document
															.getElementsByClassName('form-select')[2].style.display = 'none';
													document
															.getElementsByClassName('form-select')[3].style.display = 'none';
													document
															.getElementsByClassName('form-select')[4].style.display = 'none';
												}
												if (value == 2) {
													document
															.getElementsByClassName('form-select')[2].style.display = 'block';
													document
															.getElementsByClassName('form-select')[1].style.display = 'none';
													document
															.getElementsByClassName('form-select')[3].style.display = 'none';
													document
															.getElementsByClassName('form-select')[4].style.display = 'none';
												}
												if (value == 3) {
													document
															.getElementsByClassName('form-select')[3].style.display = 'block';
													document
															.getElementsByClassName('form-select')[1].style.display = 'none';
													document
															.getElementsByClassName('form-select')[2].style.display = 'none';
													document
															.getElementsByClassName('form-select')[4].style.display = 'none';
												}
												if (value == 4) {
													document
															.getElementsByClassName('form-select')[4].style.display = 'block';
													document
															.getElementsByClassName('form-select')[1].style.display = 'none';
													document
															.getElementsByClassName('form-select')[2].style.display = 'none';
													document
															.getElementsByClassName('form-select')[3].style.display = 'none';
												}
											});
						});
	</script> -->

	<h1>글쓰기</h1>
	<form action="/board/write/${boardTypeId}" method="post">
		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">제목</label> <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요.">
		</div>
		<input type="hidden" name="boardTypeId" value="${boardTypeId }">
		<select class="form-select" name="categoryId">
			<c:forEach items="${categoryList }" var="category">
				<option value="${category.id }">${category.categoryName }</option>
			</c:forEach>
		</select>
		<br>
		<div class="mb-3">
			<label for="exampleFormControlTextarea1" class="form-label">내용</label>
			<textarea class="form-control" id="exampleFormControlTextarea1" rows="10" placeholder="내용을 입력하세요." name="content"></textarea>
		</div>
		<button type="submit" class="btn btn-primary">등록</button>
	</form>
</body>
</html>