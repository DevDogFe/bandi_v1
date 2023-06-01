<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!DOCTYPE html>
<style>


</style>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>반디</title>
    <script src="/assets/js/jquery.min.js"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
    <script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="/assets/js/custom-slick.js"></script>
    <link rel="stylesheet" href="/assets/css/style.css" />
  </head>
  <body>
    <div class="container">
    	<div class="inner">
      <header>
        <div class="banner">
          <div class="lnb">
            <a href="#none"><em>for</em> member</a>
            <a href="#none">로그인</a>
            <a href="#none">회원가입</a>
          </div>
        </div>
        <nav>
          <div class="logo">
            <a href="#none"><img src="/assets/images/main/bandi-logo3.png"></a>
          </div>
          <ul class="gnb">
            <li><a href="#none">HOME</a></li>
            <li><a href="#none">소설</a></li>
            <li><a href="#none">공모전</a></li>
            <li class="dropdown">
              <a href="#none" class="dropbtn">게시판</a>
            </li>
            <li><a href="#none">고객지원</a></li>
            <li><a href="#none">마이페이지</a></li>
          </ul>
        </nav>
      </header>
<%@include file="layout/csCategory.jsp"%>


<%-- 	<c:if test="${principalId == question.userId }">
		<a href="/qna/question/update/${question.id}">수정</a>
		<a href="/qna/question/delete/${question.id}">삭제</a>
	</c:if>
	<ul>
		<li>${question.title}</li>
		<li>${question.categoryName}</li>
		<li>${question.username}</li>
		<li>${question.content}</li>
		<li>${question.createdAt()}</li>
	</ul> --%>
	
<%-- 	<c:if test="${principalId == question.userId }">
		<a href="/qna/question/update/${question.id}">수정</a>
		<a href="/qna/question/delete/${question.id}">삭제</a>
	</c:if> --%>
	
	<table class="table">
	<tr>
		<td>${question.title}</td>
		<td>${question.categoryName}</td>
		<td>${question.username}</td>
	</tr>
	<tr>
		<td colspan="3">${question.content}${question.content}${question.content}
		<br>
		${question.content}${question.content}${question.content}
		<br>
		${question.content}${question.content}${question.content}
		<br>
		${question.content}${question.content}${question.content}
		<br>
		${question.content}${question.content}${question.content}
		<br>
		${question.content}${question.content}${question.content}</td>
		<td></td>
		<td></td>
	</tr>
	</table>	
	
	<ul>
		<li></li>
		<li></li>
		<li>${question.createdAt()}</li>
	</ul>


</body>
</html>