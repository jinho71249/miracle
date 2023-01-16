<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<h1>입양후기글 상세보기</h1>

	<h3>입양 후기</h3>
	<table>
		<tr>
			<th>작성자</th>
			<td>${board.board_User_Id}</td>
			<th>조회수</th>
			<td>${board.board_Views}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3">${board.board_Title}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3"> 
			
			<c:choose>
				<c:when test="${empty board.board_Pic}">
								
				</c:when>
				<c:otherwise>
					<img src="/img/${board.board_Pic}">
					<br> 	
				</c:otherwise>
			</c:choose>
			${board.board_Content}</td>
		</tr>
		<tr>
			<td colspan="4">
			<a href="#">수정/</a>
			<a href="#">삭제</a>
			<button type="button" onclick="location.href='reviewBoard?cur_section=${cur_section}&cur_page=${cur_page}'">목록으로 돌아가기</button>
			</td>
		</tr>
	</table>
	
</div>
</body>
</html>