<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
   img{
 		width: 250px;
 		height: 250px;
 	}
</style>


</head>
<body>

<div>
	<h1>정보공유게시판</h1>
	<h3>정보공유게시판</h3>
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
			
			<!-- 글번호 확인용  나중에 삭제 -->
		<%-- 	 가지고온글번호 : ${board.board_Num}  --%>
			 
			 
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
			<a href="<c:url value='/infoBoardModi?board_Num=${board.board_Num}&path=${path} '/>">수정</a>/
			<button type="button" onclick="removeCheck()">삭제</button>
		</td>
		</c:if>	
		</tr>
		<tr>
			<td>	
			<button type="button" onclick="location.href='${path}cur_section=${cur_section}&cur_page=${cur_page}'">목록으로 돌아가기</button>
			</td> 
			
		</tr>
	</table>
	
</div>	

<div>
	<jsp:include page="comment.jsp"></jsp:include>
</div> 


<script type="text/javascript">
function removeCheck(){
	if(confirm("정말 삭제하시겠습니까??")==true){
		location.href='infoBoardDel?board_Num=${board.board_Num}&cur_section=${cur_section}&cur_page=${cur_page}&path=${path}';
	}
	else{
		return false;
	}
}

</script>


</body>




</html>