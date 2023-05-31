<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../layout/header.jsp"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
									<p>기간설정:
    									<input type="text" name="beginCreatedAt" id="datepicker1"> ~
    									<input type="text" name="endCreatedAt" id="datepicker2">
									</p>
									<ul>
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
<script>
  $.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년'
  });

  $(function() {
    $("#datepicker1, #datepicker2").datepicker();
  });

</script>

<%@include file="../layout/footer.jsp"%>
