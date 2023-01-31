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

		<form:form action="idSearchCom" modelAttribute="data">
			
			<a href="main">
				<img class="mb-4" src="/img/logo.png" alt="" width="180px" height="200px">
			</a>
	   		<h1 class="h3 mb-3 fw-normal">아이디 찾기</h1>
			<!-- <input type="text" name="user_Name" required> -->
			<div class="form-floating">
				<form:input path="user_Name" class="form-control" id="floatingInput" placeholder="이름"/>
				<form:errors path="user_Name"/>
				<label for="floatingInput">이름</label>
			</div><br>
			 <!-- <input type="tel" name="user_Tel" required> -->
				<div class="form-floating">
					<form:input path="user_Tel"  class="form-control" id="floatingTel" placeholder="전화번호(9~11자리 -빼고 입력)"/>
					<form:errors path="user_Tel"/>
					<label for="floatingTel">전화번호(-뺴고 입력)</label>
				</div><br>
			<!-- <input type="text" name="user_Birth" required> -->
				<div class="form-floating">
					<form:input path="user_Birth" class="form-control" id="floatingBirth" placeholder="생년월일(YYYYMMDD)"/>
					<form:errors path="user_Birth"/><br>
					<label for="floatingBirth">생년월일(YYYYMMDD)</label>
				</div>
				${message}<br>
			<button type="submit" class="w-100 btn btn-lg btn-primary">아이디 찾기</button>
		
		</form:form>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<jsp:include page="menu.jsp"></jsp:include>

</body>
</html>