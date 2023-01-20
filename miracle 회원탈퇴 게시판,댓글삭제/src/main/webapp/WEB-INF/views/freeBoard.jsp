<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  table {
    border: 1px black solid;
  }

  tr{
    border: 1px black solid;
  }

  td{
    border: 1px black solid;
  }
  .paging_start{
    text-align: center;
  }
   img{
 	width: 100px;
 	height: 100px;
 }
</style>
</head>
<body>
<div>
<h1>자유게시판</h1>
	<table>
	  <tr>
	    <td colspan="4"> 
	      <button type="button" name="freeBoardBtn" onclick="location.href='freeBoardWrite'"> 글쓰기 </button>
	    </td>
	  </tr>
	
	  <tr style="display:none">
	    <td> 사진 </td>
	    <td> 게시글제목</td>
	    <td> 작성자 </td>
	    <td> 조회수 </td>
	  </tr>  
	  <c:if test="${cur_list!=null}">
	      <c:forEach items="${cur_list}" var="list">
			  <!-- 실제 이용자에게 보여지는 화면 -->
			  <tr>
			    <td> 
			    	<c:choose>
			    		<c:when test="${empty list.board_Pic}">
			    			<img src="/img/noimg.png">
			    		</c:when>
			    		<c:otherwise>
			    			<%-- <img src="/img/${list.board_Pic}"> --%>
			    			<c:forTokens var="pic" items="${list.board_Pic}" delims="&" varStatus="status">
							  	<c:if test="${status.first}"><img src="/img/${pic}"></c:if> 
							</c:forTokens>
			    		</c:otherwise>
			   	 	</c:choose>		    
			    </td>
			    <td> <a href="<c:url value='/freeBoardDetail?board_Num=${list.board_Num}&cur_section=${cur_section}&cur_page=${cur_page}'/>">${list.board_Title}</a> </td>
			    <td>${list.board_User_Id}</td>
			    <td>${list.board_Views}</td>
			  </tr>
		  </c:forEach>
	  </c:if>
	</table>
</div>  
  <!-- 페이징 -->
  <div class="paging_start">
    <c:if test="${cur_section>1}">
    	<a href="<c:url value='/freeBoard?cur_section=${cur_section-1}&cur_page=${1}'/>"${page}> &lt; &lt; </a>
    </c:if>
    
    <c:forEach var="page" begin="${(cur_section-1)*10+1}" end="${(cur_section)*10>totalPage?totalPage:(cur_section)*10}">
    	<a href="<c:url value='freeBoard?cur_section=${cur_section}&cur_page=${page-(cur_section-1)*10 }'/>">${page}</a>
    </c:forEach>
    
    <c:if test="${cur_section<totalSection}">
      		<a href="<c:url value='/freeBoard?cur_section=${cur_section+1}&cur_page=${1}'/>">  &gt; &gt; </a> 
   	</c:if> 
  </div>

</body>
</html>