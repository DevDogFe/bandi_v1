<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	display: flex;
	justify-content: center;
	height: 100vh;
	align-items: center;
	background-color: #f3f3f3;
}

.container {
	height: 60%;
	width: 50%;
	display: flex;
	flex-direction: column;
	text-align: center;
	background-color: white;
	padding: 10px;
	border-radius: 10px;
	align-items: center;
	justify-content: center;
}

.bottom-inner {
	display: flex;
	justify-content: center;
}

.bottom-inner button{
	margin: 10px 20px;
}


.pay-btn {
	margin: 10px 0px;
	color: white;
	border-radius: 5px;
	height: 50px;
}

.gold-purchase {
	background-color: gold;
}

.gold-rental {
	background-color: goldenrod;
}

.rental {
	background-color: chocolate;
}

.purchase {
	background-color: blue;
}

.charge {
	background-color: gray;
}
</style>
</head>
<body>
	<div class="container">
		<div class="top">
			<h1>구매가 필요한 유료 작품입니다.</h1>
			<p>내 보유 골드 : <span>${userGold} 골드</span></p>
			<hr>
		</div>
		<div class="bottom">
			<p><b>골드 사용하기</b></p>
			<div class="bottom-inner">
				<form action="/payment/gold/purchase" method="post">
				<input type="hidden" name="sectionId" value="${paySection.id}">
				<input type="hidden" name="novelId" value="${paySection.novelId}">
				<input type="hidden" name="quantity" value="1">
				<input type="hidden" name="itemName" value="${paySection.title}">
				<input type="hidden" name="totalAmount" value="${paySection.currentPrice}">
				<button type="submit" class="pay-btn gold-purchase">구매 ${paySection.currentPrice} G</button>
			</form>
			<form action="/payment/gold/rental" method="post">
				<input type="hidden" name="sectionId" value="${paySection.id}">
				<input type="hidden" name="novelId" value="${paySection.novelId}">
				<input type="hidden" name="quantity" value="1">
				<input type="hidden" name="itemName" value="${paySection.title}">
				<input type="hidden" name="totalAmount" value="${paySection.currentPrice}">
				<button type="submit" class="pay-btn gold-rental">대여 ${paySection.currentPrice} G</button>
			</form>
			</div>
			
			
			<p><b>결제 방법을 선택해주세요</b></p>
			<div class="bottom-inner">
			<form action="/payment/kakaoPay/ready" method="post">
				<input type="hidden" name="sectionId" value="${paySection.id}">
				<input type="hidden" name="novelId" value="${paySection.novelId}">
				<input type="hidden" name="quantity" value="1">
				<input type="hidden" name="itemName" value="${paySection.title}">
				<input type="hidden" name="totalAmount" value="${paySection.currentPrice}">
				<button type="submit" class="pay-btn purchase">구매 ${paySection.currentPrice} G</button>
			</form>
			<form action="/payment/kakaoPay/ready" method="post">
				<input type="hidden" name="sectionId" value="${paySection.id}">
				<input type="hidden" name="novelId" value="${paySection.novelId}">
				<input type="hidden" name="quantity" value="1">
				<input type="hidden" name="itemName" value="${paySection.title}">
				<input type="hidden" name="totalAmount" value="${paySection.currentPrice}">
				<input type="hidden" name="isRental" value="true">
				<button type="submit" class="pay-btn rental">3일 대여 ${paySection.currentPrice} G</button>
			</form>
				<button type="button" class="pay-btn charge"
					onclick="location.href='/payment/charge'">골드 충전하기</button>
			</div>
		</div>
	</div>
</body>
</html>