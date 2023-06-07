<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/assets/css/summernote/summernote-lite.css">
<!-- include summernote css/js -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link rel="stylesheet" href="/assets/css/cs/answerDetail.css" />

<form action="/application/write" method="post">
	<div class="apply--form mb-3 d-flex justify-content-between">
		<input type="text" name="title" class="flex-grow-1 text--box" placeholder="제목을 입력해주세요" required="required">
		<button type="submit" class="app--btn">연재신청</button>
	</div>
	<textarea id="summernote" name="content" style="height: 60vh" placeholder="내용을 입력해주세요" required="required"></textarea>
	<div class="mt-3">
		<label>연락처 </label>&nbsp;&nbsp; <input type="text" name="tel" class="text--box">
	</div>
</form>

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
	});
</script>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>