<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/list.css" />
<link rel="stylesheet" href="/assets/css/readSection.css" />
<link rel="stylesheet" href="/assets/css/board/boardDetail.css" />
<section class="one-tab-list">
	<div class="section-title-wrap">
		<h2 class="section-title">${boardDetail.boardName}게시판</h2>
	</div>
	<div class="board-detail">
		<h3 class="board-title">
			<span>${boardDetail.title}</span>
		</h3>
	</div>
	<span class="board-detail-wrap"> <span class="board-info-wrap"> <span class="profile-info-wrap"> <span class="profile-preview-wrap"></span> <span class="info-inner"> <span
					class="name">${boardDetail.username}</span> <span class="date">${boardDetail.createdAt()}</span> <span class="date">${boardDetail.categoryName}</span>
			</span> <span class=“btn-right-wrap”> <span class=“modify-wrap”> <c:choose>
							<c:when test="${principal.id == boardDetail.userId }">
								<button type="submit" class="btn-delete" onclick="location.href='/board/delete/${boardDetail.id}'">삭제</button>
								<button class="btn-report" id="report-btn" onclick="location.href='/board/update/${boardDetail.id}'">수정</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="	btn-modify" onclick="popup()">신고</button>
							</c:otherwise>
						</c:choose> <c:if test="${principal != null }">
							<c:choose>
								<c:when test="${isLike}">
									<button type="button" id="unlike" class="heart">
										<img src="/assets/images/like_icon/like.png"> 공감
									</button>
								</c:when>
								<c:otherwise>
									<button type="button" id="like" class="heart">
										<img src="/assets/images/like_icon/unlike.png"> 공감
									</button>
								</c:otherwise>
							</c:choose>
						</c:if> <c:if test="${principal == null }">
							<button type="button" id="noUser" class="heart">
								<img src="/assets/images/like_icon/unlike.png"> 공감
							</button>
						</c:if>
				</span> <span class="list-wrap">
						<button type="submit" class="btn-list" onclick="location.href='/board/list'">목록</button>
				</span>
			</span>
		</span> <span class="board-contents"> <span id="_board-contents"> ${boardDetail.content} </span>
		</span>
	</span>
	</span>

</section>
<section>
	<div class="reply">
		<div>
			<div class="comments-content">
				<!-- 댓글 등록 -->
				<div class="bg-light comment-form">
					<div class="comment-header ms-1">
						<h5 class="me-2">댓글</h5>
					</div>
					<c:choose>
						<c:when test="${empty principal.id}">
							<div class="d-flex flex-row align-items-start">
								<textarea class="form-control ml-1 shadow-none textarea" id="content" name="content" placeholder="댓글을 등록하려면 로그인해야합니다." readonly="readonly"></textarea>
							</div>
							<div class="mt-2 text-right float-end">
								<button class="btn btn-primary btn-sm shadow-none" type="submit">등록</button>
							</div>
						</c:when>
						<c:otherwise>
							<form action="/board/reply" method="post">
								<div class="d-flex flex-row align-items-start">
									<input type="hidden" id="boardId" name="boardId" value="${boardDetail.id}">
									<textarea class="form-control ml-1 shadow-none textarea" id="content" name="content" placeholder="비방이나 부적절한 표현은 삼가해주시길 바랍니다."></textarea>
								</div>
								<div class="mt-2 text-right float-end">
									<button class="btn btn-primary btn-sm shadow-none" type="submit">등록</button>
									<button class="btn btn-outline-danger btn-sm ml-1 shadow-none" type="button">삭제</button>
								</div>
							</form>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="comment-top">
					<div></div>
				</div>
				<!-- 등록된 댓글 -->
				<c:if test="${not empty replyList.content}">
					<c:forEach var="reply" items="${replyList.content}">
						<div class="comment-item">
							<div class="col-md-12">
								<div class="bg-white p-2">
									<div class="d-flex flex-row user-info">
										<div class="d-flex flex-column justify-content-start ml-2">
											<span class="d-block font-weight-bold name">${reply.username}</span> <span class="date text-black-50">${reply.createdAt()}</span>
										</div>
									</div>
								</div>
								<div class="mt-2">
									<p class="comment-text">${reply.content}</p>
								</div>
							</div>
							<div class="bg-white">
								<div class="d-flex flex-row justify-content-end fs-12">
									<div class="like p-2 cursor">
										<span class="ml-1"><button class="btn btn-outline-danger btn-sm ml-1 shadow-none" onclick="deleteReply(${reply.id})">삭제</button></span>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
</section>
<section>
	<nav class="paging " aria-label="Page navigation example">
		<div></div>
		<div>
			<ul class="pagination">
				<li class="<c:if test='${replyList.currentPage == 1}'>d-none</c:if>" id=""><a href="/board/detail/${boardDetail.id}?currentPage=${replyList.currentPage - 1}" class="page-link">Previous</a></li>
				<c:forEach var="pNo" begin="${replyList.startPage}" end="${replyList.endPage}" step="1">
					<li <c:if test="${pNo == replyList.currentPage}">class="active"</c:if>><a href="/board/detail/${boardDetail.id}?currentPage=${pNo}" class="page-link">${pNo}</a></li>
				</c:forEach>
				<li class="<c:if test='${replyList.endPage == replyList.currentPage }'>d-none</c:if>" id=""><a href="/board/detail/${boardDetail.id}?currentPage=${replyList.currentPage + 1}"
					class="page-link">Next</a></li>
			</ul>
		</div>
	</nav>
</section>
<script type="text/javascript" src="/assets/js/board/boardDetail.js"></script>

<%@include file="/WEB-INF/view/layout/footer.jsp"%>
