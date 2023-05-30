<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="layout/header.jsp"%>
<style>
.close-fullscreen {
	display: none
}
</style>
<a class="fullscreen" href="#" title="전체화면" onclick="openFullScreenMode()"> 전체화면 </a>
<a class="close-fullscreen" href="#" title="창모드" onclick="closeFullScreenMode()"> 창모드 </a>
<script>
	var doc = document.documentElement;
	//전체화면 설정
	function openFullScreenMode() {
		if (doc.requestFullscreen)
			doc.requestFullscreen();
		else if (doc.webkitRequestFullscreen) // Chrome, Safari (webkit)
			doc.webkitRequestFullscreen();
		else if (doc.mozRequestFullScreen) // Firefox
			doc.mozRequestFullScreen();
		else if (doc.msRequestFullscreen) // IE or Edge
			doc.msRequestFullscreen();
		$('.fullscreen').hide();
		$('.close-fullscreen').show();
	}
	//전체화면 해제
	function closeFullScreenMode() {
		if (document.exitFullscreen)
			document.exitFullscreen();
		else if (document.webkitExitFullscreen) // Chrome, Safari (webkit)
			document.webkitExitFullscreen();
		else if (document.mozCancelFullScreen) // Firefox
			document.mozCancelFullScreen();
		else if (document.msExitFullscreen) // IE or Edge
			document.msExitFullscreen();
		$('.fullscreen').show();
		$('.close-fullscreen').hide();
	}
</script>
<%@include file="layout/footer.jsp"%>
