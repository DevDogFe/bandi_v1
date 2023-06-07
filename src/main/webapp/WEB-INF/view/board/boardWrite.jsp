<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="/assets/js/custom-slick.js"></script>
   <link rel="stylesheet" href="/assets/css/summernote/summernote-lite.css">
<!-- include summernote css/js -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
   <!-- 작성한 css는 항상 밑에 있어야함 -->
   <link rel="stylesheet" href="/assets/css/board/boardwrite.css" />
   <link rel="stylesheet" href="/assets/css/reset.css" />
   <%@include file="/WEB-INF/view/layout/header.jsp"%>
      
      <section class="top-wrap">
     		<div class="registration-form">
      				<h1>글쓰기</h1>
      				<form class="form" action="/board/write/${boardTypeId}" method="post" enctype="multipart/form-data">
      					<div class="input-box">
      						<label>제목</label>
      						<input type="text" id="title" name="title" placeholder="제목을 입력하세요." required/>
      					</div>
      					<div class="input-box">
      						<label>카테고리</label>
      						<div class="select-box">
      							<select id="categoryId" name="categoryId" class="form-select">
		      						<c:choose>
									  <c:when test="${principal.userRole == 1}">
									    <c:forEach items="${categoryList}" var="category">
									      <option value="${category.id}">${category.categoryName}</option>
									    </c:forEach>
									  </c:when>
									  <c:otherwise>
									    <c:forEach items="${categoryList}" var="category">
									      <c:if test="${category.categoryName != '공지'}">
									        <option value="${category.id}">${category.categoryName}</option>
									      </c:if>
									    </c:forEach>
									  </c:otherwise>
									</c:choose>
								</select>
      						</div>
      					</div>
      					<br>
						<textarea id="content" name="content" class="summernote"></textarea>
						<div class="btn-flex">
							<button type="submit" class="add-board">등록</button>
							<button type="submit" class="add-board" onclick="location.href='/board/list/${boardTypeId}'">취소</button>
      					</div>
      				</form>
      			</div>
      </section>
      <script type="text/javascript">
		$(document).ready(function() {
			$('.summernote').summernote({
				height : 300,
				disableResizeEditor : true
			});
		});
	</script>
      <%@include file="/WEB-INF/view/layout/footer.jsp"%>
