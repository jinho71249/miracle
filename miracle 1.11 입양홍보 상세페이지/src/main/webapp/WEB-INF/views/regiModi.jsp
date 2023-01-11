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
  <form action="">
    
    아이디 <input type="text" name="userId" value="이용자아이디" readonly><br>
    비밀번호* <input type="password" name="password" required><br>
    비밀번호 확인*<input type="password" name="passwordChk" required><br>
    이름 <input type="text" name="userName" value="이용자이름" readonly><br>
    전화번호 <input type="tel" name="userTel" required><br>
    이메일 <input type="email" name="userEmail"><br>
    생년월일 <input type="date" name="userBirth" value="이용자의 생년월일" readonly><br>
    
    <br><br>
    <button type="reset"> 삭제하기</button>
    <button type="submit" name="regiModiBtn"> 회원정보수정 </button>
 </form>
</div> 
	

</body>
</html>