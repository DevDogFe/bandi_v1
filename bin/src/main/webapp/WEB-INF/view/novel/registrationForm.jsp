<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script src="/vendor/jquery/jquery.min.js"></script>
</head>
<body>
	<script>
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
				$("#contestId").val($("#contestOptionId"+contestOptionId).val());
			});
		})
		
	</script>
	<section>
		<article>
			<h1>작품 등록</h1>
			<form action="/novel/registration" method="post">
				<div class="form-group">
					<label for="title" class="form-label">제목</label> <input type="text" id="title" name="title" class="form-control" required="required" value="단종이 너무너무강함">
				</div>
				<div class="form-group">
					<label for="genreId" class="form-label">장르</label> <select id="genreId" name="genreId" class="form-select">
						<c:forEach items="${genreList}" var="genre">
							<option value="${genre.id}">${genre.name }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="serviceTypeId" class="form-label">서비스타입</label> 
					<select id="serviceTypeId" name="serviceTypeId" class="form-select">
						<c:forEach items="${serviceTypeList}" var="serviceType">
							<c:choose>
								<c:when test="${serviceType.name == '공모전'}">
									<option id="selectContest" value="${serviceType.id}">${serviceType.name }</option>
								</c:when>
								<c:otherwise>
									<option value="${serviceType.id}">${serviceType.name }</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</div>
				<div id="addContestForm" >
					<label for="contestFormId" class="form-label">공모전</label> 
					<select id="contestFormId" name="contestFomrId" class="form-select">
						<c:forEach items="${contestList}" var="contest" varStatus="vs">
							<option id="contestOptionId${vs.index+1}" value="${contest.id}">${contest.title}</option>
						</c:forEach>
					</select>
					<input id="contestId" name="contestId" type="hidden" value="0">
				</div>
				<div class="form-group">
					<label for="overview" class="form-label">작품소개</label>
					<textarea id="overview" name="overview" class="form-control" required="required" rows="3">단종이 너무 강해서 막을 수 없음</textarea>
				</div>
				<div class="form-group">
					<label for="serialCycle" class="form-label">연재 요일</label> 
					<select id="serialCycle" name="serialCycle" class="form-select">
						<option value="월">월</option>
						<option value="화">화</option>
						<option value="수">수</option>
						<option value="목">목</option>
						<option value="금">금</option>
						<option value="토">토</option>
						<option value="일">일</option>
					</select>
				</div>
				<button type="submit" class="btn btn-primary">등록</button>

			</form>
		</article>
	</section>
</body>
</html>