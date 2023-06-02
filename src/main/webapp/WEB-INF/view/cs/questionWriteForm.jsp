<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<link href="/assets/css/style.css" rel="stylesheet">
<%@include file="../layout/header.jsp"%> 
<script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/assets/css/summernote/summernote-lite.css">

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>


<a href="/faq/list">자주묻는질문</a>
<form action="/qna/write" method="post">
	<input type="text" name="title"> <br> <select name="faqCategoryId">
		<option value="0">카테고리</option>
		<c:forEach var="category" items="${faqCategorylist}">
			<option value="${category.id}">${category.categoryName}</option>
		</c:forEach>
	</select> <br>
	<!-- rows="50" cols="50" -->
	<textarea class="summernote" name="content" rows="50" cols="50"></textarea>
	<br>

	<!-- 		<input type="checkbox" name="isSecret">
		<label> 비밀글 : 
		<input type="text" name="password">
		</label> -->
	<br>
	<button type="submit">질문하기</button>
</form>

<script type="text/javascript">
	$('.summernote').summernote(){
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


<%@include file="../layout/footer.jsp"%>