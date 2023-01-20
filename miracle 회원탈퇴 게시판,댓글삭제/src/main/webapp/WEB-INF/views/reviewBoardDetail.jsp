<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> -->
<style type="text/css">
   img{
 		width: 250px;
 		height: 250px;
 	}
</style>
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
					<c:forTokens var="pic" items="${board.board_Pic}" delims="&">
						<img src="/img/${pic}"><br>
					</c:forTokens>
					<br> 	
				</c:otherwise>
			</c:choose>
			${board.board_Content}</td>
		</tr>
		<tr>
		<c:if test="${board.board_User_Id == curLogin.user_Id || curLogin.user_Admin==1}">
		<td colspan="4">
			<a href="<c:url value='/reviewBoardModi?board_Num=${board.board_Num} '/>">수정</a>/
			<a href="#" onclick="reviewBoardDel()">삭제</a>

			</td>
		</c:if>
			
		</tr>
	</table>
	<button type="button" onclick="location.href='reviewBoard?cur_section=${cur_section}&cur_page=${cur_page}'">목록으로 돌아가기</button>
</div>

<div>
	<jsp:include page="comment.jsp"></jsp:include>
</div> 
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> -->
</body>
<script type="text/javascript">
function reviewBoardDel(){
	if(confirm("게시글을 삭제하시겠습니까?")==true){
		location.href='reviewBoardDel?board_Num=${board.board_Num}&cur_section=${cur_section}&cur_page=${cur_page}';
	}
	else{
		return false;
	}
}

</script>
</html>