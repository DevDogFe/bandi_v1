$(document).ready(function() {
	$(".qnaList--btn").on("click", function() {
		$.ajax({
			type: "get",
			url: "/api/qnaList?proceed=" + $(this).val(),
			contentType: "application/json; charset=utf-8"
		}).done((response) => {
			$(".qna--table").remove();
			let qnaNode;
			let resList = response.data;

			for (i = 0; i < resList.length; i++) {
				let createdAt = resList[i].createdAt;
				let time = createdAt.replace('T', " ").substring(0, 16);
				let proceed = resList[i].proceed;
				if (proceed == 0) {
					proceed = "미처리";
				} else {
					proceed = "처리";
				}

				qnaNode += `<tr class="qna--table">
				        		 <td class="qna--table" style="width: 220px;">${resList[i].categoryName}</td>
				        		 <td class="qna--table"><a href="/admin/question/${resList[i].id}">${resList[i].title}</td>
				        		 <td class="qna--table">${resList[i].username}</td>
				        		 <td class="qna--table">${time}</td>					       			 
				        		 <td class="qna--table">${proceed}</td>		        		 
				        		 </tr>
				        		 `;
			}
			$("#qnaListBody").append(qnaNode);

		}).fail((error) => {
			console.log(error);
		});
	});
});
