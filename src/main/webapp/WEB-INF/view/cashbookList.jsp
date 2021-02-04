<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>리스트</h1>
	<a href="${pageContext.request.contextPath}/admin/cashbookListExcel">[전체 cashbook 리스트를 엑셀 파일로 다운]</a>
	<table class="table">
		<thead>
			<tr>
				<th>No.</th>
				<th>수입/지출</th>
				<th>분류</th>
				<th>금액</th>
				<th>내용</th>
				<th>수입/지출 날짜</th>
				<th>작성 날짜</th>
				<th>수정 날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="c" items="${cashbookList}">
				<tr>
					<td>${c.cashbookId}</td>
					<td>${c.cashbookKind}</td>
					<td>${c.categoryName}</td>
					<td>${c.cashbookPrice}</td>
					<td>${c.cashbookContent}</td>
					<td>${c.cashbookDate}</td>
					<td>${c.createDate}</td>
					<td>${c.updateDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<c:if test="${currentPage != 1}">
			<a href="${pageContext.request.contextPath}/admin/cashbookList/${currentPage-1}">[이전]</a>
		</c:if>
			<a href="${pageContext.request.contextPath}/admin/cashbookList/${currentPage+1}">[다음]</a>
	</div>
</body>
</html>