<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>
<body>
<div>
	<h1>입양홍보 게시글 작성</h1><!-- enctype="multipart/form-data" -->
	<form:form action="adoBoardWriteAfter" enctype="multipart/form-data" modelAttribute="adoption"> 
	
		<input type="file" id="file" name="file" required="required"><br>
		
		<form:hidden path="ado_User_Name"/>
		
		품 종 : <form:input path="ado_Breed"/>
			  <form:errors path="ado_Breed"/> <br>
			  
		나 이 : <form:input path="ado_AniAge"/>
			  <form:errors path="ado_AniAge"/>
			  <br>
		
		접종 여부 : <form:input path="ado_AniVaccin"/>
				 <form:errors path="ado_AniVaccin"/><br>
		성 별 : <form:radiobutton path="ado_AniGender" value="0"/>수컷 
			  <form:radiobutton path="ado_AniGender" value="1"/>암컷 <br>
			  
		몸무게 : <form:input path="ado_AniWeight"/>
			   <form:errors path="ado_AniWeight"/><br>
			   
		발견장소 : <form:input path="ado_AniDiscovery"/>
			    <form:errors path="ado_AniDiscovery"/><br>
		
		현 상태 : 
		<form:select path="ado_AniCon" class="form-select" aria-label="Default select example">
			<form:option value="보호중">보호중</form:option>
			<form:option value="입양 완료">입양 완료</form:option>
			<form:option value="임시 보호">임시 보호</form:option>
			<form:option value="사망">사망</form:option>
		</form:select>
		<br>
		
		등록자 아이디 : <form:input path="ado_User_Id" readonly="true"/><br>
		
		전화번호 : <form:input path="ado_Tel"/>
				<form:errors path="ado_Tel"/><br>
		
		현재 보호 장소 : <form:input path="ado_AniCareplace"/>
				    <form:errors path="ado_AniCareplace"/><br>
		
		<button type="submit">등록하기</button> 
	</form:form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>