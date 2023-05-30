<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<%@include file="../layout/header.jsp"%>

<style>

/* toggle 적용 */
.answer {
	display: none;
}

.faqCategory ul {
	display: flex;
}

.faqCategory ul li {
	margin-right: 40px;
}

/**/
* {
	box-sizing: border-box;
}
</style>


<div class="container">

	<!-- 		<div class="row">
		<div class="col-lg-12">
			<div class="page-content">

						<div class="heading-section"> -->
	<div class="title--faq">
		<h4>FAQ 자주 묻는 질문</h4>
	</div>
	<div class="faqCategory">
		<ul>
			<c:forEach var="category" items="${faqCategoryList}">
				<li><a href="/faq/list/${category.id}">${category.categoryName}</a></li>
			</c:forEach>
		</ul>
	</div>

	<%-- 	<!-- 질문 & 답 내용 -->
	<c:forEach var="faq" items="${faqList}">
		<div class="faq-content">
			<button class="question" id="que-${faq.id}">
				<span>${faq.question}</span> <span id="toggle-${faq.id}" class="material-symbols-outlined"> expand_more </span>
			</button>
			<div class="answer" id="ans-${faq.id}">${faq.answer}</div>
		</div>
	</c:forEach> --%>

	<div class="faq--list">
		<!-- 질문 & 답 내용 -->
		<c:forEach var="faq" items="${faqList}">
			<dl class="faq--content">
				<dt>
					<a class="question" id="que-${faq.id}" onclick="openCloseAnswer(${faq.id})">
						<span>${faq.question}</span> <span id="toggle-${faq.id}" class="material-symbols-outlined"> expand_more </span>
					</a>
				</dt>
				<dd class="answer" id="ans-${faq.id}">${faq.answer}</dd>
			</dl>
		</c:forEach>
	</div>
	
	
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
	
 </script>


<%@include file="../layout/footer.jsp"%>