<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>

</style>
<body>
	<h4>FAQ (관리자페이지)</h4>
	<div class="faqCategory">
		<select id="category" name="categoryId">
			<option value="0">전체</option>
			<c:forEach var="category" items="${faqCategoryList}">
				<option value="${category.id}">${category.categoryName}</option>
			</c:forEach>
		</select>
	</div>

	<div>
		<button id="delete--btn">삭제</button>
		<a href="/admin/faq"><button>글쓰기</button></a>
	</div>

	<!-- 질문 & 답 내용 -->
	<div class="faq--list">
		<table>
			<thead>
				<tr>
					<th><input type="checkbox" id="check--All"></th>
					<th>질문</th>
					<th>답변</th>
					<th>수정</th>
				</tr>
			</thead>
			<tbody id="faqListBody">

				<c:forEach var="faq" items="${faqList}">
					<tr class="faq--table">
						<td><input type="checkbox" id="check--id" name="check--id" value="${faq.id}"></td>
						<td class="faq--table">${faq.question}</td>
						<td class="faq--table">${faq.answer}</td>
						<td class="faq--table"><a href="/admin/faq/update/${faq.id}"><button>수정</button></a></td>
						<%-- <td class="faq--table"><a href="/admin/faq/delete/${faq.id}"><button>삭제</button></a></td> --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script>
    $(document).ready(() => {
        $("#category").on("change", () => {

            $.ajax({
                type: "GET",
                url: "/api/faq/" + $("#category").val(),
            }).done((response) => {
                $(".faq--table").remove();
                let faqList;

                for (i = 0; i < response.length; i++) {

                    faqList +=
                        `<tr class="faq--table">
                    <td><input type="checkbox" id="check--id" name="check--id" value="\${response[i].id}" ></td>
                    <td class="faq--table">\${response[i].question}</td>
                    <td class="faq--table">\${response[i].answer}</td>                    
                    <td class="faq--table"><a href="/admin/faq/update/\${response[i].id}"><button>수정</button></a></td>
                    <td class="faq--table"><a href="/admin/faq/delete/\${response[i].id}"><button>삭제</button></a></td>
                    </tr>`;
                }
                $("#faqListBody").append(faqList);

            }).fail((error) => {
                console.log(error);
                alert("요청을 처리할 수 없습니다.");
            });
        });

        $("#delete--btn").on("click", () => {

            let checkedList = [];

            $("input[name=check--id]:checked").each(function () {
                checkedList.push($(this).val());
            });
            console.log(checkedList);

            $.ajax({
                type: "DELETE",
                url: "/api/faq/" + checkedList
            }).done((response) => {
                location.href = "/admin/faqList";

            }).fail((error) => {
                console.log(error);
                alert("삭제할 글을 선택해주세요");
            });
        });


        /* function checkAll(){
             if($("#check--All").is("checked")){
               $("input[name=check--id]").prop("checked", true);
               }else{
               $("input[name=check--id]").prop("checked", false);					
               }				
         } */
    });
</script>

</body>
</html>