<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
/* 테이블 형태 확인을 위한 임시 스타일 */

  table {
    border: 1px black solid;
  }

  tr{
    border: 1px black solid;
  }

  td{
    border: 1px black solid;
  }
 

</style>

</head>
<body>

<div>
	<table>
	  <tr>
	    <td colspan="4"> 
	      <button type="button" name="infoBoardBtn"> 글쓰기 </button>
	    </td>
	  </tr>
	
	  <tr style="display:none">
	    <td> 사진 </td>
	    <td> 게시글제목</td>
	    <td> 작성자 </td>
	    <td> 조회수 </td>
	  </tr>  
	
	  <!-- 실제 이용자에게 보여지는 화면 -->
	  <c:if test="${cur_list!=null}">
	  	<c:forEach items="${cur_list}" var="list">
	  <tr>
	    <td> <!-- 사진 --> 
	    	<c:choose>
	    		<c:when test="${empty list.board_Pic}">
	    			<img src="/img/noimg.png">
	    		</c:when>
	    		<c:otherwise>
	    			<img src="/img/${list.board_Pic}">
	    		</c:otherwise>
	    	</c:choose>
	    </td>
	    <!-- 제목 -->
	     <td> <a href="<c:url value='/infoBoardDetail?board_Num=${list.board_Num}&cur_section=${cur_section}&cur_page=${cur_page}'/>">${list.board_Title}</a> </td>
	  	<!-- 작성자 -->
	    <td>${list.board_User_Id} </td>
	    <!-- 조회수 -->
	    <td>${list.board_Views} </td>
	    
	  </tr>
		 </c:forEach></c:if>
	</table>
</div>  
  <!-- 페이징 -->
    <div class="paging_start">
    <c:if test="${cur_section>1}">
    	<a href="<c:url value='/infoBoard?cur_section=${cur_section-1}&cur_page=${1}'/>"${page}> &lt; &lt; </a>
    </c:if>
    
    <c:forEach var="page" begin="${(cur_section-1)*10+1}" end="${(cur_section)*10>totalPage?totalPage:(cur_section)*10}">
    	<a href="<c:url value='infoBoard?cur_section=${cur_section}&cur_page=${page-(cur_section-1)*10 }'/>">${page}</a>
    </c:forEach>
    
    <c:if test="${cur_section<totalSection}">
      		<a href="<c:url value='/infoBoard?cur_section=${cur_section+1}&cur_page=${1}'/>">  &gt; &gt; </a> 
   	</c:if> 
  </div>
    


</body>
</html>