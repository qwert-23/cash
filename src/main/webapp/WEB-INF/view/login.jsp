<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style type="text/css">
 input{
      line-height: 0;
      font-size: 17px;
      width: 100%;
      display: block;
      box-sizing: border-box;
      padding: 10px 15px;
      border-radius: 60px;
      font-weight: 100;
      letter-spacing: 0.01em;
      position: relative;
      }
div.question{
    position: relative;
    padding: 10px 0;
    }
</style>
</head>
<body>
	
	<div class='container'>
	<h1>공지</h1>
	<div>
		<table class="table">
			<thead>
				<tr>
					<th>No.</th>
					<th>제목</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="n" items="${noticeList}">
					<tr>
						<td>${n.noticeId}</td>
						<td>${n.noticeTitle}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<h1>로그인</h1>
	<form method="post" action="${pageContext.request.contextPath}/login">
		<div class="question">
			ID : <input type="text" name="id" value="goodee" placeholder="ID를 입력해주세요!">
		</div>
		<div class="question">
			PW : <input type="password" name="pw" value="1234" placeholder="PW를 입력해주세요!">
		</div>
		<div>
			<button  id ='loginBtn' class="btn btn-outline-success" type="submit">로그인</button>
		</div>
	</form>
	</div>
</body>
</html>