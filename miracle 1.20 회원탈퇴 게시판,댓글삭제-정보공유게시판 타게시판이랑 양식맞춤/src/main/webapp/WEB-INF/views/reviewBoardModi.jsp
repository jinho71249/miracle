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
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script> 
</head>
<body>
  <div>
    <%-- <form action="reviewBoardWriteForm" method="POST" enctype="multipart/form-data"> --%>
      <form:form action="reviewBoardModiForm" enctype="multipart/form-data" modelAttribute="board">
	
	  <input type="hidden" name="board_Pic" value="${board.board_Pic}" id="originFiles">
      <input type="hidden" name="board_Num" value="${board.board_Num}"> 
      <table>
        <tr>
          <td>
            제목  
          </td>
          <td>
<!--             <input type="text" name="board_Title" required> -->
            <form:input path="board_Title"/>
            <form:errors path="board_Title"/>
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <!-- 한번에 여러개의 파일을 선택할 수 있도록 -->
            <!-- multiple : 한번에 여러개의 사진파일 선택가능 -->
          <input type="file" name="file" multiple >
          </td>
        </tr>
        <tr>
          <td>
            내용  
          </td>
          <td>
            <!-- 내용부분은 rows를 조금 더 길게 주고 스크롤을 주는 방향으로 할수만 있으면 좋을듯 -->
<!--             <textarea rows="30" cols="75" name="board_Content" ></textarea> -->
            <form:textarea path="board_Content" rows="30" cols="75"/>
            <form:errors path="board_Content"/>
          </td>
        </tr>
        <tr>
          <td colspan="2"> 
            <button type="button" onclick="location.href='reviewBoardDetail?board_Num=${board.board_Num}&cur_section=${cur_section}&cur_page=${cur_page}'">취소</button>
            <button type="submit" name="reviewBoardModi">수정</button>
          </td>
        </tr>
      </table>
      	<c:forTokens var="pic" items="${board.board_Pic}" delims="&" varStatus="index">
      		<p id="file_${index.index}">${pic} <button type="button" onclick="deleteFile('${pic}','${index.index}')">얍</button></p>
      	</c:forTokens>
      
               	
         		
         		
         		
         	
    </form:form>
<%--     </form> --%>
  </div>
<script type="text/javascript">

	function deleteFile(fileName,fileNum) {

		$("#originFiles").val( $("#originFiles").val().replace(fileName + '&', ''));
 		console.log($("#file_"+fileNum));
		$("#file_"+fileNum).hide();

		};

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>