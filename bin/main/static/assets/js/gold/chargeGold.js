$(document).ready(function() {
	$("#goldSelectForm").on("change", function() {

		$("#totalAmount").val($("#goldSelectForm").val());
	});
})