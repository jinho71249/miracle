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
	<div>
		<form:form action="register" modelAttribute="data"> 
			<p>*은 필수입력사항입니다</p>
			<br>

   			 아이디* <form:input path="user_Id"/> 
   			 <form:errors path="user_Id"/>
			<br>
			
   			 비밀번호* <form:input path="user_Pwd"/> 
   			<form:errors path="user_Pwd"/>
			<br>
			
   			 비밀번호 확인*<form:input path="user_Pwdck"/> 
   			 <form:errors path="user_Pwdck"/>
			<br>
			
   			 이름* <form:input path="user_Name"/>
   			 <form:errors path="user_Name"/>

			<br>
			
   			 전화번호* <form:input path="user_Tel"/> 
   			 <form:errors path="user_Tel"/>
			<br>
			
    		이메일 <form:input path="user_Email"/> 
    		<form:errors path="user_Email"/>
			<br>
			
    		생년월일* <form:input path="user_Birth"/> 
    		<form:errors path="user_Birth"/>
			<br>
			
			<input type="hidden" name="user_Admin" value="${user_Admin}"> 
			<form:hidden path="user_Admin"/> 

			<input type="checkbox" name="agree" value="true" required="required">
   			개인정보 수집 및 이용에 동의합니다.
    <br>
			<br>

			<button type="submit" name="registerBtn">회원가입</button>
		</form:form>
	</div>

</body>
</html>