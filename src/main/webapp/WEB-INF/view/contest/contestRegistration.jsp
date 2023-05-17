<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../layout/header.jsp"%>
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="page-content">
				<!-- ***** Banner Start ***** -->
				<div class="row">
					<div class="main-banner">
            <div class="row d-flex justify-content-center">
              <div class="col-lg-7">
                <div class="header-text">
                  <h6>2023</h6>
                  <h4><em>지상 최대</em> 웹소설 공모전</h4>
                  <div class="main-button">
                    <a href="/contest/detail/1">상세 보기</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
					<h1 class="m-3">공모전 등록</h1>
					
					<div class="col-lg-12">
						<div class="main-profile ">
							<form action="/contest/registration" method="post">
							<div class="row">
								<div class="col-lg-6">
									<h1>이미지 등록 처리 할 부분</h1>
									<img src="/assets/images/profile.jpg" alt=""
										style="border-radius: 23px;">
								</div>
								
								<div class="col-lg-6 align-self-center">
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
										<button type="submit" class="btn btn-primary float-end m-2">등록</button>
								</div>
							</div>
							</form>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<%@include file="../layout/footer.jsp"%>
