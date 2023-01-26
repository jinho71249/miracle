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
  
<!-- 오른쪽에 고정될 메뉴  -->


<div>

  <main class="bg-light text-dark" style="position: fixed; top: 100px; right: 10px; width: 150px; opacity: 0.7 "> 
    <!-- 로그인전에 보이는 내용 -->
    <c:if test="${empty curLogin}">
    	<h4><a href="<c:url value='/login'/>">로그인</a></h4>
    	<h4><a href="<c:url value='/regSelect'/>">회원가입</a></h4>
    </c:if> 
    
    <!-- 로그인 후에 보이는 내용 -->
    <c:if test="${!empty curLogin}">
    	<h4>${curLogin.user_Name}님
    		<c:if test="${curLogin.user_Alarm eq 1}">
    			<a href="<c:url value='/myList?back=applGet'/>">[new!!!]</a>
    		</c:if>
    	</h4>
    	<a href="<c:url value='/userInfoModi'/>">회원정보수정</a>
    	<a href="<c:url value='/myList?back=ado'/>">내 글 목록</a>
    	<a href="<c:url value='/logout'/>">로그아웃</a>
    	<a href="<c:url value='/secede'/>">회원탈퇴</a>
    </c:if> 
    
    <hr>
    
    <ul class="nav nav-pills flex-column mb-auto">
	    <li class="nav-item"><a class="nav-link" href="test">대처요령</a></li>
	    <li><a class="nav-link" href="<c:url value='/adoBoardList?cur_section=1&cur_page=1'/>">입양홍보</a></li>
	    <li><a class="nav-link" href="<c:url value='/reviewBoard?cur_section=1&cur_page=1'/>">입양후기</a></li>
	    <li><a class="nav-link" href="<c:url value='/infoBoardList?cur_section=1&cur_page=1'/>">정보공유</a></li>
	    <li><a class="nav-link" href="<c:url value='/freeBoard?cur_section=1&cur_page=1'/>">자유게시판</a></li>
    </ul>
  </main>

</div>


</body>
</html>