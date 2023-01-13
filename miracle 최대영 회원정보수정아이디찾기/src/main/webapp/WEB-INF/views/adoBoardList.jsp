<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    .main_title{
      text-align: center;
    }
    
    .main_list {
        width: 720px;
        margin: 0 auto;
    }
    
    .list_start {
        text-align: center;
    }
    
    .list_detail {
        display: inline-block;
        width: 220px;
        height: 260px;
        margin: 10px auto;
    }
    
    .paging_start{
      text-align: center;
    }
    img{
      width: 200px;
      height: 240px;
    }
  </style>
</head>
<body>
  <div class="main_list">
		<!-- 상단 제목 -->
	<div class="main_title">
      <h1>입양홍보 게시판</h1>
      <a href="#">게시글 등록</a>
      <a href="#">전체</a>|<a href="#">보호중</a>|<a href="#">입양완료</a>|<a href="#">사망</a>
      <hr>
	</div>
	<!-- 리스트 --> 
	<div class="list_start">
		<c:if test="${cur_list!=null}">
			<c:forEach items="${cur_list}" var="list">
				<div class="list_detail">
	       			<ul>
	          			<li><a href="#"><img src="${list.ado_AniPic}"></a></li>
	          			<li>${list.ado_AniDiscovery}/${list.ado_AniCon}</li>
	        		</ul>
	      		</div>
			</c:forEach>
		</c:if>
	
				<!-- <div class="list_detail">
				        <ul>
				          <li><a href="#"><img src="/img/cat.jpg"></a></li>
				          <li>구조지역/구조날</li>
				        </ul>
				     </div> -->
	</div>
	<!-- 하단 리스트 번호 -->
    <div class="paging_start">
      <div> 
      	<!-- 이전세션버튼 -->
      	<c:if test="${cur_section>1}">
      		<a href="<c:url value='/adoBoardList?cur_section=${cur_section-1}&cur_page=${1}'/>">  &lt; &lt; </a> 
      	</c:if> 
      	
      	<!-- 페이지 번호 -->
      	<c:forEach var="page" begin="${(cur_section-1)*10+1}" end="${(cur_section)*10>totalPage?totalPage:(cur_section)*10}">
      		<a href="<c:url value='/adoBoardList?cur_section=${cur_section}&cur_page=${page-(cur_section-1)*10}'/>"> ${page} </a>
      	</c:forEach>
      	
      	<!-- 다음세션버튼 -->
      	<c:if test="${cur_section<totalSection}">
      		<a href="<c:url value='/adoBoardList?cur_section=${cur_section+1}&cur_page=${1}'/>">  &gt; &gt; </a> 
      	</c:if> 
      	
      	</div>
    </div>
    <br>
    <br>
	</div>
</body>
</html>