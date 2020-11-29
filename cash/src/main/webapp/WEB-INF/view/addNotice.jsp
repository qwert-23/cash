<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addBoard</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#addBtn').click(function(){
		let html = '<div><input type="file" name="noticefile" class="noticefile"></div>';
		$('#fileinput').append(html);
	});

	$('#delBtn').click(function(){
		$('#fileinput').children().last().remove();
	})

	$('#submitBtn').click(function(){
		let ck = true;
		$('.noticefile').each(function(index, item){
			console.log($(item).val());
			if($(item).val() == '') {
				ck = false;
			}
		})
		if(ck == false) { // if(ck)
			alert('선택하지 않은 파일이 있습니다');
		} else {
			$('#fileuploadFrom').submit();
		}
	});
});
</script>
</head>
<body>
	<form id="fileuploadFrom" method="post" 
		  enctype="multipart/form-data" 
		  action="${pageContext.request.contextPath}/admin/addNotice">
		<table border="1">
		
			<tr>
				<td>공지사항제목</td>
				<td><input type="text" name="noticeTitle"></td>
			</tr>
			<tr>
				<td>공지사항내용</td>
				<td><textarea name="noticeContent" rows="5" cols="50"></textarea></td>
			</tr>
			<tr>
				<td>파일첨부</td>
				<td>
					<div>
						<button type="button" id="addBtn">파일추가</button>
						<button type="button" id="delBtn">파일삭제</button>
					</div>
					<div id="fileinput">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" id="submitBtn">작성</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>