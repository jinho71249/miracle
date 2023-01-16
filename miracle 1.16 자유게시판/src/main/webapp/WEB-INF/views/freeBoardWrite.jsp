<%@ page language="java" contentType="text/html; charset=UTF-8
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 상세보기</title>

<style type="text/css">
table {
	border: 1px black solid;
}

tr {
	border: 1px black solid;
}

td {
	border: 1px black solid;
}
</style>

</head>
<body>

	<hr>
	<!-- 자유게시판 글 작성 페이지  -->
	<div>
	<h2>자유게시판 글작성</h2>
		<form action="">
			<table>
				<tr>
					<td>제목</td>
					<td><input type="text" name="freeBoardWrite"></td>
				</tr>
				
				<tr>
				<td>
				내용
				</td>
				<td>
				<!--   -->
			<textarea rows="35" cols="75"></textarea>
			</td>
			</tr>
			
			<tr>
			<td colspan="2">
			<input type="file" multiple>
          </td>
        </tr>
        <tr>
        <td colspan="2"> 
            <button type="reset">취소</button>
            <button type="submit" name="freeBoardWriteBtn"> 등록</button>
			</td>
			</tr>
			</table>
		</form>
	</div>
</body>
</html>