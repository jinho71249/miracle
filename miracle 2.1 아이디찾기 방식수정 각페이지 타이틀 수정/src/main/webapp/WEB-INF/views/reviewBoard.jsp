<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기게시판 리스트</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<style type="text/css">
.imgsize {
	width: 100px;
	height: 100px;
}

.title {
	width: 35%;
}

.menu {
	position: sticky;
	top: 10px;
}
.main-title {
	text-align: center;
	font-size: 30px;
	font-weight: bold;
	margin-right: 130px;
	margin-top: 30px;
}

.wordspace{
	white-space: nowrap;
	overflow: hidden;
}

a{
text-decoration: none;
}
</style>
</head>
<body>

	<div class="container w-100 p-3">
		<div class="row">
			<div class="col"></div>
			<div class="col-9">
				<div class="d-flex justify-content-between " style="height: 70px;"> 
					<a href="main"> <img class="mb-4" src="/img/logo.png" alt=""
						width="100px" height="80px">
					</a>
					<label class="main-title wordspace">입양 후기 게시판</label>
					<div></div>
				</div>
				<hr>
				<div>
					<button type="button" name="reviewBoardBtn"
						class="btn btn-sm btn-secondary float-end"
						onclick="location.href='reviewBoardWrite?cur_section=${cur_section}&cur_page=${cur_page}'">
						글쓰기</button>
				</div>
				<br> <br>
				



				<table class="table  table-hover table-sm table-striped">
					<tr style="display: none">
						<td>사진</td>
						<td class="title">게시글제목</td>
						<td>작성자</td>
						<td>조회수</td>
					</tr>
					<c:if test="${cur_list!=null}">
						<c:forEach items="${cur_list}" var="list">
							<!-- 실제 이용자에게 보여지는 화면 -->
							<tr>
								<td><c:choose>
										<c:when test="${empty list.board_Pic}">
											<a
												href="<c:url value='/reviewBoardDetail?board_Num=${list.board_Num}&cur_section=${cur_section}&cur_page=${cur_page}'/>"><img
												src="/img/noimg.png" class="imgsize"></a>
										</c:when> 
										<c:otherwise>
											<%-- <img src="/img/${list.board_Pic}"> --%>
											<c:forTokens var="pic" items="${list.board_Pic}" delims="&"
												varStatus="status">
												<c:if test="${status.first}">
													<a
														href="<c:url value='/reviewBoardDetail?board_Num=${list.board_Num}&cur_section=${cur_section}&cur_page=${cur_page}'/>"><img
														src="/img/${pic}" class="imgsize"></a>
												</c:if>
											</c:forTokens>
										</c:otherwise>
									</c:choose></td>
								<td class="title wordspace" valign=middle><a
									href="<c:url value='/reviewBoardDetail?board_Num=${list.board_Num}&cur_section=${cur_section}&cur_page=${cur_page}'/>">
										${list.board_Title}</a></td>
								<td valign=middle align="center" class="wordspace">작성자 :
									${list.board_User_Id}</td>
								<td valign=middle align="center" class="wordspace">조회수 : ${list.board_Views}</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>


				<!-- 페이징 -->
				<div class="pagination justify-content-center ">
					<c:if test="${cur_section>1}">
						<a class="page-link" aria-label="Previous"
							href="<c:url value='/reviewBoard?cur_section=${cur_section-1}&cur_page=${1}'/>"
							${page}><span aria-hidden="true">&laquo;</span> </a>
					</c:if>
					<c:forEach var="page" begin="${(cur_section-1)*10+1}"
						end="${(cur_section)*10>totalPage?totalPage:(cur_section)*10}"
						varStatus="index">
						<c:choose>
							<c:when test="${cur_page eq index.count}">
								<li class="page-item active" id="${index.count}"><a
									class="page-link"
									href="<c:url value='/reviewBoard?cur_section=${cur_section}&cur_page=${page-(cur_section-1)*10}'/>">
										${page} </a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item" id="${index.count}"><a
									class="page-link"
									href="<c:url value='/reviewBoard?cur_section=${cur_section}&cur_page=${page-(cur_section-1)*10}'/>">
										${page} </a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${cur_section<totalSection}">
						<a class="page-link" aria-label="Next"
							href="<c:url value='/reviewBoard?cur_section=${cur_section+1}&cur_page=${1}'/>"><span
							aria-hidden="true">&raquo;</span> </a>
					</c:if>
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
</html>