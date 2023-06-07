$(document).ready(() => {
	$("#category").on("change", () => {

		$.ajax({
			type: "GET",
			url: "/api/faq/" + $("#category").val(),
		}).done((response) => {
			$(".faq--table").remove();
			let faqList;
			let data = response.data

			for (i = 0; i < data.length; i++) {

				faqList +=
					`<tr class="faq--table">
	                    <td style="width: 100px;"><input type="checkbox" id="check--id" name="check--id" value="${data[i].id}" ></td>
	                    <td class="faq--table">${data[i].question}</td>
	                    <td class="faq--table">${data[i].answer}</td>                    
	                    <td class="faq--table"><a href="/admin/faq/update/\${data[i].id}"><button>수정</button></a></td>
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

		$("input[name=check--id]:checked").each(function() {
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

});