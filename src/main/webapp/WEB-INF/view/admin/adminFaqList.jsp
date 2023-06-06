<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>반디</title>
<script src="/assets/js/jquery.min.js"></script>


<!-- jquery-3.5.1이 위에 있어야 작동 -->
<!-- Slick.js -->

<!-- Slider.js no CDN -->
<!-- <script src="js/slick/slick.min.js"></script>
    <link rel="stylesheet" href="js/slick/slick.css">
    <link rel="stylesheet" href="js/slick/slick-theme.css"> -->

<!-- bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<!-- Slider.js CDN -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="/assets/js/custom-slick.js"></script>
<!-- 작성한 css는 항상 밑에 있어야함 -->
<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/admin/admin.css" />
<link rel="stylesheet" href="/assets/css/admin/adminCategory.css" />
</head>
<style>
.admin--faq--container {
	margin-top: 20px;
	margin-left: 10px;
}

.faq--btn--list {
	display: flex;
	justify-content: flex-end;
}

.faq--btn--list button,
.faq--table button {	
	background-color: #546E7A;
	border: none;
	border-radius: 3px;
	width: 60px;
	height: 35px; 
	color: #fff;	
}

.faq--btn--list button{
	margin-left: 10px;
}

.table {
	text-align: center;
	width: 920px;
	max-width: 920px;
	min-width: 920px;
}

.faq--page {
	justify-content: center;
}

checkbox {
	margin: auto;
}

 #check--id,
#check--All{
	width: 30px;
} 

.table td{
	overflow:hidden;
	white-space:nowrap;
	text-overflow:ellipsis;
	max-width: 368px;	
}

.page-link{
	color: #546E7A;
}



</style>
<body>
	<div class="container">
		<div class="inner">
			<header>
				<div class="banner">
					<div class="lnb">
						<a href="#none"><em>for</em> admin</a> <a href="#none">로그인</a> <a href="#none">회원가입</a>
					</div>
				</div>
				<nav>
					<div class="logo">
						<a href="#none"><img src="/assets/images/main/bandi-logo3.png"></a>
					</div>
					<ul class="gnb">
						<li><a href="#none">HOME</a></li>
						<li><a href="#none">소설</a></li>
						<li><a href="#none">공모전</a></li>
						<li class="dropdown"><a href="#none" class="dropbtn">게시판</a></li>
						<li><a href="#none">고객지원</a></li>
						<li><a href="#none">마이페이지</a></li>
					</ul>
				</nav>
			</header>
		</div>
		<div class="sectind-flex">
			<section>
				<div class="sidebar">
					<div class="logo_content">
						<div class="logo">
							<i class='bx bx-leaf'></i>
							<div class="logo_name">반디</div>
						</div>
					</div>
					<ul class="nav_list">
						<li><a href="/admin/dashboard"> <i class='bx bx-chalkboard'></i> <span class="links_name">대시보드</span>
						</a></li>
						<li><a href="/report/reportList"> <i class='bx bxs-bell-minus'></i> <span class="links_name">신고 게시물 처리</span>
						</a></li>
						<li><a href="/admin/adminCategory"> <i class='bx bx-bookmark-alt-plus'></i> <span class="links_name">카테고리 관리</span>
						</a></li>
						<li><a href="/admin/novelChange"> <i class='bx bx-book-reader'></i> <span class="links_name">소설 타입 변경</span>
						</a></li>
						<li><a href="/admin/genre"> <i class='bx bx-book-add'></i> <span class="links_name">장르 관리</span>
						</a></li>
						<li><a href="/admin/user"> <i class='bx bx-user'></i> <span class="links_name">사용자 변경</span>
						</a></li>
						<li><a href="/admin/faqList"> <i class='bx bx-conversation'></i> <span class="links_name">자주 묻는 질문</span>
						</a></li>
						<li><a href="/admin/qnaList"> <i class='bx bx-message-square-dots'></i> <span class="links_name">Q&A</span>
						</a></li>
						<li><a href="/admin/applicationList"> <i class='bx bx-message-square-dots'></i> <span class="links_name">연재 문의</span>
						</a></li>
					</ul>
				</div>
			</section>

			<!-- FAQ List -->
			<section>
				<div class="admin--faq--container">
					
						<div class="faq--btn--list">
							<select id="category" name="categoryId">
								<option value="0">전체</option>
								<c:forEach var="category" items="${faqCategoryList}">
									<option value="${category.id}">${category.categoryName}</option>
								</c:forEach>
							</select>					
							<button id="delete--btn">삭제</button>
							<a href="/admin/faq"><button>글쓰기</button></a>
						</div>
						
						<table class="table">
						<colgroup>
							<col style="width: 10%;">
							<col style="width: 40%;">
							<col style="width: 40%;">
							<col style="width: 10%;">
						</colgroup>					
						<thead>
							<tr>
								<th><input type="checkbox" id="check--All" ></th>
								<th>질문</th>
								<th>답변</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody id="faqListBody">

							<c:forEach var="faq" items="${faqPageUtil.content}">
								<tr class="faq--table">
									<td class="faq--table"><input type="checkbox" id="check--id" name="check--id" value="${faq.id}"></td>
									<td class="faq--table">${faq.question}</td>
									<td class="faq--table">${faq.answer}</td>
									<td class="faq--table"><a href="/admin/faq/update/${faq.id}"><button>수정</button></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="faq--page mt-2">
						<div>
							<ul class="faq--page d-flex">
								<li class="<c:if test='${faqPageUtil.currentPage == 1}'>d-none</c:if>"><a href="/admin/faqList?currentPage=${faqPageUtil.currentPage - 1}" class="page-link">Previous</a></li>
								<c:forEach var="pNo" begin="${faqPageUtil.startPage}" end="${faqPageUtil.endPage}" step="1">
									<li <c:if test="${pNo == faqPageUtil.currentPage}">class="active"</c:if>><a href="/admin/faqList?currentPage=${pNo}" class="page-link">${pNo}</a></li>
								</c:forEach>
								<li class="<c:if test='${faqPageUtil.endPage == faqPageUtil.currentPage }'>d-none</c:if>"><a href="/admin/faqList?currentPage=${faqPageUtil.currentPage + 1}" class="page-link">Next</a></li>
							</ul>
						</div>
					</div>	
				</div>
			</section>
		</div>
	</div>
	<footer>
		<div class="inner">
			<div class="footer-top">
				<ul>
					<li>(주)반디</li>
					<li><a href="#none">이용약관</a></li>
					<li><a href="#none">개인정보 처리방침</a></li>
					<li><a href="#none">청소년 보호 정책</a></li>
					<li><a href="#none">회사 소개</a></li>
				</ul>
			</div>
			<div class="footer-content">
				<ul class="community">
					<!-- 제목 줄은 a없이-->
					<li>게시판</li>
					<li><a href="#none">Subscribe</a></li>
					<li><a href="#none">Give A Gift</a></li>
					<li><a href="#none">Customer Service FAQ</a></li>
					<li><a href="#none">Access Your Subscription</a></li>
				</ul>
				<ul class="network">
					<li>Network</li>
					<li><a href="#none">Privacy Policy</a></li>
					<li><a href="#none">Terms Of Service</a></li>
					<li><a href="#none">Advertise</a></li>
					<li><a href="#none">Jobs</a></li>
				</ul>
				<ul class="help">
					<li>Help Preserve This Project</li>
					<li>We may earn a commission if you purchase an item featured on our site.</li>
					<li>Copyright © 2020 CodingWorks. All rights reserved.</li>
				</ul>
			</div>
		</div>
		<script>
	    $(document).ready(() => {
	        $("#category").on("change", () => {

	            $.ajax({
	                type: "GET",
	                url: "/api/faq/" + $("#category").val(),
	            }).done((response) => {
	                $(".faq--table").remove();
	                let faqList;

	                for (i = 0; i < response.length; i++) {

	                    faqList +=
	                        `<tr class="faq--table">
	                    <td style="width: 100px;"><input type="checkbox" id="check--id" name="check--id" value="\${response[i].id}" ></td>
	                    <td class="faq--table">\${response[i].question}</td>
	                    <td class="faq--table">\${response[i].answer}</td>                    
	                    <td class="faq--table"><a href="/admin/faq/update/\${response[i].id}"><button>수정</button></a></td>
	                    </tr>`;
	                }
	                $("#faqListBody").append(faqList);

	            }).fail((error) => {
	                console.log(error);
	                alert("요청을 처리할 수 없습니다.");
	            });
	        });

	        $("#delete--btn").on("click", () => {

	            let checkedList = [];

	            $("input[name=check--id]:checked").each(function () {
	                checkedList.push($(this).val());
	            });
	            console.log(checkedList);

	            $.ajax({
	                type: "DELETE",
	                url: "/api/faq/" + checkedList
	            }).done((response) => {
	                location.href = "/admin/faqList";

	            }).fail((error) => {
	                console.log(error);
	                alert("삭제할 글을 선택해주세요");
	            });
	        });


	        /* function checkAll(){
	             if($("#check--All").is("checked")){
	               $("input[name=check--id]").prop("checked", true);
	               }else{
	               $("input[name=check--id]").prop("checked", false);					
	               }				
	         } */
	    });
			
		</script>
	</footer>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>