$(document).ready(() => {
	$("#unfavorite").on("click", () => {
		$.ajax({
			type: "DELETE",
			url: "/api/unfavorite/" + $("#novelId").val()
		}).done((response) => {
			console.log(response);
			console.log(typeof response);
			location.href = '/novel/detail/' + $("#novelId").val();
		}).fail((error) => {
			console.log(error);
			alert("요청을 처리할 수 없습니다.");
		});
	});

	$("#favorite").on("click", () => {
		$.ajax({
			type: "POST",
			url: "/api/favorite/" + $("#novelId").val()
		}).done((response) => {
			console.log(response);
			console.log(typeof response);
			location.href = '/novel/detail/' + $("#novelId").val();
		}).fail((error) => {
			console.log(error);
			alert("요청을 처리할 수 없습니다.");
		});
	});
});