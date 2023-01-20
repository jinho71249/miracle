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
  <%-- <form action="userInfoModi" method="Post"> --%>
<form:form action="userInfoModi" modelAttribute="data"> 
    아이디 <input type="text" name="user_Id" value="${curLogin.user_Id}" readonly><br>
    비밀번호* <form:password path="user_Pwd"/>
    	<form:errors path="user_Pwd"/><br>
    비밀번호 확인*<input type="password" name="user_Pwdck" >
    <form:errors path="user_Pwdck"/>
    <br> 
    이름 <input type="text" name="user_Name" value="${curLogin.user_Name}" readonly><br>
    전화번호 <input type="tel" name="user_Tel" >
    <form:errors path="user_Tel"/><br>
    이메일	<form:input path="user_Email"/>
    	<form:errors path="user_Email"/><br>
    생년월일 <input type="text" name="user_Birth" value="${curLogin.user_Birth}" readonly><br>
    
    <br><br> 
    <button type="reset"> 재작성하기</button>
    <button type="submit" name="userInfoModiBtn"> 회원정보수정 </button>
 </form:form>  
<%--  </form> --%>
</div> 
	

</body>
</html>