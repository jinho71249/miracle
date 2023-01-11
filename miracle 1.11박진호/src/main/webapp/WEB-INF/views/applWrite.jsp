<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<h1>입양신청서</h1>
	<form action="">
		<input type="hidden" name="appl_Ado_Num" value=""> <!-- value 입양홍보글에서 가져옴 -->
		<img alt="포메" src="./img/01_dog_png" ><br>
		신청인 성명 :<input type="text" name="appl_Name" required><br>
		성  별 :	<input type="radio" name="appl_Gender" value="0" checked >남성
				<input type="radio" name="appl_Gender" value="1" >여성<br>
		나 이 : 	<input type="number" name="appl_Age" required><br>
		전화번호 : <input type="tel" name="appl_Tel" required><br>
		이메일 :  <input type="email" name="appl_Email" required><br>
		연락 가능 시간 : <input type="text" name="appl_Contact" required><br>
		주 소 : <input type="text" name="appl_Addr" required><br>
		결혼 여부 : <input type="radio" name="appl_Mar" value="0" checked> 미혼
				<input type="radio" name="appl_Mar" value="1"> 기혼<br>
		직 업 :	<input type="text" name="appl_Job" required><br>
		<button type="submit">신청하기</button> <button type="reset">다시 작성</button>
		
	</form>
	
		
</div>
</body>
</html>