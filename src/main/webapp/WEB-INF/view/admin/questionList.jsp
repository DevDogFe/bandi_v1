<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<h2>질문(관리자)</h2>

	<!-- 	<button id="btn-qna-list-all" onclick="abcf(-1);" class="btn" value="-1">전체</button>
	<button id="btn-qna-list-incomplete" class="btn" value="0">미처리</button>
	<button id="btn-qna-list-incomplete" class="btn" value="1">처리완료</button> -->
	<button class="btn--qnaList" value="-1">전체</button>
	<button class="btn--qnaList" value="0">미처리</button>
	<button class="btn--qnaList" value="1">처리완료</button>
	<table>
		<thead>
			<tr>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일자</th>
				<th>처리상태</th>
			</tr>
		</thead>
		<tbody id="qnaListBody">
			<c:forEach var="question" items="${questionList}">
				<tr id="qna" class="qna--table">
					<td class="qna--table">${question.categoryName}</td>
					<td class="qna--table"><a href="/admin/question/${question.id}">${question.title}</a></td>
					<td class="qna--table">${question.username}</td>
					<td class="qna--table">${question.createdAt()}</td>
					<td class="qna--table">${question.proceed}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<script>
       $(document).ready(function() {
     	   //$("#btn-qna-list-incomplete").on("click", function() {
    	   $(".btn--qnaList").on("click", function() {
   	        	// location.href = "/admin/qnaList?proceed=" + $(this).val();
				// http://localhost/admin/qnaList?proceed=[-1, 0, 1]
   	        $.ajax({
                   type: "get",
                   url: "/admin/api/qnaList?proceed=" + $(this).val(),
                   contentType: "application/json; charset=utf-8"
	        }).done((response) => {
	        	$(".qna--table").remove();
	        	// console.log(typeof response[0].createdAt);
	        	let qnaNode;	        	
	        	
	        	for(i=0; i < response.length; i++){ 	        		
	        		 let createdAt = response[i].createdAt;
	        		 let time = createdAt.replace('T', " ").substring(0, 16);
	        		 qnaNode += `<tr class="qna--table">
		        		 <td class="qna--table">\${response[i].categoryName}</td>
		        		 <td class="qna--table"><a href="/admin/question/\${response[i].id}">\${response[i].title}</td>
		        		 <td class="qna--table">\${response[i].userId}</td>
		        		 <td class="qna--table">\${time}</td>
		        		 <td class="qna--table">\${response[i].proceed}</td>
		        		 </tr>
		        		 `;	        		
	        	}        		 
				 $("#qnaListBody").append(qnaNode);
				 
	        } ).fail((error) => {
	        	console.log(error);
	        });
   	      });
   	   });   
    	   
	</script>
</body>
</html>
