<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style type="text/css">
body::before{
        content: "";
        background: url('/img/backgroundImg.png');
        background-size: cover;
        opacity: 0.3;
        position: fixed;
        top: 0px;
        left: 0px;
        right: 0px;
        bottom: 0px;
        z-index: -1;
    }
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
	
	a{ 
	text-decoration: none;
	color : black;}
	
	
</style>

</head>
<body>

<main class="form-signin w-100 m-auto text-center">

	<form:form action="login" modelAttribute="data"> 
		<br>
		<a href="main">
			<img class="mb-4" src="/img/logo.png" alt="" width="180px" height="200px">
		</a>
   		<h1 class="h3 mb-3 fw-normal">Login</h1>
   		<label>${message}</label>
		<div class="form-floating">
			<form:input path="user_Id" class="form-control" id="floatingInput" placeholder="아이디"/>
			<form:errors path="user_Id"/>
			<label for="floatingInput">아이디</label>
			
		</div>
		<div class="form-floating">
   		    <form:password path="user_Pwd" class="form-control" id="floatingPassword" placeholder="비밀번호"/>
			<label for="floatingPassword">비밀번호</label>
			<form:errors path="user_Pwd"/>
		</div>
		<br>
		<input type="hidden" name="returnPath" value="${returnPath}"> 
		
		<button type="submit" name="loginBtn" class="w-100 btn btn-lg btn-secondary">로그인하기</button>
		<br>

	</form:form>
	
	<br>
	<a href="idSearch">아이디찾기</a>
	<a href="pwdSearch">비밀번호찾기</a>
	<a href="regSelect">회원가입</a>
</main>

	<jsp:include page="menu.jsp"></jsp:include>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>