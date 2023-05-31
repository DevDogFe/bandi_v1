<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<%@include file="../layout/header.jsp"%>

<style>
/* toggle 적용 TODO 색 변경 */ 
.answer {
	display: none;
	box-sizing: content-box;
	/* background-color: #f5f6f7; */
}

* {
	box-sizing: border-box;
}

body {
	height: 100%;
	min-height: 100%;
}

.category--cs{
	  display: flex;
  align-items: center;
}

.category--cs ul {
	border: 1px solid black;
	margin: 0 10px;
}

.category--cs ul li {
	display: inline-block;
	border: 1px solid black;
	padding: 0 20px;
}

.category--cs ul li a{
	font-size: 20px;
}

.category--faq ul {
	display: flex;
	flex-wrap: wrap;
	text-align: center;
	margin: 0;
}

.category--faq ul li{
	width: 25%;
	border: 1px solid black;
	margin: 0px;
	padding: 10px 0px;	
}

.category--faq ul li :hover{
	/* background-color: ; */
}

.container--faq--title {
	border: 1px solid black;
	display: flex;
}

.container--faq {
	width: 100%;
	border: 1px solid black;
	padding: 40px 50px 0;
	margin: 50px 50px;
}

.title--faq {
	border: 1px solid black;
}

.title--faq h3 {
	font-size: 40px;
	padding: 10px;
}

.category--faq {
	border: 1px solid black;
	
}

.faq--list {
	border: 1px solid black;
}

.faq--list dt {
	padding: 10px;
}

.faq--list dt {
	border: 1px solid black;
	height: 48px;
	font-weight: bold;
	display: flex;
}

.faq--list dd {
	border: 1px solid black;
	height: 48px;
	margin-bottom: 0;
	padding: 10px;
}

.question {
	display: flex;
}


.category--line {
	justify-content: space-between;
}
</style>
<section>

	<div class="container--faq">
		<div class="container--faq--title">
			<div class="title--faq">
				<h3>고객 센터</h3>
			</div>
			<div class="category--cs">
				<ul>
					<li>Q&A</li>
					<li>FAQ</li>
					<li>공지</li>
					<li>제휴문의</li>
				</ul>
			</div>
		</div>

		<div class="category--faq">
			<ul>
				<li><a href="/faq/list">전체</a></li>
				<c:forEach var="category" items="${faqCategoryList}">
					<li><a href="/faq/list/${category.id}">${category.categoryName}</a></li>
				</c:forEach>
			</ul>
		</div>



		<div class="faq--list">
			<!-- 질문 & 답 내용 -->
			<dl class="faq--content">
				<c:forEach var="faq" items="${faqList}">
					<dt class="category--line" onclick="openCloseAnswer(${faq.id})">
						<span>${faq.question}</span><a class="question" id="que-${faq.id}">
						<span id="toggle-${faq.id}" class="material-symbols-outlined">expand_more </span>
						</a>
					</dt>
					<!-- 답 -->
					<dd class="answer" id="ans-${faq.id}"><p><span>[${faq.categoryName}]</span>&nbsp;${faq.answer}</p></dd>
				</c:forEach>
			</dl>
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
	</div>
</section>





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