<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script> -->
<link href="/assets/css/style.css" rel="stylesheet">	
<%@include file="../layout/header.jsp"%>
<script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/static/assets/css/summernote/summernote-lite.css">


	<a href="/faq/list">자주묻는질문</a>
	<form action="/qna/write" method="post">
		<input type="text" name="title">
		<br>
		<select name="faqCategoryId">
			<option value="0">카테고리</option>
			<c:forEach var="category" items="${faqCategorylist}">
				<option value="${category.id}">${category.categoryName}</option>
			</c:forEach>
		</select> <br>
		 <!-- rows="50" cols="50" -->
		<textarea id="summernote" name="editordata" name="content"></textarea>
		<br>
		
		<input type="checkbox" name="isSecret">
		<label> 비밀글 : 
		<input type="text" name="password">
		</label>
		<br>
		<button type="submit">질문하기</button>
	</form>
	
	<script type="text/javascript">
	$(document).ready(() => {
		
		$("#summernote").summernote();
/* 			height: 300, // editor
			minHeight: null,
			maxHeight: null,
			focus: true,
			lang: "ko-KR" */
			/* placeholder: '' */
		/* }); */
	});
	</script>


<%@include file="../layout/footer.jsp"%>