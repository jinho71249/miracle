<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
</head>
<body>
<div>
	<table>
	  <tr>
	    <td colspan="4"> 
	      <button type="button" name="reviewBoardBtn"> 글쓰기 </button>
	    </td>
	  </tr>
	
	  <tr style="display:none">
	    <td> 사진 </td>
	    <td> 게시글제목</td>
	    <td> 작성자 </td>
	    <td> 조회수 </td>
	  </tr>  
	
	  <!-- 실제 이용자에게 보여지는 화면 -->
	  <tr>
	    <td> <a href="#"> 사진1 </a></td>
	    <td> <a href="#"> 게시글제목1111</a> </td>
	    <td> 작성자1 </td>
	    <td> 조회수1 </td>
	  </tr>
	
	</table>
</div>  
  <!-- 페이징 -->
    
  

</body>
</html>