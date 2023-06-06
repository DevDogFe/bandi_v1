$(document).ready(() => {
	// 패스워드 패스워드 확인 맞는지 확인
	$("#updateBtn").on("click", () => {
		if ($("#password").val() == $("#passwordCheck").val()) {
			let data = {
				beforePassword: $("#beforePassword").val(),
				password: $("#password").val(),
				passwordCheck: $("#passwordCheck").val(),
				nickName: $("#nickName").val(),
				email: $("#email").val()
			};

			$.ajax({
				type: "PUT",
				url: "/update",
				contentType: "application/json; charset=utf-8",
				data: JSON.stringify(data),
				dataType: "json"
			}).done((response) => {
				location.href = '/myInfo';
			}).fail((error) => {
				console.log(error);
				alert("서버오류");
			});
		} else {
			alert("비밀번호와 비밀번호확인의 값이 일치해야합니다.")
		}
	});

	// 닉네임 중복확인
	$("#nickName").on("keyup", () => {
		console.log('111111');
		$.ajax({
			type: "GET",
			url: "/api/nickName?nickName=" + $("#nickName").val()
		}).done((response) => {
			console.log(response);
			if (response.data) {
				$("#nickNameCheck").text("이미 사용중인 닉네임입니다.");
			} else {
				$("#nickNameCheck").text("사용 가능한 닉네임입니다.");
			}
		}).fail((error) => {
			console.log(error);
			alert("요청을 처리할 수 없습니다.");
		});
	});
});