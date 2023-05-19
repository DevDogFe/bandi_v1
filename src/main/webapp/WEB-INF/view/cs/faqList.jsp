<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../layout/header.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="page-content">

				<div class="gaming-library">
					<div class="col-lg-12">
						<div class="heading-section">
							<h4>FAQ 자주 묻는 질문</h4>
							<div class="item">

								<ul>
									<li><a href="/faq/list/">전체</a></li>
									<c:forEach var="category" items="${faqCategoryList}">
										<li><a href="/faq/list/${category.id}">${category.categoryName}</a></li>
									</c:forEach>
								</ul>

							</div>

							<!-- 질문 & 답 내용 -->
							<div>
								<ul>
									<c:forEach var="faq" items="${faqList}">
										<li>${faq.question}</li>
										<li>${faq.answer}</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>



				</div>
			</div>
		</div>
	</div>




	<%@include file="../layout/footer.jsp"%>