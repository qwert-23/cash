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
	<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
  
	<div id="table">
		<div >
			<h2>연도별 카테고리 통합지출</h2>
		
		</div>
		<div>
				<span>&nbsp;</span>
				<p style ="font-size:30px;">검색할 연도를 입력해주세요</p>	
				<input type="text" id="year">
				<button id="selectOutMaxCategoryYear" type="button">입력</button>
		</div>
		<div>
			<span id="selectOutMaxCategoryYearTableResult"></span>
		</div>
			<!-- chart -->
	 	<div id="newChart">
			<canvas id="chartX"></canvas>
		</div>
	</div>
</body>

<script>
	<!-- chart -->
$('#selectOutMaxCategoryYear').click(function(){
	$('#Mychart3').remove();<!-- 전의 chhart랑 겹치게 나와 전 차트지움 -->
	//chart.js 동적 크기
	$('#newChart').append('<canvas id="chart3" style="height:40vh; width:70vw"></canvas>'); 
	$.ajax({
		url:'/selectOutMaxCategoryYear/'+$('#year').val(),
		type:'get',
		success:function(data){
			console.log(data);
			var ctx = document.getElementById('chart3').getContext('2d');
			var chart = new Chart(ctx, {
				type:'pie', // chart 종류
				data:{
					labels:['관광','생활','식비','의료'], // x축, y축
					datasets:[{
						label:'연도별 월 통합수입내역',
						 backgroundColor: [	//배경색
							  //	  R    G  B   A(투명도)
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
					                'rgba(128, 0, 127, 0.2)'//보라
				            ],
				          
						data:[data.관광, data.생활, data.식비, data.의료 
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
$('#selectOutMaxCategoryYear').click(function(){
	$.ajax({
		url:'/selectOutMaxCategoryYear/'+$('#year').val(),
		type:'get',
		success:function(data){
			console.log(data);
			let html = `
				<table id="table" border="1">
					<tr>
						<th>year\\카테고리</th>
						<th>관광</th>
						<th>생활</th>
						<th>식비</th>
						<th>의료</th>
					
					</tr>
					<tr>
						<td>\${$('#year').val()}</td>
						<td>\${data.관광}</td>
						<td>\${data.생활}</td>
						<td>\${data.식비}</td>
						<td>\${data.의료}</td>		
					</tr>
				</table>
			`;
			$('#selectOutMaxCategoryYearTableResult').html(html);
		}
	});
});
</script>
</html>