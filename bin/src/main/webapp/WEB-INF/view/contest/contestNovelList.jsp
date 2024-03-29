<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../layout/header.jsp"%>
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">
          <!-- ***** Banner Start ***** -->
          <div class="main-banner">
            <div class="row d-flex justify-content-center">
              <div class="col-lg-7">
                <div class="header-text">
                  <h6>2023</h6>
                  <h4>${contestList[0].title}</h4>
                  <div class="main-button">
                    <a href="/contest/detail/1">상세 보기</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="gaming-library">
            <div class="col-lg-12">
              <div class="heading-section">
                <h4><em class="text-decoration-none">작품</em> 리스트</h4>
              </div>
              <c:forEach var="contestNovel" items="${contestNovelList}" >
              	<div class="item" onclick="location.href ='/contest/novel/detail/${contestNovel.id}'">
                	<ul>
                  		<li><h4>${contestNovel.title}</h4></li>
                  		<li><h4>${contestNovel.username}</h4></li>
                  		<li><h4>${contestNovel.genreName}</h4></li>
                  		<li><h4>${contestNovel.contestName}</h4></li>
                	</ul>
              	</div>
              </c:forEach>
          	</div>
          </div>
      </div>
    </div>
  </div>
  </div>
  
  <!-- Modal -->
			<c:forEach var="contest" items="${contestList}" varStatus="vs">
				<div class="modal fade" id="Modal${vs.index+1}" tabindex="-1"
					aria-labelledby="ModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<form action="/contest/update" method="post">
							<div class="modal-body text-break">
								<div class="row">
								<div class=" align-self-center">
									<ul>
										<li>
											<label for="title" class="form-label">시작일</label> 
											<input type="text" id="title" name="beginCreatedAt" class="form-control"
											required="required" value="">
										</li>
										<li>
											<label for="title" class="form-label">종료일</label> 
											<input type="text" id="title" name="endCreatedAt" class="form-control"
											required="required" value="">
										</li>
										<li>
											<label for="title" class="form-label">제목</label> 
											<input type="text" id="title" name="title" class="form-control"
											required="required" value="">
										</li>
										<li>
											<label for="overview" class="form-label">내용</label>
											<textarea id="overview" name="content" class="form-control" required="required" 
											rows="10"> </textarea>
										</li>
									</ul>
								</div>
							</div>
							</div>
							<div class="modal-footer">
								<input type="hidden" name="id" value="${contest.id}">
								<button type="submit" class="btn btn-primary m-1">수정</button>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
							</div>
							</form>
						</div>
					</div>
				</div>
			</c:forEach>
  
  
<%@include file="../layout/footer.jsp"%>
