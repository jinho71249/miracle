<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<style type="text/css">
.menu {
	position: sticky;
	top: 10px;
}

.img {
	width: 50px;
	height: 50px;
}
.main-title {
	text-align: center;
	font-size: 30px;
	font-weight: bold;
	margin-right: 130px;
	margin-top: 50px;
}
.title-container{
	height: 70px;
}
td, th{
	white-space: nowrap;
	overflow: hidden;
}
</style>
<script type="text/javascript" src="/img/jquery.js"></script>
</head>
<body>
	<div class="container w-100 p-3">
		<div class="row">
			<div class="col"></div>
			<div class="col-9">
				<%-- <form action="reviewBoardWriteForm" method="POST" enctype="multipart/form-data"> --%>
				<div class="d-flex justify-content-between title-containter">
					<a href="<c:url value='/main'/>"> <img src="/img/logo2.png"
						alt="로고이미지"
						style="width: 60px; height: 80px; margin-left: 4px; margin-top: 30px;"></a>
					<label class="main-title">자유 게시판</label>
					<div></div>
				</div>
				<br>
				<hr>
				<form:form action="freeBoardModiForm" enctype="multipart/form-data"
					modelAttribute="board">

					<input type="hidden" name="board_Pic" value="${board.board_Pic}"
						id="originFiles">
					<input type="hidden" name="board_Num" value="${board.board_Num}">
					<table class="table">
						<tr>
							<td>제목</td>
							<td>
								<!--             <input type="text" name="board_Title" required> -->
								<div class="input-group mb-3">
									<form:input path="board_Title" class="form-control" />
									<form:errors path="board_Title" />
								</div>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<!-- 한번에 여러개의 파일을 선택할 수 있도록 --> <!-- multiple : 한번에 여러개의 사진파일 선택가능 -->
								<div class="mb-3">
									<input type="file" name="file" multiple class="form-control">
								</div>
							</td>
						</tr>
						<tr>
							<td></td>
							<td><c:forTokens var="pic" items="${board.board_Pic}"
									delims="&" varStatus="index">
									<span id="file_${index.index}"><img class="img"
										src="/img/${pic}">${pic}
										<button type="button" class="btn btn-secondary  btn-sm"
											onclick="deleteFile('${pic}','${index.index}')">X</button></span>
								</c:forTokens></td>
						</tr>
						<tr>
							<td>내용</td>
							<td>
								<!-- 내용부분은 rows를 조금 더 길게 주고 스크롤을 주는 방향으로 할수만 있으면 좋을듯 --> <!--             <textarea rows="30" cols="75" name="board_Content" ></textarea> -->
								<div class="input-group mb-3">
									<form:textarea path="board_Content" rows="25"
										class="form-control h-25" />
									<form:errors path="board_Content" />
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="button" class="btn btn-secondary  btn-sm float-end"
									onclick="location.href='freeBoardDetail?board_Num=${board.board_Num}&cur_section=${cur_section}&cur_page=${cur_page}'">취소</button>
								
								<button type="submit" class="btn btn-secondary btn-sm float-end" style="margin-right:10px;"
									name="freeBoardModi">수정</button>
									
									
							</td>
						</tr>
					</table>

				</form:form>
				<%--     </form> --%>
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

	function deleteFile(fileName,fileNum) {
		$("#originFiles").val( $("#originFiles").val().replace(fileName + '&', ''));
		$("#file_"+fileNum).hide();
		};

</script>
</html>