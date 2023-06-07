<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/layout/header.jsp"%>

<link rel="stylesheet" href="/assets/css/reset.css" />
<link rel="stylesheet" href="/assets/css/mypage/sidebar.css" />
<link rel="stylesheet" href="/assets/css/mypage/record.css" />

<div class="sectind-flex">
	<section class="left-sidebar">
		<div class="sidebar">
			<div class="logo_content">
				<div class="logo">
					<i class='bx bx-leaf'></i>
					<div class="logo_name">반디</div>
				</div>
				<nav>
					<div class="logo">
						<a href="#none"><img src="/assets/images/main/bandi-logo3.png"></a>
					</div>
					<ul class="gnb">
						<li><a href="#none">HOME</a></li>
						<li><a href="#none">소설</a></li>
						<li><a href="#none">공모전</a></li>
						<li class="dropdown"><a href="#none" class="dropbtn">게시판</a></li>
						<li><a href="#none">고객지원</a></li>
						<li><a href="#none">마이페이지</a></li>
					</ul>
				</nav>
			</header>
			<div class="sectind-flex">
				<section class="left-sidebar">
					<div class="sidebar">
						<div class="logo_content">
							<div class="logo">
								<i class='bx bx-leaf'></i>
								<div class="logo_name">반디</div>
							</div>
						</div>
						<ul class="nav_list">
							<li><a href="/myInfo"> <i class='bx bx-user'></i> <span class="links_name">개인정보</span>
							</a></li>
							<li><a href="/myNovel"> <i class='bx bx-book-open'></i> <span class="links_name">내 작품</span>
							</a></li>
							<li><a href="/myFavorite"> <i class='bx bx-bookmark'></i> <span class="links_name">즐겨찾기 목록</span>
							</a></li>
							<li><a href="/admin/novelChange"> <i class='bx bx-book-add'></i> <span class="links_name">작품 구매 기록</span>
							</a></li>
							<li><a href="/admin/genre"> <i class='bx bx-book-bookmark'></i>
									<span class="links_name">작품 대여 기록</span>
							</a></li>
							<li><a href="/admin/user"> <i class='bx bx-coin-stack'></i> <span
									class="links_name">골드 충전 기록</span>
							</a></li>
							<li><a href="/qna/userList">  <i class='bx bx-conversation'></i> <span
									class="links_name">1:1 문의</span>
							</a></li>
						</ul>
					</div>
				</section>
				<section class="main">
					<div class="report-list">
						<div class="main-header">
							<h3 class="mb-2">내 즐겨찾기</h3>
						</div>
						<c:choose>
							<c:when test="${empty favoriteList }">
								<table class="table">
									<thead>
										<tr>
											<th scope="cols">장르</th>
											<th scope="cols">제목</th>
											<th scope="cols">작가</th>
										</tr>
									</thead>
									<tbody class="reportList">
										<tr>
											<td>즐겨찾기에 등록된 작품이 없습니다.</td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</c:when>
							<c:otherwise>
							<div class="scroll">
								<table class="table">
									<thead>
										<tr>
											<th scope="cols">장르</th>
											<th scope="cols">제목</th>
											<th scope="cols">작가</th>
										</tr>
									</thead>
									<c:forEach items="${favoriteList }" var="novel">
										<tbody class="reportList">
											<tr>
												<td>${novel.genreName }</td>
												<td><a href="/novel/detail/${novel.id }">${novel.title }</a></td>
												<td>${novel.authorName }</td>
											</tr>
										</tbody>
									</c:forEach>
								</table>
							</div>
							</c:otherwise>
						</c:choose>
					</div>
				</section>
			</div>
			<ul class="nav_list">
				<li><a href="/myInfo"> <i class='bx bx-user'></i> <span class="links_name">개인정보</span>
				</a></li>
				<li><a href="/myNovel"> <i class='bx bx-book-open'></i> <span class="links_name">내 작품</span>
				</a></li>
				<li><a href="/myFavorite"> <i class='bx bx-bookmark'></i> <span class="links_name">즐겨찾기 목록</span>
				</a></li>
				<li><a href="/purchase"> <i class='bx bx-book-add'></i> <span class="links_name">작품 구매 기록</span>
				</a></li>
				<li><a href="/rental"> <i class='bx bx-book-bookmark'></i> <span class="links_name">작품 대여 기록</span>
				</a></li>
				<li><a href="/goldCharge"> <i class='bx bx-coin-stack'></i> <span class="links_name">골드 충전 기록</span>
				</a></li>
				<li><a href="#"> <i class='bx bx-conversation'></i> <span class="links_name">1:1 문의</span>
				</a></li>
			</ul>
		</div>
	</section>
	<section class="main">
		<div class="report-list">
			<div class="main-header">
				<h3 class="mb-2">내 즐겨찾기</h3>
			</div>
			<c:choose>
				<c:when test="${empty favoriteList }">
					<table class="table">
						<thead>
							<tr>
								<th scope="cols">장르</th>
								<th scope="cols">제목</th>
								<th scope="cols">작가</th>
							</tr>
						</thead>
						<tbody class="reportList">
							<tr>
								<td>즐겨찾기에 등록된 작품이 없습니다.</td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<div class="scroll">
						<table class="table">
							<thead>
								<tr>
									<th scope="cols">장르</th>
									<th scope="cols">제목</th>
									<th scope="cols">작가</th>
								</tr>
							</thead>
							<c:forEach items="${favoriteList }" var="novel">
								<tbody class="reportList">
									<tr>
										<td>${novel.genreName }</td>
										<td><a href="/novel/detail/${novel.id }">${novel.title }</a></td>
										<td>${novel.authorName }</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</section>
</div>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>
