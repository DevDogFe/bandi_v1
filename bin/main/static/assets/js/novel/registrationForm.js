$(document).ready(function() {
	$("#addContestForm").css('display', 'none');
	$("#serviceTypeId").on("change", function() {
			let selectedId = $("#serviceTypeId option:selected" ).val();
		if (selectedId == 3) {
			$("#addContestForm").show();
			// 서비스 타입 공모전 선택 시 contestId에 기본값 설정
			$("#contestId").val($("#contestOptionId1").val());
		} else {
			$("#addContestForm").hide();
			$("#contestId").val(0);
		}
	});

	$("#contestFormId").on("change", function() {

		let contestOptionId = $("#contestFormId").val();
		// input값 변경으로 공모전 id post 하기
		$("#contestId").val($("#contestOptionId" + contestOptionId).val());
	});
	
})