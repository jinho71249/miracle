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
 	 <h1>비밀번호 찾기</h1>
 	 <hr>
 	 	<form action="PwdSearch" method="POST">
			아이디 <input type="text" name="user_Id" required><br>
			전화번호 <input type="tel" name="user_Tel" required><br>
			생년월일 <input type="text" name="user_Birth" required><br>
			<button type="submit">비밀번호 찾기</button>
		</form>
	</div>
	
</body>
</html>