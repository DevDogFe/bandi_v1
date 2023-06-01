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
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
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
    	                       'width':480,
    	                       'height':350,
    	                       chartArea: {
    	                           backgroundColor: {
    	                             fill: '#FF0000',
    	                             fillOpacity: 0.1
    	                           },
    	                         },
    	                         // Colors the entire chart area, simple version
    	                         // backgroundColor: '#FF0000',
    	                         // Colors the entire chart area, with opacity
    	                         backgroundColor: {
    	                           fill: '#FF0000',
    	                           fillOpacity: 0
    	                         }
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
.card {
	text-align: center;
	margin: 20px;
}

.card1 {
	width: 435px;
}

.card2 {
	width: 910px;
}

.today--best li {
	font-size: 17px;
	font-weight: bold;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Noto Sans KR', sans-serif;
}

.sidebar {
	position: fixed;
	left: 0;
	top: 0;
	height: 100%;
	width: 78px;
	background: #11101D;
	padding: 6px 14px;
	z-index: 99;
	transition: all 0.5s ease;
}

.sidebar.open {
	width: 250px;
}

.sidebar .logo-details {
	height: 60px;
	display: flex;
	align-items: center;
	position: relative;
}

.sidebar .logo-details .icon {
	opacity: 0;
	transition: all 0.5s ease;
}

.sidebar .logo-details .logo_name {
	color: #fff;
	font-size: 20px;
	font-weight: 600;
	opacity: 0;
	transition: all 0.5s ease;
}

.sidebar.open .logo-details .icon, .sidebar.open .logo-details .logo_name {
	opacity: 1;
}

.sidebar .logo-details #btn {
	position: absolute;
	top: 50%;
	right: 0;
	transform: translateY(-50%);
	font-size: 22px;
	transition: all 0.4s ease;
	font-size: 23px;
	text-align: center;
	cursor: pointer;
	transition: all 0.5s ease;
}

.sidebar.open .logo-details #btn {
	text-align: right;
}

.sidebar i {
	color: #fff;
	height: 60px;
	min-width: 50px;
	font-size: 28px;
	text-align: center;
	line-height: 60px;
}

.sidebar .nav-list {
	margin-top: 20px;
	height: 100%;
}

.sidebar li {
	position: relative;
	margin: 8px 0;
	list-style: none;
}

.sidebar li .tooltip {
	position: absolute;
	top: -20px;
	left: calc(100% + 15px);
	z-index: 3;
	background: #fff;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3);
	padding: 6px 12px;
	border-radius: 4px;
	font-size: 15px;
	font-weight: 400;
	opacity: 0;
	white-space: nowrap;
	pointer-events: none;
	transition: 0s;
}

.sidebar li:hover .tooltip {
	opacity: 1;
	pointer-events: auto;
	transition: all 0.4s ease;
	top: 50%;
	transform: translateY(-50%);
}

.sidebar.open li .tooltip {
	display: none;
}

.sidebar li a {
	display: flex;
	height: 100%;
	width: 100%;
	border-radius: 12px;
	align-items: center;
	text-decoration: none;
	transition: all 0.4s ease;
	background: #11101D;
}

.sidebar li a:hover {
	background: #FFF;
}

.sidebar li a .links_name {
	color: #fff;
	font-size: 15px;
	font-weight: 400;
	white-space: nowrap;
	opacity: 0;
	pointer-events: none;
	transition: 0.4s;
}

.sidebar.open li a .links_name {
	opacity: 1;
	pointer-events: auto;
}

.sidebar li a:hover .links_name, .sidebar li a:hover i {
	transition: all 0.5s ease;
	color: #11101D;
}

.sidebar li i {
	height: 50px;
	line-height: 50px;
	font-size: 18px;
	border-radius: 12px;
}

.main-section {
	position: relative;
	min-height: 100vh;
	top: 0;
	left: 78px;
	width: calc(100% - 78px);
	transition: all 0.5s ease;
	z-index: 2;
}

.sidebar.open ~ .main-section {
	left: 250px;
	width: calc(100% - 250px);
}

.main-section .main-content {
	display: inline-block;
	color: #11101d;
	font-size: 25px;
	font-weight: 500;
	margin: 18px
}

ul {
	padding-left: 0;
}

@media ( max-width : 420px) {
	.sidebar li .tooltip {
		display: none;
	}
}
</style>
<body>
	<div class="sidebar">
		<div class="logo-details">
			<i class='bx bx-leaf icon'></i>
			<div class="logo_name">반디</div>
			<i class='bx bx-menu' id="btn"></i>
		</div>
		<ul class="nav-list">
			<li><a href="/admin/dashboard"> <i class='bx bx-chalkboard'></i> <span class="links_name">대시보드</span>
			</a> <span class="tooltip">대시보드</span></li>
			<li><a href="/report/reportList"> <i class='bx bxs-bell-minus'></i> <span class="links_name">신고 게시물 처리</span>
			</a> <span class="tooltip">신고 게시물 처리</span></li>
			<li><a href="/admin/adminCategory"> <i class='bx bx-bookmark-alt-plus'></i> <span class="links_name">카테고리 관리</span>
			</a> <span class="tooltip">카테고리 관리</span></li>
			<li><a href="/admin/novelChange"> <i class='bx bx-book-reader'></i> <span class="links_name">소설 타입 변경</span>
			</a> <span class="tooltip">소설 타입 변경</span></li>
			<li><a href="/admin/genre"> <i class='bx bx-book-add'></i> <span class="links_name">장르 관리</span>
			</a> <span class="tooltip">장르 관리</span></li>
			<li><a href="/admin/user"> <i class='bx bx-user'></i> <span class="links_name">유저롤 변경</span>
			</a> <span class="tooltip">사용자 변경</span></li>
			<li><a href="#"> <i class='bx bx-conversation'></i> <span class="links_name">자주 묻는 질문</span>
			</a> <span class="tooltip">자주 묻는 질문</span></li>
			<li><a href="#"> <i class='bx bx-message-square-dots'></i> <span class="links_name">질의 응답</span>
			</a> <span class="tooltip">질의 응답</span></li>
		</ul>
	</div>
	<section class="main-section">
		<div class="main d-flex flex-wrap justify-content-center align-items-center">
			<div class="card card1 d-flex flex-column justify-content-center align-items-center" style="height: 30vh;">
				<h2>오늘의 가입자 수</h2>
				<br> <br>
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
	  let sidebar = document.querySelector(".sidebar");
	  let closeBtn = document.querySelector("#btn");
	  let searchBtn = document.querySelector(".bx-search");
	  closeBtn.addEventListener("click", ()=>{
	    sidebar.classList.toggle("open");
	    menuBtnChange();
	  });
	  searchBtn.addEventListener("click", ()=>{ 
	    sidebar.classList.toggle("open");
	    menuBtnChange(); 
	  });
	  function menuBtnChange() {
	   if(sidebar.classList.contains("open")){
	     closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");
	   }else {
	     closeBtn.classList.replace("bx-menu-alt-right","bx-menu");
	   }
	  }
	</script>
</body>
</html>