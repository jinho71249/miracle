<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 상세 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<style type="text/css">
body::before{
        content: "";
        background: url('/img/backgroundImg.png');
        background-size: cover;
        opacity: 0.3;
        position: fixed;
        top: 0px;
        left: 0px;
        right: 0px;
        bottom: 0px;
        z-index: -1;
    }
.img {
	width: 250px;
	height: 250px;
}

.menu {
	position: sticky;
	top: 10px;
}

.title {
	text-align: center;
	font-size: 30px;
	font-weight: bold;
}

.margin-top {
	margin-top: 30px;
}

td, th {
	white-space: nowrap;
	overflow: hidden;
}
</style>
</head>
<body>
	<div class="container w-100 p-3">
		<div class="row">
			<div class="col"></div>
			<div class="col-9">
				<div class="d-flex justify-content-between margin-top">
					<a href="<c:url value='/main'/>"> <img src="/img/logo2.png"
						alt="로고이미지" style="width: 40px; height: 60px; margin-left: 4px;"></a>


					<label class="title">자유 게시판</label>
					<div></div>
				</div>
				<hr>
				<table class="table">
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
									<c:forTokens var="pic" items="${board.board_Pic}" delims="&">
										<img class="img" src="/img/${pic}">
										<br>
									</c:forTokens>
									<br>
								</c:otherwise>
							</c:choose> ${board.board_Content}</td>
					</tr>
					<tr>
						<td colspan="3">
							<c:if test="${board.board_User_Id == curLogin.user_Id}">
							
							<%-- 	<a href="<c:url value='/freeBoardModi?board_Num=${board.board_Num} '/>"
									class="float-start" style="margin-right: 5px;">수정</a>/ --%>
									
								<button class="btn btn-secondary btn-sm" type="button"
									onclick="location.href='freeBoardModi?board_Num=${board.board_Num}'"> 수정 </button>
									
							</c:if>
							<c:if test="${board.board_User_Id == curLogin.user_Id || curLogin.user_Admin==1}">
							
							
							<!-- 	<a href="#" onclick="freeBoardDel()">삭제</a> -->
									<button class="btn btn-secondary btn-sm" type="button"
									onclick="freeBoardDel()"> 삭제 </button>
								
							</c:if>
							
						</td>
						<td>
							<button type="button"
								onclick="location.href='${path}cur_section=${cur_section}&cur_page=${cur_page}'"
								class="btn btn-lg btn-secondary float-end btn-sm">목록으로
								돌아가기</button>
						</td>
					</tr>
				</table>


				<div>
					<jsp:include page="comment.jsp"></jsp:include>
				</div>
			</div>
			<div class="col">
				<jsp:include page="menu.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
<script type="text/javascript">
	function freeBoardDel() {
		if (confirm("게시글을 삭제하시겠습니까?") == true) {
			location.href = 'freeBoardDel?board_Num=${board.board_Num}&cur_section=${cur_section}&cur_page=${cur_page}';
		} else {
			return false;
		}
	}
</script>
</html>