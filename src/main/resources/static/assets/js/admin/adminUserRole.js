 function updateUserRole(userId) {
	    var selectedUserRole = $(".userList").find("select.userRole").val();
	    var checkList = $('.user');
	    var td = checkList.children();
	 var userId = td.eq(0).text();
	 $.ajax({
		 type: "POST",
		 url: "/api/userRole",
		 contentType: "application/json",
		 dataType: "json",
		 data: JSON.stringify({
			 id: userId,
			 userRole: selectedUserRole
		 })
	 }).done((response) => {
		 alert(response.message);
	 }).fail((error) => {
		 alert("요청 실패");
	 });
 }
