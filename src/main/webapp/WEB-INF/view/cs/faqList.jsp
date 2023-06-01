<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<%@include file="../layout/header.jsp"%>
<%@include file="layout/csCategory.jsp"%>

<style>
/* toggle 적용 TODO 색 변경 */
.faq--answer {
	display: none;
	box-sizing: content-box;
	/* background-color: #f5f6f7; */
}

.faq--category ul {
	display: flex;
	flex-wrap: wrap;
	text-align: center;
	margin: 0;
}

.faq--category ul li {
	width: 25%;
	border: 1px solid black;
	margin: 0px;
	padding: 10px 0px;
}

.faq--category ul li :hover {
	/* background-color: ; */	
}

.faq--category {
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

.faq--question {
	display: flex;
}

.category--line {
	justify-content: space-between;
}

.faq--page {
	display: flex;
	justify-content: center;
}
</style>

<div class="faq--category">
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
		<c:forEach var="faq" items="${faqPageUtil.content}">
			<dt class="category--line" onclick="openCloseAnswer(${faq.id})">
				<span>[${faq.categoryName}]&nbsp;${faq.question}</span><a class="faq--question" id="que-${faq.id}"> <span id="toggle-${faq.id}" class="material-symbols-outlined">expand_more </span>
				</a>
			</dt>
			<!-- 답 -->
			<dd class="faq--answer" id="ans-${faq.id}">
				<p>${faq.answer}</p>
			</dd>
		</c:forEach>
	</dl>
</div>

<!-- 페이징 처리 -->
<div class="faq--page mt-2">
	<div>
		<ul class="d-flex">
			<li class="<c:if test='${faqPageUtil.currentPage == 1}'>d-none</c:if>"><a href="/faq/list?currentPage=${faqPageUtil.currentPage - 1}" class="page-link">Previous</a></li>
			<c:forEach var="pNo" begin="${faqPageUtil.startPage}" end="${faqPageUtil.endPage}" step="1">
				<li <c:if test="${pNo == faqPageUtil.currentPage}">class="active"</c:if>><a href="/faq	/list?currentPage=${pNo}" class="page-link">${pNo}</a></li>
			</c:forEach>
			<li class="<c:if test='${faqPageUtil.endPage == faqPageUtil.currentPage }'>d-none</c:if>"><a href="/faq/list?currentPage=${faqPageUtil.currentPage + 1}" class="page-link">Next</a></li>
		</ul>
	</div>
</div>

<!---------------------------------  -->
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