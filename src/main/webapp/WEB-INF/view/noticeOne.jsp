<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoticeOne</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script >

</script>

</head>
<body>
		<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
		<div class="container">
	<h1>NoticeOne</h1>
	</div>
	<div class="container">
		<table class="table">
			<tr>
				<td>No.${notice.noticeId}</td>
				<td>작성시간: ${notice.noticeDate}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${notice.noticeContent}</td>
			</tr>
		</table>
	
	<h3>첨부파일</h3>
	<table class="table">
		<c:forEach var="nf" items="${noticeOne.noticefile}">
			<tr>
				<td><a href="${pageContext.request.contextPath}/upload/${nf.noticefileName}">${nf.noticefileName}</a></td>
			</tr>
		</c:forEach>
	</table>
	
	<h3>댓글</h3>
	<table class="table">
		<thead>
			<tr>
				<th>내용</th>
				<th>작성일</th>
				
			
			</tr>
			
		</thead>
			<!--  댓글이 있을경우 -->
			<c:forEach var="c" items="${notice.commentList}">
			<c:if test="${c.commentDate != null}">
				<tr>
				
					<td>${c.commentContent}</td>
					<td>${c.commentDate}</td>
					
					<td>
						<a class="btn btn-outline-danger " href="${pageContext.request.contextPath}/admin/removeComment?noticeId=${c.noticeId}&commentId=${c.commentId}">삭제</a>
					</td>
					
				</tr>
			</c:if>
			<!-- 댓글이 없을경우 -->
			<c:if test="${c.commentContent == null}">
				<tr>
				
					<td>댓글이 없습니다!</td>
					
				</tr>
			</c:if>
			</c:forEach>
		
	</table>
	
	<form  id ="formId" action="${pageContext.request.contextPath}/admin/addComment" method="post">
		<input type="hidden" name="noticeId" value="${notice.noticeId}">
		<textarea id="contentId" name="commentContent" rows="3" cols="50"></textarea>
		<button  id ='submitBtn' class="btn btn-outline-info" type="submit">댓글입력</button>
	</form>
	</div>
</html>