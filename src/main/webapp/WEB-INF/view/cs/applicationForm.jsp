<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/application/write" method="post"  enctype="multipart/form-data">
		<input type="text" name="title"> <br>
		<textarea id="mytextarea" name="content" style="height: 60vh" placeholder="내용을 입력해주세요."></textarea>
		<!-- 파일업로드 -->
 		<div class="custom-file">
			<input type="file" class="custom-file-input" id="customFile"
				name="file" accept=".jpg, .jpeg, .png, .hwp">
				<label class="custom-file-label" for="customFile"></label>
		</div> 
		
		
		<br> <label> 연락처</label> <input type="text" name="tel">
		<button type="submit">연재신청</button>
	</form>
	<!--<a href="#">임시저장</a>  -->

</body>
</html>