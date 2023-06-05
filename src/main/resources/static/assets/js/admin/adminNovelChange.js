$(document).ready(function() {
	searchNovelList();
});

// 소설 검색
function searchNovelList() {
	$("#search-btn").on("click", function(e) {

		let search = $("#search-input").val();

		$.ajax({
			type: "GET",
			url: "/api/novel/" + search,
		}).done(function(response) {

			let appendHtml = "";
			let resArr = response.data;

			for (var i = 0; i < resArr.length; i++) {
				appendHtml += '<tr id="tr' + resArr[i].id + '"><td>' + resArr[i].title + '</td>';
				appendHtml += '<td>' + resArr[i].userName + '</td>';
				appendHtml += '<td id="serviceType' + resArr[i].id + '">' + resArr[i].serviceTypeName + '</td>';
				appendHtml += '<td style="width:300px;">';
				appendHtml += '<select id="select' + resArr[i].id + '" class="form-select" aria-label="Default select example">';
				appendHtml += '<option value="1">유료</option>';
				appendHtml += '<option value="2">무료</option>';
				appendHtml += '<td><button id="update-btn' + resArr[i].id + '" class="btn btn-primary" onclick="updateNovelType(' + resArr[i].id + ')">수정</button></td>';
				appendHtml += '<td><button id="delete-btn' + resArr[i].id + '" class="btn btn-danger" onclick="deleteNovel(' + resArr[i].id + ')">삭제</button></td></tr>';
			}

			$("#novelList").html(appendHtml);
			console.log($("#novelList").val());

		}).fail(function(error) {
			alert("검색어를 넣어주세요");
		});

	});

	$("#search-input").keypress(function(e) {
		if (e.keyCode === 13) {
			let search = $("#search-input").val();

			$.ajax({
				type: "GET",
				url: "/api/novel/" + search,
			}).done((response) => {

				let appendHtml = "";
				let resArr = response.data;

				for (var i = 0; i < resArr.length; i++) {
					appendHtml += '<tr id="tr' + resArr[i].id + '"><td>' + resArr[i].title + '</td>';
					appendHtml += '<td>' + resArr[i].userName + '</td>';
					appendHtml += '<td id="serviceType' + resArr[i].id + '">' + resArr[i].serviceTypeName + '</td>';
					appendHtml += '<td style="width:300px;">';
					appendHtml += '<select id="select' + resArr[i].id + '" class="form-select" aria-label="Default select example">';
					appendHtml += '<option value="1">유료</option>';
					appendHtml += '<option value="2">무료</option>';
					appendHtml += '<td><button id="update-btn' + resArr[i].id + '" class="btn btn-primary" onclick="updateNovelType(' + resArr[i].id + ')">수정</button></td>';
					appendHtml += '<td><button id="delete-btn' + resArr[i].id + '" class="btn btn-danger" onclick="deleteNovel(' + resArr[i].id + ')">삭제</button></td></tr>';
				}

				$("#novelList").html(appendHtml);
				console.log($("#novelList"));

			}).fail((error) => {
				alert("검색어를 넣어주세요");
			});
		}
	});

}

// 소설 서비스 타입 변경
function updateNovelType(id) {
	console.log(id);

	let data = {
		novelId: id,
		serviceTypeId: $("#select" + id).val()
	}

	let jsonData = JSON.stringify(data);

	$.ajax({
		data: jsonData,
		type: "PUT",
		url: "/api/novel/update",
		contentType: "application/json; charset=UTF-8",
	}).done((response) => {

		if (response.data == 1) {
			let selectNum = $("#select" + id).val() - 1;

			$("#serviceType" + id).text($("#select" + id).children().eq(selectNum).text());
		}
	}).fail((error) => {
		console.log(error);
		alert("업데이트 실패");
	});
}

// 소설 삭제
function deleteNovel(id) {

	$.ajax({
		type: "DELETE",
		url: "/api/novel/delete/" + id,
	}).done((response) => {

		if (response.data == 1) {
			$("#tr" + id).remove();
		}

	}).fail(function(error) {
		alert("삭제 실패");
	});

}