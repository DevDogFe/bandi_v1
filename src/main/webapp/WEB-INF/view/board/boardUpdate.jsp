<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<script src="/assets/js/custom-slick.js"></script>
<link rel="stylesheet" href="/assets/css/summernote/summernote-lite.css">
<!-- include summernote css/js -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- 작성한 css는 항상 밑에 있어야함 -->
<link rel="stylesheet" href="/assets/css/board/boardwrite.css" />
<link rel="stylesheet" href="/assets/css/reset.css" />

			<section class="top-wrap">
				<div class="registration-form">
					<h1>수정</h1>
					<form class="form" action="/board/updateProc/${boardDetail.id}" method="post" enctype="multipart/form-data">
						<input type="hidden" name="boardId" value="${boardDetail.id }">
						<div class="input-box">
							<label>제목</label> <input type="text" id="title" name="title" value="${boardDetail.title}" required />
						</div>
						<div class="input-box">
							<label>카테고리</label>
							<div class="select-box">
								<select name="categoryId" id="categoryId" class="form-select">
									<c:forEach items="${categoryList }" var="category">
										<option value="${category.id }" <c:if test="${category.id == boardDetail.categoryId}">selected</c:if>>${category.categoryName }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<br>
						<textarea id="content" name="content" class="summernote" required="required">${boardDetail.content}</textarea>
						<div class="btn-flex">
							<button type="submit" class="add-board">수정</button>
							<button type="submit" class="add-board" onclick="location.href='/board/detail/${boardDetail.id}'">취소</button>
						</div>
					</form>
				</div>
			</section>
		<script type="text/javascript">
		function deleteFile(id) {
			$.ajax({
				type : "DELETE",
				url : "/api/deletefile/" + id,
			}).done(function(response) {
				location.href = '/board/update/' + ${boardDetail.id}
			}).fail(function(error) {
				alert("요청 실패");
			});
		}
	</script>
	<script type="text/javascript" src="/assets/js/board/boardSummernote.js"></script>
	<%@include file="/WEB-INF/view/layout/footer.jsp"%>
