<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


 <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/checkout/">

    
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    
<style type="text/css">

   
   .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
      
      
      
  
</style>

<!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">

<body class="bg-light">

	
<div class="container">
  <%-- <form action="userInfoModi" method="Post"> --%>
  <main>
  
  	<div class="py-5 text-center">
		      <!-- <img class="d-block mx-auto mb-4" src="../assets/brand/bootstrap-logo.svg" alt="" width="72" height="57"> -->
		      <h2> ?????????????????? </h2>
		      <p class="lead"></p>
	</div>
		
  	<div class="row g-5">
   		<div class="col-md-5 col-lg-4 order-md-last"></div>
   			 <div class="col-md-7 col-lg-12">  
   			  <h4 class="mb-3">*??? ?????? ?????????????????????</h4>
	<form:form action="userInfoModi" modelAttribute="data" class="needs-validation"> 
	
	<div class="row g-3 ">
	 <div class="col-sm-12">
	   <label for="userId" class="form-label text-center"> ????????? </label>
	   <input type="text" name="user_Id" value="${curLogin.user_Id}" readonly class="form-control" id="userId"><br>
	 </div>
	</div>
	
	
	   <div class="col-sm-12">
         <label for="password" class="form-label"> ???????????? *</label>
          <form:password path="user_Pwd" class="form-control" id="password" placeholder="" value="" required="required"/>
	    	<form:errors path="user_Pwd"/><br>
	 	 <div class="invalid-feedback">
           Password is required.
          </div>
        </div>
        
	  <div class="col-sm-12">
          <label for="pwdchk" class="form-label"> ?????????????????? *</label>
          <input type="password" name="user_Pwdck" class="form-control" id="pwdchk" placeholder="" value="" required="required" >
	    <form:errors path="user_Pwdck"/>
		 <div class="invalid-feedback">
           Password is required.
          </div>
   	   </div>
         	   
         	   <br>
	   <div class="col-12">
          <label for="username" class="form-label">?????? </label>
	    <input type="text" name="user_Name" value="${curLogin.user_Name}" readonly class="form-control" id="username"><br>
	 
	 
	 <div class="col-12">
        <label for="tell" class="form-label">????????????</label> 
        <input type="tel" name="user_Tel" class="form-control" id="tell">
	    <form:errors path="user_Tel"/>
	 </div>   
	    <br>
	
	    <div class="col-12">
              <label for="email" class="form-label">Email</label>
         <form:input path="user_Email" class="form-control" id="email"/>
	    	<form:errors path="user_Email"/><br>
	    </div>	
	    	
	    	
	 <div class="col-12">
         <label for="birth" class="form-label">????????????</label>
        <input type="text" name="user_Birth" value="${curLogin.user_Birth}" readonly class="form-control" id="birth"><br>
	 </div>
	 
	 <hr class="my-4">
	    
	    <br>
	    
	  <!--  <button type="reset" class="btn btn-primary btn-lg" style="display:inline-block;"> ???????????????</button>
	    <button type="submit" name="userInfoModiBtn" class="btn btn-primary btn-lg" style="display:inline-block;"> ?????????????????? </button> 
	     col-12mx-auto row-gap-2 -->
	    
	     <div class="grid row">
		     <div class="col" style="display:inline-block;">
		    	<button type="reset" class="btn btn-primary btn-lg col-12" > ???????????????</button>
		    </div>
		    <div class="col" style="display:inline-block;">
	   		 <button type="submit" name="userInfoModiBtn" class="btn btn-primary btn-lg col-12" > ?????????????????? </button>
	   		</div> 
	    </div>
	    
	    
	 </form:form>  
		<%--  </form> --%>
		</div> 
		</div>
	</main>	

 <footer class="my-5 pt-5 text-muted text-center text-small">
	    <!-- <p class="mb-1">&copy; 2017???2022 Company Name</p>
	    <ul class="list-inline">
	      <li class="list-inline-item"><a href="#">Privacy</a></li>
	      <li class="list-inline-item"><a href="#">Terms</a></li>
	      <li class="list-inline-item"><a href="#">Support</a></li>
	    </ul> -->
 		 </footer>
		
	</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <!-- <script src="../assets/dist/js/bootstrap.bundle.min.js"></script> -->

      <script src="form-validation.js"></script>
      
      
</body>
</html>