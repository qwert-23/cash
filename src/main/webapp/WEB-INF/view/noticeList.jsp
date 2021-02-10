<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoticeList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="container">
	
	<h1>NoticeList</h1>
	
		<div><a href="${pageContext.request.contextPath}/admin/addNotice">글쓰기</a></div>	
		<table class="table">
		
			<thead>
				<tr>
					<th>No.</th>
					<th>제목</th>
					<th>작성 날짜</th>
				</tr>
				
			</thead>
			<tbody>
					<c:forEach var ="n" items= "${noticeList}">
						<tr>
							<td>${n.noticeId}</td>
							<td><a href="${pageContext.request.contextPath}/admin/noticeOne/${n.noticeId}">${n.noticeTitle}</a></td>
							<td>${n.noticeDate}</td>
					
						</tr>
					
					</c:forEach>
			
			</tbody>
		
		</table>
		
		<div class="container">
		
		<!--처음 페이지일 경우 처음,이전 표시 -->
		<c:if test="${currentPage == 1}">
			<a class="btn btn-outline-info" href="#">처음</a>
			<a class="btn btn-outline-info" href="#">이전</a>
		</c:if>
		
		<!-- 처음,이전 -->
		<c:if test="${currentPage > 1}">
			<a class="btn btn-outline-info" href="${pageContext.request.contextPath}/admin/noticeList/1">처음</a>
			<a class="btn btn-outline-info"href="${pageContext.request.contextPath}/admin/noticeList/${currentPage-1}">이전</a>
		</c:if>
		
		<!--  다음, 마지막 -->
		<c:if test="${currentPage < lastPage}">
			<a class="btn btn-outline-info" href="${pageContext.request.contextPath}/admin/noticeList/${currentPage+1}">다음</a>
			<a class="btn btn-outline-info" href="${pageContext.request.contextPath}/admin/noticeList/${lastPage}">마지막</a>
		</c:if>
		
		<!-- 마지막일경우 다음과 마지막을 표시하기 위해 -->
		<c:if test="${currentPage == lastPage}">
			<a class="btn btn-outline-info" href="#">다음</a>
			<a class="btn btn-outline-info" href="#">마지막</a>
		</c:if>
	</div>
		
	</div>
</body>
</html>