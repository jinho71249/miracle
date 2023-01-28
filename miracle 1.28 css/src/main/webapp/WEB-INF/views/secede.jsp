<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1> 회원탈퇴 </h1>


	
<form:form action="secede" modelAttribute="secededata"> 
		아이디 
		<form:input path="user_Id"/>
		<form:errors path="user_Id"/>
		<br>
		
   		 비밀번호  <form:input path="user_Pwd"/>
		<form:errors path="user_Pwd"/>
		<br>
		
		<button type="submit" name="secedeBtn"> 회원탈퇴하기</button>
		<br>

</form:form>

<%-- <form action="secede" method="POST">
	아이디
	<input type="text" name="user_Id"> <br>
	비밀번호
	<input type="password" name="user_Pwd"> 
	
	<button type="submit" name="secedeBtn"> 회원탈퇴하기</button>
	
</form>
 --%>


</body>
</html>