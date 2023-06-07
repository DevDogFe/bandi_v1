<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>
<!-- 작성한 css는 항상 밑에 있어야함 -->
<link href="/assets/css/book.css" rel="stylesheet">
<script src="/assets/js/turn.min.js"></script>
<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/registration.css" />
      	<div class="main-layout">
      		<section class="main-form">
      			<div class="registration-form">
      				<h1>공모전 등록</h1>
      				<form action="/contest/registration" class="form" method="post">
      					<div class="input-box">
      						<label>제목</label>
      						<input type="text" id="title" name="title" placeholder="Enter full name" required/>
      					</div>
      					<div class="input-box">
      						<label>기간설정</label>
      						<div class="date-form-contents">
      							<input type="date" class="form-control date-form" id="contestDate" name="beginCreatedAt" required>
      							<div><p>~</p></div>
      							<input type="date" class="form-control date-form" id="contestDate" name="endCreatedAt" required>
      						</div>
      					</div>
      					<div class="input-box">
      						<label>모집 요강</label>
      						<textarea id="content" name="content" class="form-control" required="required" rows="10"></textarea>
      					</div>
      					<button class="submit-button" type="submit">등록</button>
      				</form>
      			</div>
      		</section>
      		<aside class="right-sidebar">
      			<div class="right-sidebar-contents">
						<div class="my-info">
							<div class="username">${principal.nickName} 님</div>
							<div class="info-category">
								<span><img src="/assets/images/main/user-line.png">내정보</span> <span><img src="/assets/images/main/thumb-up-line.png">알림</span> <span><img
									src="/assets/images/main/star-line.png">구매목록</span>
							</div>
							<div class="gold-info">
								<div>보유골드</div>
								<span class="blue-span">${gold}</span>
							</div>
							<div class="right-box">
								<div class="right-box-cover">
									<c:choose>
										<c:when test="${lastNovel.cover != null }">
											<a><img alt="이미지 기간만료" src="/bandi/uploads/${lastNovel.cover}"></a>
										</c:when>
										<c:otherwise>
											<img alt="이미지 없음" src="/assets/images/noimg.jpg">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="right-box-detail">
									<div class="right-detail-desc">
										<div class="desc-title">${lastNovel.title}</div>
										<c:choose>
											<c:when test="${lastNovel.serviceTypeId != 3}">
												<a href="/section/read/${lastNovel.novelId}/${lastNovel.sectionId}/${lastNovel.serviceTypeId}"><div class="desc-title">바로가기</div></a>
											</c:when>
											<c:otherwise>
												<a href="/contest/novel/read/${lastNovel.novelId}/${lastNovel.sectionId}"><div class="desc-title">바로가기</div></a>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</div>
						<div class="right-banner">
							<a href="/payment/charge"><img src="/assets/images/main/gold-charge.png"></a>
						</div>
						<div class="right-banner">
							<a href="/main"><img src="/assets/images/main/author-banner.png"></a>
						</div>
						<div class="recommend-list">
							<h3 class="recommend-header">
								<a>${genreList.get(0).genreName } 추천작</a>
							</h3>
							<ul>
								<c:forEach items="${genreList }" var="novel">
									<li><a class="recommend-item">
											<div class="recommend-img">
												<c:choose>
													<c:when test="${novel.cover != null }">
														<img alt="이미지 기간만료" src="/bandi/uploads/${novel.cover }">
													</c:when>
													<c:otherwise>
														<img alt="이미지 없음" src="/assets/images/noimg.jpg">
													</c:otherwise>
												</c:choose>
											</div>
											<div class="recommend-desc">
												<span>${novel.genreName} </span> <span class="bold-font">${novel.title}</span> <span>${novel.nickName}</span>
											</div>
									</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
      		</aside>
      	</div>
<script type="text/javascript">
$(document).ready(function(){
	$("#addContestForm").css('display','none');
	$("#serviceTypeId").on("change", function () {
		if($(this).val() == 3){
			$("#addContestForm").show();
			// 서비스 타입 공모전 선택 시 contestId에 기본값 설정
			$("#contestId").val($("#contestOptionId1").val());
		}else{
			$("#addContestForm").hide();
			$("#contestId").val(0);
		}
    });
	
	$("#contestFormId").on("change",function(){
		
		let contestOptionId = $("#contestFormId").val();
		// input값 변경으로 공모전 id post 하기
		$("#contestId").val($("#contestOptionId" + contestOptionId).val());
	});
})
</script>     
 <%@include file="/WEB-INF/view/layout/footer.jsp"%>
 
