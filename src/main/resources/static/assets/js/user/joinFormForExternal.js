$(document).ready(() => {
	
	let nickNameOk = false;
	
	// 닉네임 중복확인
	$("#nickName").on("keyup", () => {
		$.ajax({
			type: "GET",
			url: "/api/nickName?nickName=" + $("#nickName").val() 
		}).done((response) => {
			if(response.data){
				$("#nickNameCheck").text(response.message);
				nickNameOk = false;
			} else{
				$("#nickNameCheck").text(response.message);
				nickNameOk = true;
			}
		}).fail((error) => {
			console.log(error);
			alert("요청을 처리할 수 없습니다.");
		});
	});
	
	//// 이메일 인증번호 발송 (효린)
	$("#emailAuth").on("click", () =>{
		console.log($("#email").val())
		$.ajax({
			type: "POST",
			url: "/api/emailAuth",
			data: {email: $("#email").val()}				
		}).done((response) => {
			console.log(response.data)
			if(response.isSuccess){
				alert(response.message);	
				$("#authKey").attr('disabled',false);
				confirm(response.data);
			} else{
				alert(response.message);					
			}				
		}).fail((error) => {
			console.log(error);
			alert("인증번호 발송 실패");
		});	
	});
	
	
	// 인증번호 일치여부 확인 (효린) 
	function confirm(key){
		$("#confirm").on("click", () => {
			console.log($("#authKey").val());
			console.log(typeof $("#authKey").val());
			console.log(typeof key);
					
			if(key != $("#authKey").val()){
				alert("인증실패 확인 다시입력해주세요");
			}else{
				alert("인증 완료되었습니다");
				$("#email").attr('readonly',true);
				if(usernameOk && nickNameOk){
					$("#joinBtn").prop("type","submit");
				}
			}				
		});			
	}	
	
	$("#joinBtn").on("click", () => {
		if($("#joinBtn").attr("type") == "button"){
			if(!nickNameOk){
				alert("이미 사용중인 닉네임입니다.");
			} else{
				alert("이메일 인증을 진행해주세요.");
			}
		}
	})
})
