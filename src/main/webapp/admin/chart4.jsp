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
			<h2>연도 카테고리별  통합 수익 </h2>
		
		</div>
		<div>
				<span>&nbsp;</span>
				<p style ="font-size:30px;">검색할 년도를 입력해주세요</p>	
				<input type="text" id="year">
				<button id="selectInCategoryYear" type="button">입력</button>
		</div>
		<div>
			<span id="selectInCategoryYearTableResult"></span>
		</div>
			<!-- chart -->
	 	<div id="newChart">
			<canvas id="chartX"></canvas>
		</div>
	</div>
</body>

<script>
	<!-- chart -->
$('#selectInCategoryYear').click(function(){
	$('#Mychart4').remove();<!-- 전의 chhart랑 겹치게 나와 전 차트지움 -->
	//chart.js 동적 크기
	$('#newChart').append('<canvas id="chart4" style="height:40vh; width:70vw"></canvas>'); 
	$.ajax({
		url:'/selectInCategoryYear/'+$('#year').val(),
		type:'get',
		success:function(data){
			console.log(data);
			var ctx = document.getElementById('chart4').getContext('2d');
			var chart = new Chart(ctx, {
				type:'doughnut', // chart 종류
				data:{
					labels:['급여','용돈'], // x축, y축
					datasets:[{
						label:'2020년 월별 주간 통합 지출',
						 backgroundColor: [	//배경색
							  //	  R    G  B   A(투명도)
				             
				                'rgba(255, 255, 0, 0.2)',//노랑
				                'rgba(125, 205, 0, 0.2)'//연두
				           
				              
				                
				            ],
				            borderColor: [	//테두리 색
					            //	  R    G  B   A(투명도)
				            
					                'rgba(255, 255, 0, 0.2)',//노랑
					                'rgba(125, 205, 0, 0.2)'//연두
					            
				            ],
				          
						data:[data.급여, data.용돈
						],
						
					}]
				}, 
				options:{
					responsive: false,
					}
			});
		}
	});
});
	<!--table -->
$('#selectInCategoryYear').click(function(){
	$.ajax({
		url:'/selectInCategoryYear/'+$('#year').val(),
		type:'get',
		success:function(data){
			console.log(data);
			let html = `
				<table id="table" border="1">
					<tr>
						<th>year\\카테고리</th>
						<th>급여</th>
						<th>용돈</th>
					
					
					</tr>
					<tr>
						<td>\${$('#year').val()}</td>
						<td>\${data.급여}</td>
						<td>\${data.용돈}</td>					
					</tr>
				</table>
			`;
			$('#selectInCategoryYearTableResult').html(html);
		}
	});
});
</script>
</html>