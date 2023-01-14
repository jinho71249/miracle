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
		<h1>아이디 찾기</h1>
		<hr>
		<form:form action="idSearchCom" modelAttribute="data">
		
			이름 <!-- <input type="text" name="user_Name" required> -->
				<form:input path="user_Name"/>
				<form:errors path="user_Name"/><br>
			전화번호 <!-- <input type="tel" name="user_Tel" required> -->
				<form:input path="user_Tel"/>
				<form:errors path="user_Tel"/><br>
			생년월일 <!-- <input type="text" name="user_Birth" required> -->
				<form:input path="user_Birth"/>
				<form:errors path="user_Birth"/><br>
				${message}<br>
			<button type="submit">아이디 찾기</button>
		
		</form:form>
	</div>
</body>
</html>