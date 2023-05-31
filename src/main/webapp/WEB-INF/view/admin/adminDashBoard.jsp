<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);
      google.charts.setOnLoadCallback(drawChart2);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {
    	  let sales;
    	  let refund;
    	  
    	  $.ajax({
				type: "GET",
				url: "/api/monthSales",
			}).done((response) => {
				sales = response.data.sales;
				refund = response.data.refund;
		        // Create the data table.
		        makeBarChart(sales, refund);
			}).fail((error) => {
				console.log(error);
				alert("요청을 처리할 수 없습니다.");
			});
    	  
    	  // 바차트 만들기
    	  function makeBarChart(sales, refund){
    		  let data = google.visualization.arrayToDataTable([
		            ['유형', '금액', { role: 'style' }],
		            ['매출', sales, 'blue'],
		            ['환불', refund, 'red'], // CSS-style declaration
		         ]);
		        // Set chart options
		        let now = new Date();
		        let currentMonth = now.getMonth() + 1;
		        let options = {'title': currentMonth + '월 매출현황',
		                       'width': 700,
		                       'height': 300};
		        // Instantiate and draw our chart, passing in some options.
		        let chart = new google.visualization.BarChart(document.getElementById('chart1'));
		        chart.draw(data, options);
    	  }
    	  
   		
      }
    	  function drawChart2() {
    		  
    	  $.ajax({
				type: "GET",
				url: "/api/genre",
			}).done((response) => {
				console.log(response);
				let arr = response.data;
				console.log(arr);
    	        let data = new google.visualization.DataTable();
    	        data.addColumn('string', 'Topping');
    	        data.addColumn('number', 'Slices');
				let rowArr;
				for(let i = 0; i<arr.length; i++){
					rowArr= [arr[i].name, arr[i].count];
					data.addRows([rowArr,]);
				}
    	        let options = {'title':'장르 점유',
    	                       'width':420,
    	                       'height':350
    	                       };

    	        let chart = new google.visualization.PieChart(document.getElementById('chart2'));
    	        chart.draw(data, options);
				
			}).fail((error) => {
				console.log(error);
				alert("요청을 처리할 수 없습니다.");
			});

    	  }
    </script>
<style>

.sidebar {
	display: table-cell;
	width: 15%;
	min-width: 200px;
	background-color: #0A8A8A;
	vertical-align: top;
	margin-left: 20px;
	padding-bottom: 100%;
}

.main {
	display: table-cell;
	width: 85%;
	background-color: #ddd;
}

.sidebar ul {
	color: white;
	font-size: 20px;
}

.sidebar ul a {
	
}

.card{
	text-align: center;
	margin: 20px;
	
}

.card1{
	width: 435px;

}
.card2{
	width: 910px;
}

.today--best li{
	font-size: 17px;
	font-weight: bold;
}
</style>
<body>
	<section class="d-flex align-items-start">

		<div class="sidebar">
			<ul>
				<a href="/report/reportList">신고게시물 처리</a>
			</ul>
			<ul>
				<a href="/admin/adminCategory">카테고리 관리</a>
			</ul>
			<ul>
				<a href="/admin/genre">장르 관리</a>
			</ul>
			<ul>
				<a href="/admin/user">유저롤 변경</a>
			</ul>
		</div>
		<div class="main d-flex flex-wrap justify-content-center align-items-center">
			<div class="card card1 d-flex flex-column justify-content-center align-items-center" style="height: 30vh;">
				<h2>오늘의 가입자 수</h2>
				<br><br>
				<h3>${userCount}명</h3>
			</div>
			<div class="card card1 d-flex flex-column justify-content-center align-items-center" style="height: 30vh;">
				<h2>오늘 최다 조회</h2>
				<c:choose>
				<c:when test="${empty todayBest }">
					<h3>아직 조회된 소설이 없습니다.</h3>
				</c:when>
				<c:otherwise>
				<ul class="list-group list-group-flush today--best">
					<li class="list-group-item">소설제목: ${todayBest.novelTitle}</li>
					<li class="list-group-item">회차제목: ${todayBest.sectionTitle}</li>
					<li class="list-group-item">오늘 조회수: ${todayBest.count}</li>
				</ul>
				</c:otherwise>
				</c:choose>
			</div>
			<div class="card card1 d-flex flex-column justify-content-center align-items-center" style="height: 30vh;">
				<h2>이번달 최다 조회</h2>
				<c:choose>
				<c:when test="${empty monthBest }">
					<h3>아직 조회된 소설이 없습니다.</h3>
				</c:when>
				<c:otherwise>
				<ul class="list-group list-group-flush today--best">
					<li class="list-group-item">소설제목: ${monthBest.novelTitle}</li>
					<li class="list-group-item">회차제목: ${monthBest.sectionTitle}</li>
					<li class="list-group-item">이번달 조회수: ${monthBest.count}</li>
				</ul>
				</c:otherwise>
				</c:choose>
			</div>
			<div class="card card2 d-flex flex-column justify-content-center align-items-center" style="height: 45vh;">
				<h3>이달 매출 현황</h3>
				<div id="chart1"></div>
			</div>
			<div class="card card1 d-flex flex-column justify-content-center align-items-center" style="height: 45vh;">
				<h3>장르</h3>
				<div id="chart2"></div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
	</script>
</body>
</html>