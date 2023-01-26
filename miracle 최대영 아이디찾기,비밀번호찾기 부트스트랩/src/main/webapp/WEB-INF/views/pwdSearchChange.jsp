<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
    
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
	<form:form action="pwdSearchAndChange" modelAttribute="pwdSearchAndChange">
		<!-- 넘겨받은아이디값 -->
		<%--  나중에 삭제할 것 -- 넘겨받은 아이디값 확인 : ${user_Id} --%>
		<a href="main">
			<img class="mb-4" src="/img/logo.png" alt="" width="180px" height="200px">
		</a>
   		<h1 class="h3 mb-3 fw-normal">비밀번호 변경</h1>
		<input type="hidden" value="${user_Id}" name="user_Id" ><br>
		<div class="form-floating">
			<input type="password" name="user_Pwd" class="form-control" id="floatingPassword" placeholder="새 비밀번호"><br>
			<label for="floatingPassword">새 비밀번호</label>
		</div>
		<div class="form-floating">
			<input type="password" name="changePwdChk" class="form-control" id="floatingPasswordChk" placeholder="새 비밀번호 확인"><br>
			<label for="floatingPasswordChk">새 비밀번호 확인</label>
		</div>
		
					
		<button type="submit" name="searchPwdChange" class="w-100 btn btn-lg btn-primary">비밀번호 변경하기</button>
	
	</form:form>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>