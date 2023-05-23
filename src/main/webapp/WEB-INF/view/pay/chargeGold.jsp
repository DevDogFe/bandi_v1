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
	height: 40vh;
	width: 700px;
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
	flex-direction: column;
}

.pay-btn {
	margin: 10px 0px;
	color: white;
	border-radius: 5px;
	height: 50px;
}

.pay-btn.gold {
	background-color: blue;
}

.pay-btn.charge {
	background-color: gray;
}
</style>
</head>
<body>
	<div class="container">
		<div class="top">
			<p>내 보유 골드 : <span>${userGold} 골드</span></p>
			<hr>
		</div>
		<div class="bottom">
			<p>
				<b>골드 충전하기</b>
			</p>
			<p>아래에서 방법을 선택해주세요</p>
			<select >
				<option>1000</option>
				<option>2000</option>
				<option>3000</option>
				<option>4000</option>
			</select>
			<div class="bottom-inner">
				<button class="pay-btn charge"
					onclick="location.href='/payment/kakaoPay/ready">충전하기</button>
			</div>
		</div>
	</div>
</body>
</html>