<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- �޸��� �������  -->
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�޷�</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
	.sunday {color : #FF0000;}
	.saturday  {color: #0000FF;}
td.calendar {
	height: 120px;
	width: 120px;
	vertical-align: top;
}

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class='container'>
	<h1>�޷�</h1>
	
		<div>
			<span  style= 'color: #0066FF;'>
				�̹��� ���� :
				<fmt:formatNumber type="number" value="${sumIn}"/>
			</span>
			<span style= 'color: #FF3300;'>
				�̹��� ���� :
				<fmt:formatNumber type="number" value="${sumOut}"/>
			</span>
			<span style= 'color: #151515;'>
				�հ� : 
				<fmt:formatNumber type="number" value="${sumIn - sumOut}"/>
			</span>
		</div>
	
	<h3>
		<a href="${pageContext.request.contextPath}/admin//cashbookByMonth?currentYear=${currentYear}&currentMonth=${currentMonth-1}">&lt;</a>
		${currentYear}�� ${currentMonth} ��
		<a href="${pageContext.request.contextPath}/admin//cashbookByMonth?currentYear=${currentYear}&currentMonth=${currentMonth+1}">&gt;</a>
	</h3>
	<div>
		<table class="table table-hover  calendar">
			<thead>
				<tr>
					<th class="sunday">��</th>
					<th>��</th>
					<th>ȭ</th>
					<th>��</th>
					<th>��</th>
					<th>��</th>
					<th class= saturday>��</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:forEach var="i" begin="1" end="${lastDay+(firstDayOfWeek-1)}" step="1">
						<c:if test="${i-(firstDayOfWeek-1) < 1}">
							<td>&nbsp;</td>
						</c:if>
						<c:if test="${i-(firstDayOfWeek-1) > 0}">
						<td class="calendar">
								<div ><!-- ��¥ -->
									<!--����� -->
									<c:if test="${i%7 == 0}">
										<a class="saturday"  href="${pageContext.request.contextPath}/admin/cashbookByDay/now/${currentYear}/${currentMonth}/${i-(firstDayOfWeek-1)}">
											${i-(firstDayOfWeek-1)}
										</a>
									</c:if>
									<!--�Ͽ��� -->
									<c:if test="${i%7 == 1}">
										<a style= 'color: #ff210c;' href="${pageContext.request.contextPath}/admin/cashbookByDay/now/${currentYear}/${currentMonth}/${i-(firstDayOfWeek-1)}">
											${i-(firstDayOfWeek-1)}
										</a>
									</c:if>
									<!-- �� ~ �� ���� -->
									<c:if test="${i%7 != 0 && i%7 != 1}">
										<a style= 'color: #151515;' href="${pageContext.request.contextPath}/admin/cashbookByDay/now/${currentYear}/${currentMonth}/${i-(firstDayOfWeek-1)}">
											${i-(firstDayOfWeek-1)}
										</a>
									</c:if>
								</div>
								<!-- ����/���� ����� �ִ� ��¥�� cashList���� �˻� -->
								<c:forEach var="c" items="${cashList}">
									<c:if test="${i-(firstDayOfWeek-1) == c.dday}">
										<c:if test="${c.cashbookKind == '����'}">
											<div style= 'color: #0066FF;'> + 
												<fmt:formatNumber type="number" value="${c.cashbookPrice}"/>
											</div>
										</c:if>
										<c:if test="${c.cashbookKind == '����'}">
											<div  style= 'color: #FF3300;'> -
												<fmt:formatNumber type="number" value="${c.cashbookPrice}"/>
											</div>
										</c:if>
									</c:if>
								</c:forEach>
							</td>
						</c:if>
						<!-- �޷¿��� �ְ��ٲ� ������ �ٹٲ� -->
						<c:if test="${i%7 == 0}">
							<tr></tr>
						</c:if>
					</c:forEach>
					<c:if test="${(lastDay+(firstDayOfWeek-1)) % 7 != 0}">
						<c:forEach begin="1" end="${7- ((lastDay+(firstDayOfWeek-1)) % 7)}" step="1">
							<td>&nbsp;</td>
						</c:forEach>
					</c:if>
				</tr>
			</tbody>
		</table>
	</div>
	</div>
</body>
</html>