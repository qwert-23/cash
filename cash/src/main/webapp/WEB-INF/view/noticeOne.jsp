<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeOne</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
		<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>noticeOne</h1>
<table border="1">
			<tr>
				<td>번호</td>
				<td>${notice.noticeId}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${notice.noticeTitle}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${notice.noticeContent}</td>
			</tr>
			<tr>
				<td>작성시간</td>
				<td>${notice.noticeDate}</td>
			</tr>
		</table>
	
	<h3>첨부파일</h3>
	<table border="1">
		<c:forEach var="nf" items="${noticeOne.noticefile}">
			<tr>
				<td>${nf.noticefileName}</td>
			</tr>
		</c:forEach>
	</table>
	
	<h3>댓글</h3>
	<table border="1">
		<c:forEach var="c" items="${notice.commentList}">
			<tr>
				<td>${c.commentContent}</td>
				<td>
					<a href="${pageContext.request.contextPath}/admin/removeComment/${board.noticeId}/${c.commentId}">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<form action="${pageContext.request.contextPath}/admin/addComment" method="post">
		<input type="hidden" name="noticeId" value="${noticeOne.noticeId}">
		<textarea name="commentContent" rows="3" cols="50"></textarea>
		<button type="submit">댓글입력</button>
	</form>
</html>