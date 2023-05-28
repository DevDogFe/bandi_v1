<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<h1>회원가입</h1>
<form action="/user" method="post">
	<div class="mb-3">
		<label for="username" class="form-label">아이디</label> <input type="text" class="form-control" id="usernameJ" name="username" required value="hyo">
		<button type="button" id="usernameCheck" class="btn btn-secondary">아이디 중복 확인</button>
	</div>
	<div class="mb-3">
		<label for="password" class="form-label">비밀번호</label> <input type="password" class="form-control" id="passwordJ" name="password" required value="456">
	</div>
	<div class="mb-3">
		<label for="passwordCheck" class="form-label">비밀번호 확인</label> <input type="password" class="form-control" id="passwordCheck" name="passwordCheck" required value="456">
	</div>
	<div class="mb-3">
		<label for="nickName" class="form-label">닉네임</label> <input type="text" class="form-control" id="nickName" name="nickName" required value="효린씨">
		<button type="button" id="nicknameCheck" class="btn btn-secondary">닉네임 중복 확인</button>
	</div>
	<div class="mb-3">
		<label for="email" class="form-label">이메일</label> <input type="email" class="form-control" id="email" name="email" required value="khl4459@naver.com">
		<button type="button" id="emailAuth" class="btn btn-secondary">이메일 인증</button>
		<br> <label for="authKey" class="form-label">인증번호</label> <input type="text" class="form-control" id="authKey" name="authKey" disabled="disabled">
		<button type="button" id="confirm" class="btn btn-secondary">인증확인</button>
	</div>
	<div class="mb-3">
		<label for="birthDate" class="form-label">생년월일</label> <input type="date" class="form-control" id="birthDate" name="birthDate" required value="1991-09-29">
	</div>
	<div class="mb-3 d-flex">
		<div>성별 &nbsp;&nbsp;&nbsp;</div>
		<div class="form-check">
			<input class="form-check-input" type="radio" name="gender" id="female" value="여성"> <label class="form-check-label" for="female"> 여성 </label>
		</div>
		&nbsp;&nbsp;&nbsp;
		<div class="form-check">
			<input class="form-check-input" type="radio" name="gender" id="male" value="남성" checked> <label class="form-check-label" for="male"> 남성 </label>
		</div>
	</div>

	<button type="button" class="btn btn-primary" id="joinBtn">가입하기</button>
</form>

<script type="text/javascript">
	$(document).ready(()=>{
		// 아이디 중복확인
		$("#usernameJ").on("click", () => {
			$.ajax({
				type: "GET",
				url: "/api/username",
				data: {username: $("#usernameJ").val()}   
			}).done((response) => {
				console.log(response)
				if(response){
					alert('이미 사용중인 아이디입니다.');
				} else{
					alert('사용 가능한 아이디입니다.');
				}
			}).fail((error) => {
				console.log(error);
				alert("요청을 처리할 수 없습니다.");
			});
		});
		
		// 닉네임 중복확인
		// JSON ---> 
		$("#nicknameCheck").on("click", () => {
			$.ajax({
				type: "GET",
				url: "/api/nickname",
				data: {nickName: $("#nickName").val()}
			}).done((response) => {
				console.log(response);
				if(response){
					alert(response.message);
				} else{
					alert('사용 가능한 아이디입니다.');
				}
			}).fail((error) => {
				console.log(error);
				alert("요청을 처리할 수 없습니다.");
			});
		});
		
		
		
		// 이메일 인증번호 발송 (효린)
/**		$("#emailAuth").on("click", () =>{
			$.ajax({
				type: "POST",
				url: "/api/emailAuth",
				data: {email: $("#email").val()}				
			}).done((response) => {
				console.log(response)
				if(response){
					alert("인증번호 발송되었습니다.");					
				} else{
					alert("이미 가입된 이메일입니다.");					
				}				
			}).fail((error) => {
				console.log(error);
				alert("인증번호 발송 실패");
			});	
		});**/
		
		//// 이메일 인증번호 발송 (효린)
		$("#emailAuth").on("click", () =>{
			$.ajax({
				type: "POST",
				url: "/api/emailAuth",
				data: {email: $("#email").val()}				
			}).done((response) => {
				console.log("response" + response);
				if(response.statusCode == 200){
					alert("인증번호 발송되었습니다.");	
					$("#authKey").attr('disabled',false);
					confirm(response);
				} else{
					alert("이미 가입된 이메일입니다.");					
				}				
			}).fail((error) => {
				console.log(error);
				alert("인증번호 발송 실패");
			});	
		});
		
		// 인증번호 일치여부 확인 (효린) 
/**		$("#confirm").on("click", () => {
			$.ajax({
				type: "POST",
				url: "/api/authKey",
				data: {email: $("#email").val(),
					  inputKey: $("#authKey").val()}
			}).done((response) => {				
				console.log(response)
				if(response){
					alert("인증 완료되었습니다");
					$("#joinBtn").prop("type","submit");
				}else{
					alert("인증실패 확인 다시입력해주세요");
				}
			}).fail((error) => {
				console.log(error);
				alert("요청을 처리할 수 없습니다")
			});			
		});**/				
		
		// 인증번호 일치여부 확인 (효린) 
		function confirm(response){
			$("#confirm").on("click", () => {
				if(response.data != $("#authKey").val()){
					alert("인증실패 확인 다시입력해주세요");
				}else{
					alert("인증 완료되었습니다");
					$("#email").attr('readonly',true);
					$("#joinBtn").prop("type","submit");			
				}				
			});			
		}			
	});
</script>
<%@include file="../layout/footer.jsp"%>