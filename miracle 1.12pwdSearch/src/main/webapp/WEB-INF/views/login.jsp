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


	<form:form action="login" modelAttribute="data"> 
		아이디  <form:input path="user_Id"/>
		<form:errors path="user_Id"/>
		<br>
		
   		 비밀번호  <form:input path="user_Pwd"/>
		<form:errors path="user_Pwd"/>
		<br>
		
		<button type="submit" name="loginBtn">로그인하기</button>
		<br>

	</form:form>
	
	<br>
	<a href="#">아이디찾기</a>
	<a href="pwdSearch">비밀번호찾기</a>
	<a href="#">회원가입</a>

</body>
</html>