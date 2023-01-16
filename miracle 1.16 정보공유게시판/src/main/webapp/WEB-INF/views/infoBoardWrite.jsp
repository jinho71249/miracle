<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 정보공유게시판  -->

<!-- 정보공유게시판 글 작성페이지 -->
  <div>
    <form:form action="infoBoardWriteForm" 
    	enctype="multipart/form-data" modelAttribute="board">
      <table>
      <form:hidden path="board_User_Id" value="${board.board_User_Id}"/>  		
   		
   		<!-- 가져온 작성자 ID확인용  추후 삭제 -->
   		<br> 작성자 : ${board.board_User_Id} <br>
   		
        <tr>
          <td>
        	    제목  
          </td>
          <td>
            <form:input path="board_Title"/>
            <form:errors path="board_Title"/>
          </td>
        </tr>

        <tr>
          <td>
            내용  
          </td>
          <td>
            <!-- 내용부분은 rows를 조금 더 길게 주고 스크롤을 주는 방향으로 할수만 있으면 좋을듯 -->
            <form:textarea path="board_Content" rows="30" cols="75"/>
       		<form:errors  path="board_Content"/>
          </td>
        </tr>

        <tr>
          <td colspan="2">
            <!-- 한번에 여러개의 파일을 선택할 수 있도록 -->
            <!-- multiple : 한번에 여러개의 사진파일 선택가능 -->
          <input type="file" id="file" name="file">
          </td>
        </tr>

        <tr>
          <td colspan="2"> 
            <button type="reset">취소</button>
            <button type="submit" name="infoBoardWriteBtn"> 등록</button>
          </td>
        </tr>
      </table>
    </form:form>
  </div>





</body>
</html>