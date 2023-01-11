<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<body>
  
<!-- 오른쪽에 고정될 메뉴  -->


<div id="container">

  <div id="mainMenu">
    <!-- 로그인전에 보이는 내용 -->
    <c:if test="${empty user_Id}">
    	<h4><a href="<c:url value='/login'/>">로그인</a></h4>
    	<h4><a href="<c:url value='/regSelect'/>">회원가입</a></h4>
    </c:if> 
    
    <!-- 로그인 후에 보이는 내용 -->
    <c:if test="${!empty user_Id}">
    	<h4>로그인: ${user_Id}</a></h3>
    	<h4><a href="">회원정보수정</a></h4>
    	<h4><a href="">내 글 목록</a></h4>
    	<h4><a href="<c:url value='/logout'/>">로그아웃</a></h4>
    </c:if> 
    
    <hr>
    
    
    <h4><a href="">대처요령</a></h4>
    <h4><a href="">입양홍보</a></h4>
    <h4><a href="">입양후기</a></h4>
    <h4><a href="">정보공유</a></h4>
    <h4><a href="">자유게시판</a></h4>
    
  </div>

</div>


</body>
</html>