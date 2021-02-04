<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 콤마를 찍기위한  -->
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>달력</title>
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
	<h1>달력</h1>
	
		<div>
			<span  style= 'color: #0066FF;'>
				이번달 수입 :
				<fmt:formatNumber type="number" value="${sumIn}"/>
			</span>
			<span style= 'color: #FF3300;'>
				이번달 지출 :
				<fmt:formatNumber type="number" value="${sumOut}"/>
			</span>
			<span style= 'color: #151515;'>
				합계 : 
				<fmt:formatNumber type="number" value="${sumIn - sumOut}"/>
			</span>
		</div>
	
	<h3>
		<a href="${pageContext.request.contextPath}/admin//cashbookByMonth?currentYear=${currentYear}&currentMonth=${currentMonth-1}">&lt;</a>
		${currentYear}년 ${currentMonth} 월
		<a href="${pageContext.request.contextPath}/admin//cashbookByMonth?currentYear=${currentYear}&currentMonth=${currentMonth+1}">&gt;</a>
	</h3>
	<div>
		<table class="table table-hover  calendar">
			<thead>
				<tr>
					<th class="sunday">일</th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th class= saturday>토</th>
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
								<div ><!-- 날짜 -->
									<!--토요일 -->
									<c:if test="${i%7 == 0}">
										<a class="saturday"  href="${pageContext.request.contextPath}/admin/cashbookByDay/now/${currentYear}/${currentMonth}/${i-(firstDayOfWeek-1)}">
											${i-(firstDayOfWeek-1)}
										</a>
									</c:if>
									<!--일요일 -->
									<c:if test="${i%7 == 1}">
										<a style= 'color: #ff210c;' href="${pageContext.request.contextPath}/admin/cashbookByDay/now/${currentYear}/${currentMonth}/${i-(firstDayOfWeek-1)}">
											${i-(firstDayOfWeek-1)}
										</a>
									</c:if>
									<!-- 월 ~ 금 요일 -->
									<c:if test="${i%7 != 0 && i%7 != 1}">
										<a style= 'color: #151515;' href="${pageContext.request.contextPath}/admin/cashbookByDay/now/${currentYear}/${currentMonth}/${i-(firstDayOfWeek-1)}">
											${i-(firstDayOfWeek-1)}
										</a>
									</c:if>
								</div>
								<!-- 지출/수입 목록이 있는 날짜를 cashList에서 검색 -->
								<c:forEach var="c" items="${cashList}">
									<c:if test="${i-(firstDayOfWeek-1) == c.dday}">
										<c:if test="${c.cashbookKind == '수입'}">
											<div style= 'color: #0066FF;'> + 
												<fmt:formatNumber type="number" value="${c.cashbookPrice}"/>
											</div>
										</c:if>
										<c:if test="${c.cashbookKind == '지출'}">
											<div  style= 'color: #FF3300;'> -
												<fmt:formatNumber type="number" value="${c.cashbookPrice}"/>
											</div>
										</c:if>
									</c:if>
								</c:forEach>
							</td>
						</c:if>
						<!-- 달력에서 주가바뀔 때마다 줄바꿈 -->
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