<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/assets/css/style.css" rel="stylesheet">	
<link rel="stylesheet" href="/assets/css/list.css" />
<%@include file="../layout/header.jsp"%>
<style>

table td{
	border: 1px solid black; 
}

</style>

<%-- 	<table>
		<!-- 질문 -->
		<tr>
			<td>${question.title}</td>
			<td>${question.createdAt()}</td>
		</tr>
		<tr>
			<td>${question.content}</td>
		</tr>

		<!-- 답 -->
		<tr>
			<td>${answer.content}</td>
			<td>${answer.createdAt()}</td>
		</tr>
	</table> --%>
<%-- 	<table>
		<!-- 질문 -->
		<tr>
			<td>질문제목제목제목제목제목제목제목제목제목제목</td>
			<td>${question.createdAt()}</td>
		</tr>
		<tr>
			<td colspan="2">질문내용내용내용내용내용내용내용내용내용내용내용
			내용내용내용내용내용내용내용내용내용내용내용내용</td>
			<td></td>
		</tr>
		</table>
		
		<br>
		
		<table>
		<!-- 답 -->
		<tr>
			<td>답내용답내용답내용답내용답내용답내용답내용</td>
			<td>${answer.createdAt()}</td>
		</tr>
	</table> --%>
		<!-- 질문 -->
		<ul>
		<li>질문제목제목제목제목제목제목제목제목제목제목제목제목제목</li>
		<li>${question.createdAt()}</li>	
		<li>내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
		<br>
		내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</li>			
		</ul>
		
		<!-- 답 -->
		<ul>
		<li>답내용답내용답내용답내용답내용답내용답내용
		<br>
		답내용답내용답내용답내용답내용답내용답내용
		답내용답내용답내용답내용답내용답내용답내용		
		</li>
		<li>${answer.createdAt()}</li>
		</ul>
		

			

</body>
</html>