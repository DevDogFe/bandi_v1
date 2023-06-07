<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<link rel="stylesheet" href="/assets/css/list.css" />
<section class="top-banner">
	<div class="big-testimonial-content">
		<div class="bigSlider">
			<div>
				<p class="big-banner">
					<img src="/assets/images/main/topSlider.png">
				</p>
			</div>
			<div>
				<p class="big-banner">
					<img src="/assets/images/main/topSlider2.png">
				</p>
			</div>
			<div>
				<p class="big-banner">
					<img src="/assets/images/main/topSlider.png">
				</p>
			</div>
			<div>
				<p class="big-banner">
					<img src="/assets/images/main/topSlider2.png">
				</p>
			</div>
		</div>
	</div>
	<div class="mini-banners">
		<div class="contest-mini-banner">
			<a href="/payment/charge"><img src="/assets/images/main/gold-charge.png"></a>
		</div>
		<div class="contest-mini-banner">
			<img src="/assets/images/main/author-banner.png">
		</div>
		<div class="contest-mini-banner">
			<img src="/assets/images/main/contest-banner3.png">
		</div>
	</div>
</section>
<section class="top-wrap">
	<div class="top-wrap-content">
		<div class="top-wrap-nav">
			<div class="d-flex novel-type">
				<h1>공모전</h1>
				<c:if test="${principal.userRole == 1}">
					<a href="/contest/registration" class="board-type-item d-flex align-items-center ms-3"><span class="blue-span">작성하기</span></a>
				</c:if>
			</div>
		</div>
	</div>
</section>
<section class="one-tab-list">
	<ul class="board-list">
		<c:forEach var="contest" items="${contestList}" varStatus="vs">
			<li>
				<div class="border-list-item">
					<a href="/contest/novel/list?contestId=${contest.id}">
						<div class="border-list-content">
							<div class="board-list-title">${contest.title}</div>
							<div class="board-list-desc">
								<span class="blue-span list-desc-span">${contest.nickName}</span> <span class="list-desc-span">${contest.beginCreatedAt()} ~ ${contest.endCreatedAt()}</span>
							</div>
						</div>
					</a>
					<div class="border-list-buttons">
						<div>
							<button type="button" class="btn btn-primary m-1" data-bs-toggle="modal" data-bs-target="#Modal${vs.index+1}">보기</button>
						</div>
						<c:if test="${principal.userRole == 1}">
							<div>
								<button onclick="location.href='/contest/delete/${contest.id}'" type="button" class="btn btn-danger m-1">삭제</button>
							</div>
						</c:if>
					</div>
				</div>
			</li>
		</c:forEach>
	</ul>
</section>
<!-- Modal -->
<c:forEach var="contest" items="${contestList}" varStatus="vs">
	<div class="modal fade" id="Modal${vs.index+1}" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="/contest/update" method="post">
					<div class="modal-body text-break">
						<div class="row">
							<c:choose>
								<c:when test="${principal.userRole == 1}">
									<div class=" align-self-center">
										<ul>
											<li><label for="title" class="form-label">시작일</label> <input type="text" id="title" name="beginCreatedAt" class="form-control" required="required" value="${contest.beginCreatedAt}">
											</li>
											<li><label for="title" class="form-label">종료일</label> <input type="text" id="title" name="endCreatedAt" class="form-control" required="required" value="${contest.endCreatedAt}">
											</li>
											<li><label for="title" class="form-label">제목</label> <input type="text" id="title" name="title" class="form-control" required="required" value="${contest.title}"></li>
											<li><label for="overview" class="form-label">모집 요강</label> <textarea id="overview" name="content" class="form-control" required="required" rows="10">${contest.content}</textarea></li>
										</ul>
									</div>
								</c:when>
								<c:otherwise>
									<div class=" align-self-center">
										<ul>
											<li><label for="title" class="form-label">시작일</label> <input type="text" id="title" name="beginCreatedAt" class="form-control " required="required" value="${contest.beginCreatedAt}"
												readonly></li>
											<li><label for="title" class="form-label">종료일</label> <input type="text" id="title" name="endCreatedAt" class="form-control" required="required" value="${contest.endCreatedAt}"
												readonly></li>
											<li><label for="title" class="form-label">제목</label> <input type="text" id="title" name="title" class="form-control" required="required" value="${contest.title}" readonly></li>
											<li><label for="overview" class="form-label">모집 요강</label> <textarea id="overview" name="content" class="form-control" required="required" rows="10" readonly>${contest.content}</textarea>
											</li>
										</ul>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="modal-footer">
						<c:if test="${principal.userRole == 1}">
							<input type="hidden" name="userId" value="${contest.userId}">
							<input type="hidden" name="id" value="${contest.id}">
							<button type="submit" class="btn btn-primary m-1">수정</button>
						</c:if>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</c:forEach>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>
