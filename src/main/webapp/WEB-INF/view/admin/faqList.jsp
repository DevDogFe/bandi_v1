<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
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
		<select name="categoryId">
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
			<tbody>

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
	</div>

	<script>	
	 const items = document.querySelectorAll('.question');
	
	 function openCloseAnswer(id) {
	   console.log(id);	   
	   const answerId = document.getElementById('que-' + id).id.replace('que', 'ans');
	
	   if(document.getElementById(answerId).style.display === 'block') {
	     document.getElementById(answerId).style.display = 'none';
	     document.getElementById('toggle-'+id ).innerText = 'expand_more';
	   } else {
	     document.getElementById(answerId).style.display = 'block';
	     document.getElementById('toggle-'+id).innerText = 'expand_less';
	   }
	 }
	
 </script> --%>






</body>
</html>