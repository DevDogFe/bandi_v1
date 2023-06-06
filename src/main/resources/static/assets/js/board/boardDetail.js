$("#unlike").on("click", () => {
	$.ajax({
		type: "DELETE",
		url: "/api/unlike/" + $("#boardId").val()
	}).done((response) => {
		location.href = '/board/detail/' + $("#boardId").val();
	}).fail((error) => {
		console.log(error);
		alert("요청 실패")
	});
});

$("#noUser").on("click", () => {
	alert('로그인이 필요한 기능입니다.');
});

$("#like").on("click", () => {
	$.ajax({
		type: "POST",
		url: "/api/like/" + $("#boardId").val()
	}).done((response) => {
		location.href = '/board/detail/' + $("#boardId").val();
	}).fail((error) => {
		console.log(error);
		alert("요청 실패")
	});
});



function deleteReply(id) {
	$.ajax({
		type: "DELETE",
		url: "/api/deletereply/" + id,
	}).done(function(response) {
		console.log(response);
		console.log(id);
		location.href = '/board/detail/' + $("#boardId").val();
	}).fail(function(error) {
		alert("요청 실패");
	});
}


function popup() {
	var url = "/report/reportPopup/" + $("#boardId").val();
	var name = "신고하기";
	var option = "width = 500, height = 500, top = 100, left = 200, location = no";
	window.open(url, name, option)
}
