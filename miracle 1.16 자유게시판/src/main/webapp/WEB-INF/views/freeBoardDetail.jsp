<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 상세보기</title>
</head>
<style>
img {
	width: 200px;
	height: 240px;
}
</style>

<body>
	<div>
		<h1>자유게시판 상세보기</h1>
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
				<td colspan="3"><c:choose>
						<c:when test="${empty board.board_Pic}">

						</c:when>
						<c:otherwise>
							<img src="/img/${board.board_Pic}">
							<br>
						</c:otherwise>
					</c:choose> ${board.board_Content}</td>
			</tr>
			<tr>
				<c:if test="${board.board_user_id == curLogin.user_Id}">
					<td colspan="4">
					<a href="<c:url value='/freeBoardModi?
				board_Num=${board.board_Num} '/>">수정</a>
						<a href="#" onclick="freeBoardDel()">삭제 </a>
						
						
						</td>
				</c:if>
			</tr>
		</table>
			<button type="button"
				onclick="location.href='freeBoard?cur_section=${cur_section}&cur_page=${cur_page}'">목록으로
				돌아가기
			</button>
	</div>
</body>
<script type="text/javascript">
function freeBoardDel() {
	if(confirm("게시글을 삭제하시겠습니까?")==true){
		location.href='freeBoardDel?
			board_Num=${board.board_Num}&cur_section=${cur_section}
			&cur_page=${cur_page}';
		
	}
	else{
		return false;
	}
}
</script>
</html>