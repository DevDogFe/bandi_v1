<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Modal -->
<c:if test="${novelRecord != null}">
	<div class="modal" id="lastNovelRecord" tabindex="-1" >
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">마지막으로 본 소설</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>${novelRecord.title}</p>
				</div>
				<div class="modal-footer">
				<c:if test="${section.prevTitle != '이전글이 없습니다'}">
					<button type="button" class="btn btn-primary">${section.prevTitle}</button>
				</c:if>
				<c:if test="${section.prevTitle != '다음글이 없습니다'}">
					<button type="button" class="btn btn-primary">${section.nextTitle}</button>
				</c:if>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</c:if>
