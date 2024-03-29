<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/assets/css/summernote/summernote-lite.css">
<!-- include summernote css/js -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>
	<form method="post" action="/qna/write">
		<input type="text" name="title" id="title">
		<textarea id="content" name="content" class="summernote"></textarea>
		<button type="submit">테스트</button>
	</form>

	<script type="text/javascript">
		$(document).ready(function() {
			$('.summernote').summernote({				
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
		});
	</script>
</body>
</html>