<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/list.css" />
<link rel="stylesheet" href="/assets/css/board/boardList.css" />
			<section>
				<div class="search-list-form">
					<form action="/board/list/${boardTypeId}" method="get">
						<div class="search-list">
							<select name="categoryId" id="categoryId" class="selectbox">
								<option value="">전체</option>
								<c:forEach items="${categoryList }" var="category">
									<option value="${category.id }">${category.categoryName }</option>
								</c:forEach>
							</select> <select name="type" class="selectbox">
								<option value="title">제목</option>
								<option value="content">내용</option>
							</select>
							<div class="search">
								<input type="text" name="keyword"> <label class="searchlabel">Name</label> <span class="search-span"></span>
							</div>
							<button type="submit" id="button-search">검색</button>
						</div>
					</form>
				</div>
			</section>
			<section class="top-wrap">
				<div class="top-wrap-content">
					<div class="top-wrap-nav">
						<div class="novel-type">
							<h1>게시판</h1>
						</div>
						<div class="board-type">
							<c:forEach items="${boardTypeList }" var="type">
								<a class="board-type-item" onclick="location.href='/board/list/${type.id}'"><span>${type.boardName}</span></a>
							</c:forEach>
						</div>
					</div>
				</div>
			</section>
			<section class="one-tab-list">
				<ul class="board-list">
				    <li>
				        <c:forEach var="list" items="${boardList.content}">
				            <c:choose>
				                <c:when test="${list.categoryName eq '공지'}">
				                    <a href="/board/detail/${list.id}">
				                        <div class="border-list-group" style="border: 1px solid #7986cb;">
				                            <div class="board-list-title"><span class="material-symbols-outlined">campaign</span> ${list.title}</div>
				                            <div class="board-list-desc">
				                                <span class="blue-span list-desc-span">${list.username}</span> 
				                                <span class="list-desc-span">${list.createdAt()}</span> 
				                                <span class="list-desc-span">${list.views}</span> 
				                                <span class="list-desc-span">${list.categoryName}</span>
				                            </div>
				                        </div>
				                    </a>
				                </c:when>
				                <c:otherwise>
				                    <a href="/board/detail/${list.id}">
				                        <div class="border-list-group">
				                            <div class="board-list-title">${list.title}</div>
				                            <div class="board-list-desc">
				                                <span class="blue-span list-desc-span">${list.username}</span> 
				                                <span class="list-desc-span">${list.createdAt()}</span> 
				                                <span class="list-desc-span">${list.views}</span> 
				                                <span class="list-desc-span">${list.categoryName}</span>
				                            </div>
				                        </div>
				                    </a>
				                </c:otherwise>
				            </c:choose>
				        </c:forEach>
				    </li>
				</ul>
			</section>
			<section>
				<nav class="paging " aria-label="Page navigation example">
					<div></div>
					<div>
						<c:choose>
							<c:when test="${empty categoryId }">
								<ul class="pagination">
									<li class="<c:if test='${boardList.currentPage == 1}'>d-none</c:if>" id=""><a href="/board/list/${boardTypeId}?currentPage=${boardList.currentPage - 1}" class="page-link">Previous</a></li>
									<c:forEach var="pNo" begin="${boardList.startPage}" end="${boardList.endPage}" step="1">
										<li <c:if test="${pNo == boardList.currentPage}">class="active"</c:if>><a href="/board/list/${boardTypeId}?currentPage=${pNo}" class="page-link">${pNo}</a></li>
									</c:forEach>
									<li class="<c:if test='${boardList.endPage == boardList.currentPage }'>d-none</c:if>" id=""><a href="/board/list/${boardTypeId}?currentPage=${boardList.currentPage + 1}"
										class="page-link">Next</a></li>
								</ul>
							</c:when>
							<c:otherwise>
								<ul class="pagination">
									<li class="<c:if test='${boardList.currentPage == 1}'>d-none</c:if>" id=""><a
										href="/board/list/${boardTypeId}?categoryId=${categoryId }&currentPage=${boardList.currentPage - 1}&type=title&keyword=" class="page-link">Previous</a></li>
									<c:forEach var="pNo" begin="${boardList.startPage}" end="${boardList.endPage}" step="1">
										<li <c:if test="${pNo == boardList.currentPage}">class="active"</c:if>><a href="/board/list/${boardTypeId}?categoryId=${categoryId }&currentPage=${pNo}&type=title&keyword="
											class="page-link">${pNo}</a></li>
									</c:forEach>
									<li class="<c:if test='${boardList.endPage == boardList.currentPage }'>d-none</c:if>" id=""><a
										href="/board/list/${boardTypeId}?categoryId=${categoryId }&currentPage=${boardList.currentPage + 1}&type=title&keyword=" class="page-link">Next</a></li>

								</ul>
							</c:otherwise>
						</c:choose>
					</div>
					<div>
						<c:if test="${principal != null}">
							<button class="btn btn-primary me-1" onclick="location.href='/board/write/${boardTypeId}'">글 작성</button>
						</c:if>
						<c:if test="${principal == null}">
							<button class="btn btn-primary me-1" type="button" id="no-User">글 작성</button>
						</c:if>
					</div>
				</nav>
			</section>
			<script type="text/javascript">
			$("#no-User").on("click", ()=>{
				alert('로그인이 필요한 기능입니다.');
			});
			</script>
		<%@include file="/WEB-INF/view/layout/footer.jsp"%>
		