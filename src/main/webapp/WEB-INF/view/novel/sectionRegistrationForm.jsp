<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../layout/header.jsp"%>

	<section>
		<article>
			<h1>회차 등록</h1>
			<form action="/section/registration" method="post">
				<input type="hidden" name="novelId" value="${novelId}">
				<div class="form-group">
					<label for="title" class="form-label">회차 제목</label> <input type="text" id="title" name="title" class="form-control" required="required" value="2화 세조의 수련">
				</div>
				<div class="form-group">
					<label for="listPrice" class="form-label">가격 등록</label> 
					<select id="listPrice" name="listPrice" class="form-select">
						<option value="0">무료</option>
						<option value="100" selected="selected">100</option>
						<option value="200">200</option>
					</select>
				</div>
				<div class="form-group">
					<label for="content" class="form-label">내용</label>
					<textarea id="content" name="content" class="form-control" required="required" rows="20"> 단종의 강함을 따라잡기 위해 세조가 수련을 시작하다.</textarea>
				</div>
				<button type="submit" class="btn btn-primary">등록</button>

			</form>
		</article>
	</section>
<%@include file="../layout/footer.jsp"%>
	