<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/adminHeader.jsp"%>
<link rel="stylesheet" href="/assets/css/admin/adminDashboard.css" />
</div>
<div class="sectind-flex">
	<section>
		<div class="sidebar">
			<div class="logo_content">
				<div class="logo">
					<i class='bx bx-leaf'></i>
					<div class="logo_name">반디</div>
				</div>
			</div>
			<ul class="nav_list">
				<li><a href="/admin/dashboard"> <i class='bx bx-chalkboard'></i> <span class="links_name">대시보드</span>
				</a></li>
				<li><a href="/report/reportList"> <i class='bx bxs-bell-minus'></i> <span class="links_name">신고 게시물 처리</span>
				</a></li>
				<li><a href="/admin/adminCategory"> <i class='bx bx-bookmark-alt-plus'></i> <span class="links_name">카테고리 관리</span>
				</a></li>
				<li><a href="/admin/novelChange"> <i class='bx bx-book-reader'></i> <span class="links_name">소설 타입 변경</span>
				</a></li>
				<li><a href="/admin/genre"> <i class='bx bx-book-add'></i> <span class="links_name">장르 관리</span>
				</a></li>
				<li><a href="/admin/user"> <i class='bx bx-user'></i> <span class="links_name">사용자 변경</span>
				</a></li>
				<li><a href="/admin/faqList"> <i class='bx bx-conversation'></i> <span class="links_name">자주 묻는 질문</span>
				</a></li>
				<li><a href="/admin/qnaList"> <i class='bx bx-message-square-dots'></i> <span class="links_name">Q&A</span>
				</a></li>
				<li><a href="/admin/applicationList"> <i class='bx bx-message-square-dots'></i> <span class="links_name">연재 문의</span>
				</a></li>
			</ul>
		</div>
	</section>
	<section>
		<div class="main-content">
			<div class="dashboard-chart">
				<div class="sales-chart" style="height: 420px;">
					<h3>이달 매출 현황</h3>
					<div id="chart1"></div>
				</div>
				<div class="genre-chart" style="height: 420px;">
					<h3>장르</h3>
					<div id="chart2"></div>
				</div>
			</div>
			<div class="card-flex">
				<div class="card1-body" style="height: 280px;">
					<h2 class="card-title">오늘의 가입자 수</h2>
					<h3 class="card-intro">${userCount}명</h3>
				</div>
				<div class="card1-body" style="height: 280px;">
					<h2 class="card-title">오늘 최다 조회</h2>
					<c:choose>
						<c:when test="${empty todayBest }">
							<h3 class="card-intro">아직 조회된 소설이 없습니다.</h3>
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
				<div class="card1-body" style="height: 280px;">
					<h2 class="card-title">이번달 최다 조회</h2>
					<c:choose>
						<c:when test="${empty monthBest }">
							<h3 class="card-intro">아직 조회된 소설이 없습니다.</h3>
						</c:when>
						<c:otherwise>
							<ul class="today--best">
								<li class="list-group-item">소설제목: ${monthBest.novelTitle}</li>
								<li class="list-group-item">회차제목: ${monthBest.sectionTitle}</li>
								<li class="list-group-item">이번달 조회수: ${monthBest.count}</li>
							</ul>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</section>
	<%@include file="/WEB-INF/view/layout/footer.jsp"%>
	<script type="text/javascript" src="/assets/js/admin/adminDashBoard.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>