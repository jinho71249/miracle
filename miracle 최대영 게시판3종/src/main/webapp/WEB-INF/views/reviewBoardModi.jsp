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



</style>
<script type="text/javascript" src="/img/jquery.js"></script>
</head>
<body>
  <div class="container w-50 p-3">
    <%-- <form action="reviewBoardWriteForm" method="POST" enctype="multipart/form-data"> --%>
      <a href="main">
			<img class="mb-4" src="/img/logo.png" alt="" width="100px" height="100px">
		</a>
		<hr>
		<h3>입양후기</h3>
		<hr>
      <form:form action="reviewBoardModiForm" enctype="multipart/form-data" modelAttribute="board">
	  	
	  <input type="hidden" name="board_Pic" value="${board.board_Pic}" id="originFiles">
      <input type="hidden" name="board_Num" value="${board.board_Num}"> 
      <table class="table">
        <tr>
          <td>
            제목  
          </td>
          <td>
<!--             <input type="text" name="board_Title" required> -->
            <div class="input-group mb-3">
	            <form:input path="board_Title" class="form-control" />
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
       	   		<input type="file" name="file" multiple class="form-control">
       	   </div>
         
          </td>
        </tr>
		<tr>
			<td>
			</td>
			<td>
				<c:forTokens var="pic" items="${board.board_Pic}" delims="&" varStatus="index">
		      		<span id="file_${index.index}">${pic} <button type="button" class="btn btn-sm btn-outline-danger" onclick="deleteFile('${pic}','${index.index}')">X</button></span>
		      	</c:forTokens>
			</td>

		</tr>
        <tr>
          <td>
            내용  
          </td>
          <td>
            <!-- 내용부분은 rows를 조금 더 길게 주고 스크롤을 주는 방향으로 할수만 있으면 좋을듯 -->
<!--             <textarea rows="30" cols="75" name="board_Content" ></textarea> -->
            <div class="input-group mb-3">
	            <form:textarea path="board_Content" rows="30" class="form-control h-25"/>
	            <form:errors path="board_Content"/>
            </div>
          </td>
        </tr>
        <tr>
          <td colspan="2"> 
            <button type="button" class="btn btn-outline-danger float-end" onclick="location.href='reviewBoardDetail?board_Num=${board.board_Num}&cur_section=${cur_section}&cur_page=${cur_page}'">취소</button>
            <button type="submit" class="btn btn btn-primary float-end" name="reviewBoardModi"> 수정</button>
          </td>
        </tr>
      </table>


   </form:form>
<%--     </form> --%>
  </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
<script type="text/javascript">

	function deleteFile(fileName,fileNum) {

		$("#originFiles").val( $("#originFiles").val().replace(fileName + '&', ''));
		$("#file_"+fileNum).hide();
		};

</script>
</html>