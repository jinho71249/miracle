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
    <form action="">
    <table>
      
      <th> 작성자 </th>
      <th> 비밀번호 </th>

      <tr>
        <td><input type="text" name="commentWriter"></td>
        <td> <input type="password" name="commentPwd"></td>      
      </tr>

      <tr>
        <td colspan="2">
          <textarea cols="70" rows="5"></textarea>
        </td>
      </tr>

      <tr>
        <td colspan="2">
        <button type="submit" name="commentBtn">등록</button>
        </td>
      </tr>

      <!-- 여기서부터는 작성된 댓글내용 -->
      <tr>
        <td colspan="2">댓글작성자이름</td>
      </tr>
      <tr>
        <td colspan="2">
          <textarea cols="70" rows="5">작성된댓글내용</textarea>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          	작성된시간 
          <input type="button" value="수정">
          <input type="button" value="삭제">
        </td>
      </tr>
    </table>
    </form>
  </div>


</body>
</html>