<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
}

.sidebar ul {
	color: white;
	font-size: 20px;
}

.sidebar ul a {
	
}
</style>
<body>
	<div class="sidebar">
		<ul>
			<a href="/report/reportList">신고게시물 처리</a>
		</ul>
		<ul>
			<a href="/admin/adminCategory">카테고리 관리</a>
		</ul>
		<ul>
			<a href="#">장르 관리</a>
		</ul>
		<ul>
			<a href="#">유저롤 변경</a>
		</ul>
	</div>
	<div class="main">
		<nav class="navbar navbar-light bg-light">
  			<div class="container-fluid">
    			<form class="d-flex">
      				<input id="search-input" class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
      				<button id="search-btn" class="btn btn-outline-success" type="button">Search</button>
    			</form>
  			</div>
		</nav>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">소설 제목</th>
					<th scope="col">작가</th>
					<th scope="col">서비스 타입</th>
					<th scope="col">변경할 타입</th>
					<th scope="col">수정</th>
					<th scope="col">삭제</th>
				</tr>
			</thead>
			<tbody id="novelList" class="novelList">
			</tbody>
		</table>
	</div>
	<script>
		$(document).ready(function() {
			searchNovelList();
		});
		
		// 소설 검색
		function searchNovelList() {
			$("#search-btn").on("click",function(e){
				
				let search = $("#search-input").val();
				
				$.ajax({
					type: "GET",
					url: "/api/novel/" + search,
				}).done(function(e){
					
					let appendHtml = "";
					
					for(var i=0;i<e.length;i++){
						appendHtml += '<tr id="tr'+e[i].id+'"><td>'+ e[i].title +'</td>';
						appendHtml += '<td>'+ e[i].userName +'</td>';
						appendHtml += '<td id="serviceType'+e[i].id+'">'+ e[i].serviceTypeName +'</td>';
						appendHtml += '<td style="width:300px;">';
						appendHtml += '<select id="select'+e[i].id+'" class="form-select" aria-label="Default select example">';
						appendHtml += '<option value="1">유료</option>';
						appendHtml += '<option value="2">무료</option>';
						appendHtml += '<option value="3">공모전</option></select></td>';
						appendHtml += '<td><button id="update-btn'+e[i].id+'" class="btn btn-primary" onclick="updateNovelType('+e[i].id+')">수정</button></td>';
						appendHtml += '<td><button id="delete-btn'+e[i].id+'" class="btn btn-danger" onclick="deleteNovel('+e[i].id+')">삭제</button></td></tr>';
					}
					
					$("#novelList").html(appendHtml);
					
				}).fail(function(error){
					alert("검색어를 넣어주세요");
				});
				
			});
		}
		
		// 소설 서비스 타입 변경
		function updateNovelType(id) {
			console.log(id);
			
			let data = {
					novelId : id,
					serviceTypeId : $("#select"+id).val()
				}
				
			let jsonData = JSON.stringify(data);
			
			$.ajax({
				data : jsonData,
				type: "PUT",
				url: "/api/novel/update",
				contentType : "application/json; charset=UTF-8",
			}).done(function(e){
				
				if(e){
					let selectNum = $("#select"+id).val() -1;
					
					$("#serviceType"+id).text($("#select"+id).children().eq(selectNum).text());
				}
			}).fail(function(error){
				alert("업데이트 실패");
			});
		}
		
		// 소설 삭제
		function deleteNovel(id) {
			
			$.ajax({
				type: "DELETE",
				url: "/api/novel/delete/" + id,
			}).done(function(e){
				
				if(e){
					$("#tr"+id).remove();
				}
				
			}).fail(function(error){
				alert("삭제 실패");
			});
			
		}
	</script>
</body>
</html>