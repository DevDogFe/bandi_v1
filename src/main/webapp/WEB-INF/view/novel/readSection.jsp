<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../layout/header.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link href="/assets/css/book.css" rel="stylesheet">
<script src="/assets/js/turn.min.js"></script>
<style type="text/css">
.list--link {
	text-decoration: none;
	color: #black;
}

.list--link:visited {
	color: #333;
}

ul {
	list-style: none;
}

#starScore fieldset {
	display: inline-block;
	direction: rtl;
	border: 0;
}

#starScore fieldset legend {
	text-align: right;
}

#starScore input[type=radio] {
	display: none;
}

#starScore label {
	font-size: 3em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}

#starScore label:hover {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#starScore label:hover ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#starScore input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#reviewContents {
	width: 100%;
	height: 150px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 1.5px #D3D3D3;
	border-radius: 5px;
	font-size: 16px;
	resize: none;
}


.close-fullscreen {
	display: none
}
</style>
<section>
	<article class="mb-3 p-3">
		<h1>소설 제목</h1>
		<div class="novel--header d-flex">
			<div>
				<img alt="이미지 없음" src="/assets/images/noimg.jpg">
			</div>
		</div>
			<input type="hidden" id="sectionId" value="${section.id}"> <input type="hidden" id="novelId" value="${section.novelId}">
			<div class="section--title mb-3">${section.title}</div>
			
			<div id="book-body">
			<div>
				<button type="button" class="btn btn-outline-secondary fullscreen" onclick="openFullScreenMode()">확대</button>
				<button type="button" class="btn btn-outline-secondary close-fullscreen" onclick="closeFullScreenMode()">축소</button>
			</div>
				<%-- 
    			<div id="controls">
      				<label for="page-number">Page:</label>
      				<input type="text" size="3" id="page-number" />
      				<span id="number-pages">${numberOfPages+2}</span>
      				<button type="button" class="btn btn-outline-secondary fullscreen" onclick="openFullScreenMode()">확대</button>
					<button type="button" class="btn btn-outline-secondary close-fullscreen" onclick="closeFullScreenMode()">축소</button>
    			</div> --%>
    		<div class="wrapper">
  			<div class="aspect">
    			<div class="aspect-inner">
      				<div id="flipbook" class="flipbook" >
      					<div class="page"><h1>${section.title}</h1></div>
      					<div class="page"><h1>(주)반디</h1></div>
      					<c:forEach items="${subStringList}" var="subString" varStatus="vs">
    						<div class="page"><p>${subString}</p></div>
						</c:forEach>
      				</div>
    			</div>
  			</div>
			</div>
			</div>
		
		<div>
			<a href="/novel/detail/${section.novelId }">목록</a>
			<form class="mb-3" name="starScore" id="starScore" method="post">
				<fieldset>
					<button type="button" class="btn btn-primary" id="starBtn">별점 등록</button>
					<span class="text-bold">별점을 선택해주세요</span> <input type="radio" name="reviewStar" value="5" id="rate1"><label for="rate1">★</label> <input type="radio" name="reviewStar" value="4"
						id="rate2"><label for="rate2">★</label> <input type="radio" name="reviewStar" value="3" id="rate3"><label for="rate3">★</label> <input type="radio" name="reviewStar" value="2"
						id="rate4"><label for="rate4">★</label> <input type="radio" name="reviewStar" value="1" id="rate5"><label for="rate5">★</label>
				</fieldset>
			</form>
		</div>
		<div>
			<c:if test="${section.prevTitle != '이전글이 없습니다'}">
				<button type="button" onclick="location.href='/section/read/${section.novelId}/${section.prevId}?currentPage=${replyList.currentPage}&serviceTypeId=${serviceTypeId}'" class="btn btn-info">${section.prevTitle}</button>
			</c:if>
			<c:if test="${section.nextTitle != '다음글이 없습니다'}">
				<button type="button" onclick="location.href='/section/read/${section.novelId}/${section.nextId}?currentPage=${replyList.currentPage}&serviceTypeId=${serviceTypeId}'" class="btn btn-success">${section.nextTitle}</button>
			</c:if>
		</div>
	</article>

	<!--효린 recommend-- TODO css 적용>
<%-- 	<article>
		<div class="">
			<ul>
				<c:forEach var="favorite" items="${favoriteList}">
					<li>${favorite.title}-${favorite.author}</li>
				</c:forEach>
			</ul>

		</div>
	</article> --%>
	<!-- 	-->
	<article>
		<c:choose>
			<c:when test="${empty principal.id }">
				<div class="mb-3 ps-3">
					<label for="content" class="form-label">댓글 등록</label>
					<textarea class="form-control" id="content" name="content" rows="3" placeholder="댓글을 등록하려면 로그인해야합니다." readonly="readonly"></textarea>
					<input type="hidden" name="sectionId" value="${section.id}">
				</div>
				<div class="mb-3 ps-3">
					<button type="button" class="btn btn-secondary">등록</button>
				</div>
			</c:when>
			<c:otherwise>
				<form action="/novel/reply?serviceTypeId=${serviceTypeId}" method="post">
					<div class="mb-3 ps-3">
						<label for="content" class="form-label">댓글 등록</label>
						<textarea class="form-control" id="content" name="content" rows="3" placeholder="작가나 작품에 대한 비방이나 부적절한 표현은 삼가해주시길 바랍니다."></textarea>
						<input type="hidden" name="sectionId" value="${section.id}"> <input type="hidden" name="novelId" value="${section.novelId}">
					</div>
					<div class="mb-3 ps-3">
						<button type="submit" class="btn btn-secondary">등록</button>
					</div>
				</form>
			</c:otherwise>
		</c:choose>
		<div class="ps-3">
			<table class="table">
				<thead>
					<tr>
						<th>닉네임</th>
						<th>내용</th>
						<th>작성 시간</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${!empty replyList.content }"></c:if>
					<c:forEach items="${replyList.content }" var="reply">
						<tr>
							<td>${reply.username }</td>
							<td>${reply.content }</td>
							<td>${reply.createdAt() }</td>
							<td><c:if test="${principal.id == reply.userId }">
									<button class="delete--btn" onclick="deleteReply(${reply.id},${section.novelId}, ${section.id}, ${ serviceTypeId})">삭제</button>
								</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="col-sm-12 col-md-7">
				<div>
					<ul class="d-flex">
						<!-- Previous 시작 -->
						<li class=" <c:if test='${replyList.currentPage == 1}'>d-none</c:if>" id=""><a href="/section/read/${section.novelId}/${section.id}?currentPage=${replyList.currentPage - 1}&serviceTypeId=${serviceTypeId}"
							class="page-link">Previous</a></li>
						<!-- Previous 끝 -->
						<!-- Page번호 시작 -->
						<c:forEach var="pNo" begin="${replyList.startPage }" end="${replyList.endPage }" step="1">
							<li class="  <c:if test=''>active</c:if>"><a href="/section/read/${section.novelId}/${section.id}?currentPage=${pNo}&serviceTypeId=${serviceTypeId}" class="page-link">${pNo}</a></li>
						</c:forEach>
						<!-- Page번호 끝 -->
						<!-- Next 시작 -->
						<li class="<c:if test='${replyList.endPage == replyList.currentPage }'>d-none</c:if>" id=""><a href="/section/read/${section.novelId}/${section.id}?currentPage=${replyList.currentPage + 1}&serviceTypeId=${serviceTypeId}"
							class="page-link">Next</a></li>
						<!-- Next 끝 -->
					</ul>
				</div>
			</div>
		</div>
	</article>
</section>
<script type="text/javascript">
	var numberOfPages = '${numberOfPages+2}';
    let pageCount = '${subStringArray.size()}';  
    let subStringArray = '${subStringArray}';
    
    //let mode = "small";
    let prevMode = "";
    let mode = "middle";
    
    var flipbookEL = document.getElementById('flipbook');
    var doc = document.getElementById("book-body");

    window.addEventListener('resize', function (e) {
    	flipbookEL.style.width = '';
      	flipbookEL.style.height = '';
      	
      	// 책 크기에 따른 폰트 크기 수정
      	if($(window).width()<1080){
      		mode = "small";
      		//$("p").css('font-size','5px');
      		console.log(mode);
      	}else if($(window).width()>=1080&&$(flipbookEL).width()<1600){
      		mode = "middle";
      		//$("p").css('font-size','20px');
      		console.log(mode);
      	}else{
      		mode = "big";
      		$("p").css('font-size','30px');
      		console.log(mode);
      	}
      	
      	//화면 크기에따른 책 사이즈 변경
      	$(flipbookEL).turn('size', flipbookEL.clientWidth, flipbookEL.clientHeight);
    });
    
    // 책넘길때 폰트 초기화
    $("#flipbook").bind("turning", function(event, page, view) {
  	  	
  	  	if(mode=="middle"){
  	  		$("p").css('font-size','20px');
  	  	}else if(mode=='small'){
  	  		$("p").css('font-size','5px');
  	  	}else{
  	  		$("p").css('font-size','30px');
  	  	}
  	});

    $(flipbookEL).turn({
    	width: flipbookEL.clientWidth,
		height: flipbookEL.clientHeight,
        autoCenter: false
    });
    
    
    $('#page-number').keydown(function (e) {
        if (e.keyCode == 13){
        	$('#flipbook').turn('page', $('#page-number').val());
        } 
      });

    $(window).bind('keydown', function (e) {
      if (e.target && e.target.tagName.toLowerCase() != 'input') {
    	  if (e.keyCode == 37) {
    		  $('#flipbook').turn('previous');
    	  } else if (e.keyCode == 39) {
    		  $('#flipbook').turn('next');  
    	  }
      }
    });
    
	
  	//전체화면 설정
    function openFullScreenMode() {
  		pervMode = mode;
  		mode = "big";
  		
		if (doc.requestFullscreen){
			doc.requestFullscreen();
		}
		else if (doc.webkitRequestFullscreen){ // Chrome, Safari (webkit)
			doc.webkitRequestFullscreen();
		}
		else if (doc.mozRequestFullScreen){ // Firefox
			doc.mozRequestFullScreen();
		}
		else if (doc.msRequestFullscreen){ // IE or Edge
			doc.msRequestFullscreen();
		}
		
		window.addEventListener('resize', function (e) {
	    	flipbookEL.style.width = '';
	      	flipbookEL.style.height = '';
	      	$(flipbookEL).turn('size', (flipbookEL.clientWidth*0.9), (flipbookEL.clientHeight*0.8));
	      	$(flipbookEL).css('margin-top','3%');
	      	$("p").css('font-size','30px');
			$(".fullscreen").hide();
			$(".close-fullscreen").show();
	    });
		 
	}
	//전체화면 해제
	function closeFullScreenMode() {
		mode = "middle";
		
		if (document.exitFullscreen){
			document.exitFullscreen();
		}
		else if(document.webkitExitFullscreen){ // Chrome, Safari (webkit)
			document.webkitExitFullscreen();
		} 
		else if (document.mozCancelFullScreen){ // Firefox
			document.mozCancelFullScreen();
		}
		else if (document.msExitFullscreen){ // IE or Edge
			document.msExitFullscreen();
		}
		
		window.addEventListener('resize', function (e) {
	    	flipbookEL.style.width = '';
	      	flipbookEL.style.height = '';
	      	$(flipbookEL).turn('size', flipbookEL.clientWidth, flipbookEL.clientHeight);
	      	$("p").css('font-size','20px');
	      	$(flipbookEL).css('margin-top','0%');
	      	$(".close-fullscreen").hide();
			$(".fullscreen").show();
	    });
	}

	// 댓글 삭제
function deleteReply(replyId, novelId, sectionId, serviceTypeId) {
	$.ajax({
		type: "DELETE",
		url: "/api/reply/" + replyId
	}).done((response) => {
		location.href='/section/read/'+novelId+'/'+ sectionId + '?serviceTypeId=' + serviceTypeId;
	}).fail((error) => {
		console.log(error);
		alert("요청을 처리할 수 없습니다.");
	});
}


$(document).ready(function() {
	
	// 별점 등록
	$("#starBtn").on("click", () => {
		const stars = $("input[name = reviewStar]");
		for (let i = 0; i < stars.length; i++){
			if(stars[i].checked){
				score = stars[i].value;
				let data = {
						sectionId: $("#sectionId").val(),
						score: score
				};
				
				$.ajax({
					type: "POST",
					url: "/api/score",
					contentType:"application/json; charset=utf-8",
					data: JSON.stringify(data),
					dataType:"json"
				}).done((response) => {
					location.href='/section/read/' + $("#novelId").val()+ '/' + $("#sectionId").val()+'?serviceTypeId='+'${serviceTypeId}';
				}).fail((error) => {
					console.log(error);
					alert("요청을 처리할 수 없습니다.");
				});
			}
		}
		
	});

		 
	
	// end of ready 
});
	</script>
    
<%@include file="../layout/footer.jsp"%>


