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
  <form action="regiModi" method="Post">
    
    아이디 <input type="text" name="user_Id" value="${curLogin.user_Id}" readonly><br>
    비밀번호* <input type="password" name="user_Pwd" required><br>
    비밀번호 확인*<input type="password" name="passwordChk" required><br>
    이름 <input type="text" name="user_Name" value="${curLogin.user_Name}" readonly><br>
    전화번호 <input type="tel" name="user_Tel" required><br>
    이메일 <input type="email" name="user_Email"><br>
    생년월일 <input type="text" name="user_Birth" value="${curLogin.user_Birth}" readonly><br>
    
    <br><br> 
    <button type="reset"> 삭제하기</button>
    <button type="submit" name="regiModiBtn"> 회원정보수정 </button>
 </form>
</div> 
	

</body>
</html>