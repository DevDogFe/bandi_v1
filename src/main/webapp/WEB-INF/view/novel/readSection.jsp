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
</style>
<section>
	<article class="mb-3 p-3">
		<h1>소설 제목</h1>
		<div class="novel--header d-flex">
			<div>
				<img alt="이미지 없음" src="/assets/images/noimg.jpg">
			</div>
		</div>
		<div>
			<input type="hidden" id="sectionId" value="${section.id}"> <input type="hidden" id="novelId" value="${section.novelId}">
			<div class="section--title mb-3">${section.title}</div>
			<div id="book-body">
				<div id="book">
      				<div class="cover"><h1>시간을 달리는 소설가</h1></div>
      				<div class="cover"><h1>(주)반디</h1></div>
      				<c:forEach items="${subStringList}" var="subString" varStatus="vs">
    					<div class="data"><p>${subString}</p></div>
					</c:forEach>
    			</div>
    			<div id="controls">
      				<label for="page-number">Page:</label>
      				<input type="text" size="3" id="page-number" />
      				<span id="number-pages"></span>
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
				<button type="button" onclick="location.href='/section/read/${section.novelId}/${section.prevId}?currentPage=${replyList.currentPage}'" class="btn btn-info">${section.prevTitle}</button>
			</c:if>
			<c:if test="${section.nextTitle != '다음글이 없습니다'}">
				<button type="button" onclick="location.href='/section/read/${section.novelId}/${section.nextId}?currentPage=${replyList.currentPage}'" class="btn btn-success">${section.nextTitle}</button>
			</c:if>
		</div>
	</article>
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
				<form action="/novel/reply" method="post">
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
									<button class="delete--btn" onclick="deleteReply(${reply.id},${section.novelId}, ${section.id})">삭제</button>
								</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="col-sm-12 col-md-7">
				<div>
					<ul class="d-flex">
						<!-- Previous 시작 -->
						<li class=" <c:if test='${replyList.currentPage == 1}'>d-none</c:if>" id=""><a href="/section/read/${section.novelId}/${section.id}?currentPage=${replyList.currentPage - 1}"
							class="page-link">Previous</a></li>
						<!-- Previous 끝 -->
						<!-- Page번호 시작 -->
						<c:forEach var="pNo" begin="${replyList.startPage }" end="${replyList.endPage }" step="1">
							<li class="  <c:if test=''>active</c:if>"><a href="/section/read/${section.novelId}/${section.id}?currentPage=${pNo}" class="page-link">${pNo}</a></li>
						</c:forEach>
						<!-- Page번호 끝 -->
						<!-- Next 시작 -->
						<li class="<c:if test='${replyList.endPage == replyList.currentPage }'>d-none</c:if>" id=""><a href="/section/read/${section.novelId}/${section.id}?currentPage=${replyList.currentPage + 1}"
							class="page-link">Next</a></li>
						<!-- Next 끝 -->
					</ul>
				</div>
			</div>
		</div>
	</article>
</section>
<script type="text/javascript">
	
	function deleteReply(replyId,novelId,sectionId) {
		$.ajax({
			type: "DELETE",
			url: "/api/reply/" + replyId
		}).done((response) => {
			location.href='/section/read/'+novelId+'/'+ sectionId;
		}).fail((error) => {
			console.log(error);
			alert("요청을 처리할 수 없습니다.");
		});
	}
	
	$(document).ready(() => {
		// 별점 등록
		$("#starBtn").on("click", () => {
			console.log('111111111');
			const stars = $("input[name = reviewStar]");
			console.log(stars);
			let score;
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
						location.href='/section/read/' + $("#novelId").val()+ '/' + $("#sectionId").val();
					}).fail((error) => {
						console.log(error);
						alert("요청을 처리할 수 없습니다.");
					});
				}
			}
			
		})
		
	});
	</script>
	<script type="text/javascript">
	
      // Sample using dynamic pages with turn.js
      var numberOfPages = '${numberOfPages+2}'
      let pageCount = '${subStringArray.size()}';  
      let subStringArray = '${subStringArray}';
        
      // Adds the pages that the book will need
      function addPage(page, book,startPage) {
        // 	First check if the page is already in the book
        if (!book.turn('hasPage', page)) {
          // Create an element for this page
          var element = $('<div />', {
            class: 'page ' + (page % 2 == 0 ? 'odd' : 'even'),
            id: 'page-' + page,
          }).html('<i class="loader"></i>');
          // If not then add the page
          book.turn('addPage', element, page);
          // Let's assum that the data is comming from the server and the request takes 1s.

          setTimeout(function () {
            element.html('<div class="data"><p></p></div>');
          }, 1000);
        }
      }

      $(window).ready(function () {
        $('#book').turn({
          acceleration: true,
          pages: numberOfPages,
          elevation: 50,
          gradients: !$.isTouch,
          when: {
            turning: function (e, page, view) {
              // Gets the range of pages that the book needs right now
              var range = $(this).turn('range', page)

              // Check if each page is within the book
              for (page = range[0]; page <= range[1]; page++)
                addPage(page, $(this))
            },

            turned: function (e, page) {
              $('#page-number').val(page)
            },
          },
        })

        $('#number-pages').html(numberOfPages)

        $('#page-number').keydown(function (e) {
          if (e.keyCode == 13) $('#book').turn('page', $('#page-number').val())
        })
      })

      $(window).bind('keydown', function (e) {
        if (e.target && e.target.tagName.toLowerCase() != 'input')
          if (e.keyCode == 37) $('#book').turn('previous')
          else if (e.keyCode == 39) $('#book').turn('next')
      })
    </script>
    
<%@include file="../layout/footer.jsp"%>


