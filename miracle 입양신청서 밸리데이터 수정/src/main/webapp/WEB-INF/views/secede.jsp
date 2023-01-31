<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style type="text/css">
	html,
	body {
	  height: 100%;
	}
	
	body {
	  display: flex;
	  align-items: center;
	  padding-top: 40px;
	  padding-bottom: 40px;
	  background-color: #f5f5f5;
	}	
	.form-signin {
  	  max-width: 330px;
	  padding: 15px;
	}
	
	.form-signin .form-floating:focus-within {
	  z-index: 2;
	}
	
	
</style>
</head>
<body class="text-center">

<main class="form-signin w-100 m-auto">	
	<form:form action="secede" modelAttribute="secededata"> 
	
		<a href="main">
			<img class="mb-4" src="/img/logo.png" alt="" width="180px" height="200px">
		</a>
		<h1 class="h3 mb-3 fw-normal">회원 탈퇴</h1>
		<div class="form-floating">
			<form:input path="user_Id" class="form-control" id="floatingInput" placeholder="아이디"/>
			<form:errors path="user_Id"/>
			<label for="floatingInput">아이디</label>
		</div>

		<div class="form-floating">
	   		<form:password path="user_Pwd"  class="form-control" id="floatingPassword" placeholder="비밀번호"/>
			<form:errors path="user_Pwd"/>
			<label for="floatingPassword">비밀번호</label>
		</div>
		<br>
		
		<button type="submit" name="secedeBtn" class="w-100 btn btn-lg btn-primary"> 회원탈퇴하기</button>
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
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>