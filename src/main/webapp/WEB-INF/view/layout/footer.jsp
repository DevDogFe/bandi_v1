<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
</div>
</div>
<footer>
		<div class="footer-top">
			<ul>
				<li>(주)반디</li>
				<li><a href="#none">이용약관</a></li>
				<li><a href="#none">개인정보 처리방침</a></li>
				<li><a href="#none">청소년 보호 정책</a></li>
				<li><a href="#none">회사 소개</a></li>
			</ul>
		</div>
		<div class="footer-content">
			<ul class="community">
				<!-- 제목 줄은 a없이-->
				<li>게시판</li>
				<li><a href="#none">Subscribe</a></li>
				<li><a href="#none">Give A Gift</a></li>
				<li><a href="#none">Customer Service FAQ</a></li>
				<li><a href="#none">Access Your Subscription</a></li>
			</ul>
			<ul class="network">
				<li>Network</li>
				<li><a href="#none">Privacy Policy</a></li>
				<li><a href="#none">Terms Of Service</a></li>
				<li><a href="#none">Advertise</a></li>
				<li><a href="#none">Jobs</a></li>
			</ul>
			<ul class="help">
				<li>Help Preserve This Project</li>
				<li>We may earn a commission if you purchase an item featured on our site.</li>
				<li>Copyright © 2020 CodingWorks. All rights reserved.</li>
			</ul>
		</div>
</footer>
<script type="text/javascript">
		$(document).ready(()=>{
			$("#loginBtn").on("click", () => {
				console.log($("#usernameL").val() + "/" + $("#passwordL").val());
				let data = {
						username: $("#usernameL").val(),
						password: $("#passwordL").val()
				};
				
				$.ajax({
					type: "POST",
					url: "/api/login",
					contentType:"application/json; charset=utf-8",
					data: JSON.stringify(data),
					dataType:"json"
				}).done((response) => {
					if(response.data){
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
			      naverPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_self", "width=10, height=10, left=-9999, top=-9999, visible=0");
			      naverPopUp.blur();
			      naverPopUp.close();
			      setTimeout(function() {
			         closePopUp1();
			         location.href = "http://localhost/logout";
			      }, 40);
			}
	</script>
</body>
</html>