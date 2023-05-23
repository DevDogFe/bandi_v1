<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

<style>
.answer {
	display: none;
}

.faqCategory ul{
	display: flex;
}

.faqCategory ul li{
	margin-right: 40px;
}




</style>

<%@include file="../layout/header.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="page-content">

				<div class="gaming-library">
					<div class="col-lg-12">
						<div class="heading-section">
							<h4>FAQ 자주 묻는 질문</h4>

							<div class="faqCategory">
								<ul>
									<li><a href="/faq/list/">전체</a></li>
									<c:forEach var="category" items="${faqCategoryList}">
										<li><a href="/faq/list/${category.id}">${category.categoryName}</a></li>
									</c:forEach>
								</ul>

							</div>

							<!-- 질문 & 답 내용 -->
							<c:forEach var="faq" items="${faqList}">
								<div class="faq-content">
									<button class="question" id="que-${faq.id}">
										<span>${faq.question}</span>
										<span id="toggle-${faq.id}" class="material-symbols-outlined">expand_more</span>
									</button>
									<div class="answer" id="ans-${faq.id}">${faq.answer}</div>
								</div>
							</c:forEach>


						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>	
	 const items = document.querySelectorAll('.question');
	
	 function openCloseAnswer() {
	   const answerId = this.id.replace('que', 'ans');
	
	   if(document.getElementById(answerId).style.display === 'block') {
	     document.getElementById(answerId).style.display = 'none';
	     document.getElementById('toggle-'+this.id ).textContent = 'expand_more';
	   } else {
	     document.getElementById(answerId).style.display = 'block';
	     document.getElementById('toggle-'+this.id).textContent = 'expand_less';
	   }
	 }
	
	 items.forEach(item => item.addEventListener('click', openCloseAnswer));
 </script>


<%@include file="../layout/footer.jsp"%>