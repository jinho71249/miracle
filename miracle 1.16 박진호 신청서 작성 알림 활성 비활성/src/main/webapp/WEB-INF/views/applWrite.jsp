<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    img{
      width: 200px;
      height: 240px;
    }
  </style>
<body>
<div>
	<h1>입양신청서</h1>
	<img alt="동물사진" src="${appl.appl_Ado_AniPic}">
	<form:form action="applWriteAfter" modelAttribute="appl" method="post"> 
		<form:hidden path="appl_Ado_Num"/>
		<form:hidden path="appl_Ado_AniPic"/>
		<br>
		
		신청인 성명 : <form:input path="appl_Name"/>
			  	  <form:errors path="appl_Name"/> <br>
			  	  
		성 별 : <form:radiobutton path="appl_Gender" value="0"/>남성 
			  <form:radiobutton path="appl_Gender" value="1"/>여성 <br>
	
		나 이 : <form:input path="appl_Age"/>
			  <form:errors path="appl_Age"/> <br>
		
		전화번호 : <form:input path="appl_Tel"/>
			  	<form:errors path="appl_Tel"/> <br>

		이메일 : <form:input path="appl_Email"/>
			   <form:errors path="appl_Email"/> <br>
			  	
		연락 가능 시간 : <form:input path="appl_Contact"/>
			   <form:errors path="appl_Contact"/> <br>
			   
		주 소 : <form:input path="appl_Addr"/>
			  <form:errors path="appl_Addr"/> <br>
			   			   
		결혼 여부 : <form:radiobutton path="appl_Mar" value="0"/>미혼 
			  	 <form:radiobutton path="appl_Mar" value="1"/>기혼<br>

		직 업 : <form:input path="appl_Job"/>
			  <form:errors path="appl_Job"/> <br>

		<button type="submit">신청하기</button> 
		
	</form:form>
	
		
</div>
</body>
</html>