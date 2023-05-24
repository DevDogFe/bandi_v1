<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp"%>
<script>
	$(document).ready(function() {
		$("#goldSelectForm").on("change", function() {

			$("#totalAmount").val($("#goldSelectForm").val());
			console.log($("#totalAmount").val());
		});
	})
</script>
<div class="container">
	<div class="top">
		<p>
			내 보유 골드 : <span>${userGold} 골드</span>
		</p>
		<hr>
	</div>
	<div class="bottom">
		<p>
			<b>골드 충전하기</b>
		</p>
		<p>아래에서 충전 금액을 선택해주세요</p>
		<form action="/payment/kakaoPay/gold/ready" method="post">
			<select id="goldSelectForm" class="form-select" aria-label="Default select example">
				<option selected>골드 충전 선택</option>
				<option value="1000">1000</option>
				<option value="2000">2000</option>
				<option value="3000">3000</option>
			</select> 
			<input type="hidden" name="sectionId" value="0">
			<input type="hidden" name="novelId" value="0">
			<input type="hidden" name="quantity" value="1"> 
			<input type="hidden" name="itemName" value="골드"> 
			<input id="totalAmount" type="hidden" name="totalAmount" value="0">
			<div id="chargeBtn" class="bottom-inner" style="display: inline-block;">
				<button type="submit" class="pay-btn charge">충전하기</button>
			</div>
		</form>
	</div>
</div>
</body>
</html>