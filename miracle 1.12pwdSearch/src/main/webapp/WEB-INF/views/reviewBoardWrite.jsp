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

<!-- 입양후기 글 작성페이지 -->
  <div>
    <form action="">
      <table>
        <tr>
          <td>
            제목  
          </td>
          <td>
            <input type="text" name="reviewBoardWrite">
          </td>
        </tr>

        <tr>
          <td>
            내용  
          </td>
          <td>
            <!-- 내용부분은 rows를 조금 더 길게 주고 스크롤을 주는 방향으로 할수만 있으면 좋을듯 -->
            <textarea rows="30" cols="75"></textarea>
          </td>
        </tr>

        <tr>
          <td colspan="2">
            <!-- 한번에 여러개의 파일을 선택할 수 있도록 -->
            <!-- multiple : 한번에 여러개의 사진파일 선택가능 -->
          <input type="file" multiple>
          </td>
        </tr>

        <tr>
          <td colspan="2"> 
            <button type="reset">취소</button>
            <button type="submit" name="reviewBoardWriteBtn"> 등록</button>
          </td>
        </tr>
      </table>
    </form>
  </div>


</body>
</html>