<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
 	<ul class="navbar-nav">
 	   <li class="nav-item">
			<a class="nav-link" href="/cash/admin/index">Index</a>
	  </li>
	   <li class="nav-item">
			<a  class="nav-link" href="/cash/admin/cashbookByMonth">달력</a>
	 </li>
	 <li class="nav-item">
		<a  class="nav-link" href="/cash/admin/cashbookList/1">리스트</a>
	 </li>
	  <li class="nav-item">
		 <a  class="nav-link" href="/cash/admin/noticeList/1">Notice</a>
	 </li>
	  <li class="nav-item  dropdown">
	  		<a class="nav-link dropdown-toggle" id="navbardrop" data-toggle="dropdown">
				통계자료
	  		</a>
		<div class="dropdown-menu">
			<a  class="nav-link" href="/cash/admin/chart1.jsp">월 통합 지출내역</a>
			<a  class="nav-link" href="/cash/admin/chart2.jsp">월 통합 수익내역</a>
			<a  class="nav-link" href="/cash/admin/chart3.jsp">카테고리 통합지출</a>
			<a  class="nav-link" href="/cash/admin/chart4.jsp">카테고리 통합수익</a>
		</div>
	 </li>
	 
	 <li class="nav-item">
		<a  class="nav-link" href="/cash/admin/addMember">사용자 추가</a>
	 </li>
	<li class="nav-item">
		<a  class="nav-link" href="/cash/admin/logout">logout</a>
	</li>
	</ul>
</nav>