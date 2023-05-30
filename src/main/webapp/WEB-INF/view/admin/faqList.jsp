<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
/* .answer {
	display: none;
} */
</style>
<body>
	<h4>FAQ (관리자페이지)</h4>
	<div class="faqCategory">
		<!--<form action="" method="get">  TODO 카테고리 조회-->
		<select id="category" name="categoryId">
			<option value="0">전체</option>
			<c:forEach var="category" items="${faqCategoryList}">
				<option value="${category.id}">${category.categoryName}</option>
			</c:forEach>
		</select>
		<!-- </form> -->
	</div>

	<div>
		<a href="/admin/faq"><button>글쓰기</button></a>
	</div>

	<!-- 질문 & 답 내용 -->
	<div class="faq--list">



		<table>
			<thead>
				<tr>
					<th>질문</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody id="faqListBody">

				<c:forEach var="faq" items="${faqList}">
					<tr>
						<td>${faq.question}</td>
						<td><a href="/admin/faq/update/${faq.id}"><button>수정</button></a></td>
						<td><a href="/admin/faq/delete/${faq.id}"><button>삭제</button></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>

	<!-- 질문 ------------------------------ -->
	<%-- 
	<div class="faq--list">
		<!-- 질문 & 답 내용 -->
		<c:forEach var="faq" items="${faqList}">
			<dl class="faq--content">
				<dt>
					<a class="question" id="que-${faq.id}" onclick="openCloseAnswer(${faq.id})"> <span>${faq.question}</span> <span id="toggle-${faq.id}" class="material-symbols-outlined"> expand_more </span>
					</a>
				</dt>
				<dd class="answer" id="ans-${faq.id}">${faq.answer}</dd>
			</dl>
		</c:forEach>
	</div>--%>




	<script>
		$(document).ready(()=>{
			$("#category").on("change", () => {				
				
				$.ajax({
					type: "GET",
					url: "/api/faq/" + $(this).val(),
				}).done((response) => {
					$(".faq-table").remove();
					
					let faqList;
					
					for(i=0; i < response.length; i++){
						
						faqList += 					
						`<tr class="faq-table">
						<td>\${response[i].question}</td>
						<td><a href="/admin/faq/update/\${response[i].id}"><button>수정</button></a></td>
						<td><a href="/admin/faq/delete/\${response[i].id}"><button>삭제</button></a></td>
						</tr>`
					}
					$("#faqListBody").append(faqList);
					
	
				}).fail((error) => {
					console.log(error);
					alert("요청을 처리할 수 없습니다.");
				});
			});
		});
	</script>






</body>
</html>