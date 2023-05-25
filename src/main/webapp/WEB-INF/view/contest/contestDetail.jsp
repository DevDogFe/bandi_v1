<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../layout/header.jsp"%>
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="page-content">
				<div>
					${contest.beginCreatedAt}
				</div>
				<div>
					${contest.endCreatedAt}
				</div>
				<div>
					${contest.title}
				</div>
				<div>
					${contest.content}
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="../layout/footer.jsp"%>