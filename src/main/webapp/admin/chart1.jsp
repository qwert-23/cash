<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  table {
    width: 80%;
  }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script><!-- jQuery -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script><!-- chart.js -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- https://brunch.co.kr/@chulhochoiucj0/17   RGB 색 참고 사이트 -->
</head>
 	<body>
 	
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
  
	<div id="table">
		<div >
			<h2>연도별 월 통합지출내역</h2>
		
		</div>
		<div>
				<span>&nbsp;</span>
				<p style ="font-size:30px;">검색할 연도를 입력해주세요</p>	
				<input type="text" id="year">
				<button id="selectTotalOutOfYear" type="button">입력</button>
		</div>
		<div>
			<span id="totalOfMonthByYearTableResult"></span>
		</div>
			<!-- chart -->
	 	<div id="newChart">
			<canvas id="chartX"></canvas>
		</div>
	</div>
</body>

<script>

<!-- 전의 chhart랑 겹치게 나와 지움 -->
	//chart.js 동적 크기
	$('#chart1').remove();<!-- 전의 chhart랑 겹치게 나와 지움 -->
	$('#newChart').append('<canvas id="chart1" style="height:60vh; width:80vw"></canvas>'); 
	$.ajax({
		url:'${pageContext.request.contextPath}/selectTotalOutOfYear/'+2020,
		type:'get',
		success:function(data){
			console.log(data);
			var ctx = document.getElementById('chart1').getContext('2d');
			var chart = new Chart(ctx, {
				type:'horizontalBar', // chart 종류
				data:{
					labels:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // x축, y축
					datasets:[{
						label:'2020년 월 통합지출내역',
						 backgroundColor: [	//배경색
				                'rgba(255, 0, 0, 0.2)', //빨강
				                'rgba(252, 102, 0, 0.2)',//주황
				                'rgba(255, 255, 0, 0.2)',//노랑
				                'rgba(125, 205, 0, 0.2)',//연두
				                'rgba(0, 153, 0, 0.2)',//녹색
				                'rgba(128, 0, 127, 0.2)',//보라
				                'rgba(255, 0, 0, 0.2)', //빨강
				                'rgba(252, 102, 0, 0.2)',//주황
				                'rgba(255, 255, 0, 0.2)',//노랑
				                'rgba(125, 205, 0, 0.2)',//연두
				                'rgba(0, 153, 0, 0.2)',//녹색
				                'rgba(128, 0, 127, 0.2)'//보라
				            ],
				            borderColor: [	//테두리 색
					            //	  R    G  B   A(투명도)
				            	'rgba(255, 0, 0, 0.2)', //빨강
				                'rgba(252, 102, 0, 0.2)',//주황
				                'rgba(255, 255, 0, 0.2)',//노랑
				                'rgba(125, 205, 0, 0.2)',//연두
				                'rgba(0, 153, 0, 0.2)',//녹색
				                'rgba(128, 0, 127, 0.2)',//보라
				                'rgba(255, 0, 0, 0.2)', //빨강
				                'rgba(252, 102, 0, 0.2)',//주황
				                'rgba(255, 255, 0, 0.2)',//노랑
				                'rgba(125, 205, 0, 0.2)',//연두
				                'rgba(0, 153, 0, 0.2)',//녹색
				                'rgba(128, 0, 127, 0.2'//보라
				            ],
				          
						data:[data.January, data.February, data.March, data.April, data.May, data.June, 
							data.July, data.August,data.September,data.October,data.November,data.December],
					}]
				}, 
				options:{
					responsive: false,// 크기를 바꾸기위해 false
					}
			});
		}
	});






	<!-- chart -->
$('#selectTotalOutOfYear').click(function(){
	$('chart1').remove();<!-- 전의 chhart랑 겹치게 나와 지움 -->
	//chart.js 동적 크기
	$('#newChart').append('<canvas id="chart1" style="height:40vh; width:70vw"></canvas>'); 
	$.ajax({
		url:'${pageContext.request.contextPath}/selectTotalOutOfYear/'+$('#year').val(),
		type:'get',
		success:function(data){
			console.log(data);
			var ctx = document.getElementById('chart1').getContext('2d');
			var chart = new Chart(ctx, {
				type:'horizontalBar', // chart 종류
				data:{
					labels:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // x축, y축
					datasets:[{
						label:'연도별 월 통합지출내역',
						 backgroundColor: [	//배경색
				                'rgba(255, 0, 0, 0.2)', //빨강
				                'rgba(252, 102, 0, 0.2)',//주황
				                'rgba(255, 255, 0, 0.2)',//노랑
				                'rgba(125, 205, 0, 0.2)',//연두
				                'rgba(0, 153, 0, 0.2)',//녹색
				                'rgba(128, 0, 127, 0.2)',//보라
				                'rgba(255, 0, 0, 0.2)', //빨강
				                'rgba(252, 102, 0, 0.2)',//주황
				                'rgba(255, 255, 0, 0.2)',//노랑
				                'rgba(125, 205, 0, 0.2)',//연두
				                'rgba(0, 153, 0, 0.2)',//녹색
				                'rgba(128, 0, 127, 0.2)'//보라
				            ],
				            borderColor: [	//테두리 색
					            //	  R    G  B   A(투명도)
				            	'rgba(255, 0, 0, 0.2)', //빨강
				                'rgba(252, 102, 0, 0.2)',//주황
				                'rgba(255, 255, 0, 0.2)',//노랑
				                'rgba(125, 205, 0, 0.2)',//연두
				                'rgba(0, 153, 0, 0.2)',//녹색
				                'rgba(128, 0, 127, 0.2)',//보라
				                'rgba(255, 0, 0, 0.2)', //빨강
				                'rgba(252, 102, 0, 0.2)',//주황
				                'rgba(255, 255, 0, 0.2)',//노랑
				                'rgba(125, 205, 0, 0.2)',//연두
				                'rgba(0, 153, 0, 0.2)',//녹색
				                'rgba(128, 0, 127, 0.2'//보라
				            ],
				          
						data:[data.January, data.February, data.March, data.April, data.May, data.June, 
							data.July, data.August,data.September,data.October,data.November,data.December],
					}]
				}, 
				options:{
					responsive: false,// 크기를 바꾸기위해 false
					}
			});
		}
	});
});
	<!--table -->
$('#selectTotalOutOfYear').click(function(){
	$.ajax({
		url:'${pageContext.request.contextPath}/selectTotalOutOfYear/'+$('#year').val(),
		type:'get',
		success:function(data){
			console.log(data);
			let html = `
				<table id="table" border="1">
					<tr>
						<th>year\\월</th>
						<th>1월</th>
						<th>2월</th>
						<th>3월</th>
						<th>4월</th>
						<th>5월</th>
						<th>6월</th>
						<th>7월</th>
						<th>8월</th>
						<th>9월</th>
						<th>10월</th>
						<th>11월</th>
						<th>12월</th>
					</tr>
					<tr>
						<td>\${$('#year').val()}</td>
						<td>\${data.January}</td>
						<td>\${data.February}</td>
						<td>\${data.March}</td>
						<td>\${data.April}</td>
						<td>\${data.May}</td>
						<td>\${data.June}</td>
						<td>\${data.July}</td>
						<td>\${data.August}</td>
						<td>\${data.September}</td>
						<td>\${data.October}</td>
						<td>\${data.November}</td>
						<td>\${data.December}</td>
					</tr>
				</table>
			`;
			$('#totalOfMonthByYearTableResult').html(html);
		}
	});
});
</script>
</html>