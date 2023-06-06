function detailPopup(id) {
	var url = "/report/reportDetail/" + $("#id-" + id).val();
	var name = "신고접수확인";
	var option = "width=600,height=730,top=100,left=200, location=no";
	window.open(url, name, option);
}
