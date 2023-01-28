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
<style type="text/css">
	.menu{
	  
	  position: sticky;
	  top : 10px;
	}



</style>
</head>
<body>
<!-- 정보공유게시판  -->

<!-- 정보공유게시판 글 작성페이지 -->
  <div class="container w-100 p-3">
	<div class="row">
  <div class="col"></div>
  <div class="col-9">
  
  <a href="main">
		<img class="mb-4" src="/img/logo.png" alt="" width="100px" height="100px">
	</a>
	<hr>
	<h3>정보공유</h3>
  	<hr>
    <form:form action="infoBoardWriteForm" 
    	enctype="multipart/form-data" modelAttribute="board">
      
      <form:hidden path="board_User_Id" value="${board.board_User_Id}"/>  		
   		
   		<!-- 가져온 작성자 ID확인용  추후 삭제 -->
   <%-- 		<br> 작성자 : ${board.board_User_Id} <br> --%>
 	  <table class="table">
        <tr>
          <td>
        	    제목  
          </td>
          <td>
          	<div class="input-group mb-3">
	            <form:input path="board_Title" class="form-control"/>
	            <form:errors path="board_Title"/>
            </div>
          </td>
        </tr>
        <tr>
          <td>
          </td>
          <td>
            <!-- 한번에 여러개의 파일을 선택할 수 있도록 -->
            <!-- multiple : 한번에 여러개의 사진파일 선택가능 -->
          	<div class="mb-3">
         		 <input type="file" id="file" name="file" multiple class="form-control">
       		 </div>
          </td>
        </tr>

        <tr>
          <td>
            내용  
          </td>
          <td>
            <!-- 내용부분은 rows를 조금 더 길게 주고 스크롤을 주는 방향으로 할수만 있으면 좋을듯 -->
            <div class="input-group mb-3">
	            <form:textarea path="board_Content" rows="30" class="form-control h-25"/>
	       		<form:errors  path="board_Content"/>
       		</div>
          </td>
        </tr>
        <tr>
          <td colspan="2"> 
            <button type="button" class="btn btn-outline-danger float-end" onclick="location.href='infoBoardList?cur_section=${cur_section}&cur_page=${cur_page}'">취소</button>
            <button type="submit" name="infoBoardWriteBtn" class="btn btn btn-primary float-end" onclick="location.href='infoBoardList?cur_section=${cur_section}&cur_page=${cur_page}'"> 등록</button>
          </td>
        </tr>
      </table>
    </form:form>
  </div>
	<div class="col" >
		<nav class="navbar menu float-end" aria-label="Light offcanvas navbar">
		 <button class="navbar-toggler " type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbarLight" aria-controls="offcanvasNavbarLight">
	        <span class="navbar-toggler-icon"></span>
	      </button>
		  <div class="text-end " >
			  <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbarLight" aria-labelledby="offcanvasNavbarLightLabel">
	        	<div class="offcanvas-header">
	          		<button type="button" class="btn-close float-end" data-bs-dismiss="offcanvas" aria-label="Close"></button>
	        	</div>
	        	<div class="offcanvas-body">
					<jsp:include page="menu.jsp" ></jsp:include>
				</div>
			 </div>
		  </div>
		  </nav>
	</div>
</div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>