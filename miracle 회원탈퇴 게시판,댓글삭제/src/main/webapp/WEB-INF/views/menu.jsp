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
    <c:if test="${empty curLogin}">
    	<h4><a href="<c:url value='/login'/>">로그인</a></h4>
    	<h4><a href="<c:url value='/regSelect'/>">회원가입</a></h4>
    	<h4><a href="<c:url value='/secede'/>">회원탈퇴</a></h4>
    </c:if> 
    
    <!-- 로그인 후에 보이는 내용 -->
    <c:if test="${!empty curLogin}">
    	<h4>${curLogin.user_Name}님
    		<c:if test="${curLogin.user_Alarm eq 1}">
    			<a href="<c:url value='/alarm'/>">[new!!!]</a>
    		</c:if>
    	</h4>
    	<h4><a href="<c:url value='/userInfoModi'/>">회원정보수정</a></h4>
    	<h4><a href="<c:url value='/myList'/>">내 글 목록</a></h4>
    	<h4><a href="<c:url value='/logout'/>">로그아웃</a></h4>
    </c:if> 
    
    <hr>
    
    
    <h4><a href="">대처요령</a></h4>
    <h4><a href="<c:url value='/adoBoardList?cur_section=1&cur_page=1'/>">입양홍보</a></h4>
    <h4><a href="<c:url value='/reviewBoard?cur_section=1&cur_page=1'/>">입양후기</a></h4>
    <h4><a href="<c:url value='/infoBoardList?cur_section=1&cur_page=1'/>">정보공유</a></h4>
    <h4><a href="<c:url value='/freeBoard?cur_section=1&cur_page=1'/>">자유게시판</a></h4>
    
  </div>

</div>


</body>
</html>