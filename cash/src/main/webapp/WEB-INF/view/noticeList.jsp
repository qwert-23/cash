<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	
	<h1>noticeList</h1>
	
	<div>
		<table	border="1">
			<thead>
				<tr>
					<th>notice_Id</th>
					<th>notice_title</th>
					<th>notice_content</th>	
					<th>notice_date</th>
					<th>수정</th>	
					<th>삭제</th>
				</tr>
				
			</thead>
			<tbody>
					<c:forEach var ="n" items= "${noticeList}">
						<tr>
							<td>${n.noticeId}</td>
							<td>${n.noticeTitle}</td>
							<td>${n.noticeContent}</td>
							<td>${n.noticeDate}</td>
							<td><a href=""></a>수정</td>
							<td><a href=""></a>삭제</td>
					
						</tr>
					
					</c:forEach>
			
			</tbody>
		
		</table>
		
		<div>
		<c:if test="${currentPage > 1}">
			<a href="${pageContext.request.contextPath}/admin/noticeList/1">처음</a>
			<a href="${pageContext.request.contextPath}/admin/noticeList/${currentPage-1}">이전</a>
		</c:if>
		<c:if test="${currentPage < lastPage}">
			<a href="${pageContext.request.contextPath}/admin/noticeList/${currentPage+1}">다음</a>
			<a href="${pageContext.request.contextPath}/admin/noticeList/${lastPage}">마지막</a>
		</c:if>
	</div>
		
	</div>
</body>
</html>