$(document).ready(() => {
	$("#loginBtn").on("click", () => {
		console.log($("#usernameL").val() + "/" + $("#passwordL").val());
		let data = {
			username: $("#usernameL").val(),
			password: $("#passwordL").val()
		};

		$.ajax({
			type: "POST",
			url: "/api/login",
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(data),
			dataType: "json"
		}).done((response) => {
			if (response.data) {
				location.reload();
			} else {
				alert(response.message);
			}
		}).fail((error) => {
			console.log(error);
			alert("요청을 처리할 수 없습니다.");
		});
	});

});
function logoutNaver() {
	var naverPopUp;
	naverPopUp = window.open("https://nid.naver.com/nidlogin.logout", "_self", "width=10, height=10, left=-9999, top=-9999, visible=0");
	naverPopUp.blur();
	naverPopUp.close();
	setTimeout(function() {
		closePopUp1();
		location.href = "http://localhost/logout";
	}, 40);
}
