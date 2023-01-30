<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 - 선택</title>

 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
 
 
 <style type="text/css">

 
 </style>
 
</head>




<body>
<!-- <button type="button" onclick="location.href='register?user_Admin=0'">일반 회원가입</button>
<button type="button" onclick="location.href='register?user_Admin=1'">관리자 회원가입</button>
 -->
 <br> <br>
<div class="row position-absolute top-50 start-50 translate-middle">
	<p>
  <div class="col-sm-10">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">일반 회원가입</h5>
        <p class="card-text">일반 회원가입 메뉴입니다</p>
        <button type="button" onclick="location.href='register?user_Admin=0'" class="btn btn-primary" >회원가입</button>
<!--         <a href="#" class="btn btn-primary">Go somewhere</a> -->
      </div>
    </div>
  </div>
  </p>
  
  <p>
  <div class="col-sm-10">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">관리자 회원가입</h5>
        <p class="card-text">미라클의 관리자 회원가입 메뉴입니다</p>
        <button type="button" onclick="location.href='register?user_Admin=1'" class="btn btn-primary">관리자 회원가입</button>
<!--         <a href="#" class="btn btn-primary">Go somewhere</a> -->
      </div>
    </div>
  </div>
</div>
</p>
 <br> <br>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>