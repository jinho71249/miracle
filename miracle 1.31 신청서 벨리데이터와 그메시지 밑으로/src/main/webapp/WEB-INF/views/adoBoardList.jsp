<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- JavaScript Bundle with Popper -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<style>
img {
	width: 150px;
	height: 150px;
}
a { 
	text-decoration: none;
}

#logo {
	width: 100px;
	height: 100px;
}

.img-fluid {
	height: auto;
}

#myflex {
	display: flex;
	justify-content: space-between;
}

.main-title {
	text-align: center;
	font-size: 30px;
	font-weight: bold;
	margin-right: 130px;
	margin-top: 30px;
}

.margin-top {
	margin-top: 30px;
}
.filter{
	margin-left: 50px;
}
.writebtn{
	margin-right: 30px;
}

.wordspace{
	white-space: nowrap;
	overflow: hidden;
}
</style>


</head>

<body>
	<div class="row">
		<div class="col"></div>
		<div class="col-9">
			<div class="d-flex justify-content-between">
				<a href="<c:url value='/main'/>"> <img src="/img/logo2.png"
					alt="로고이미지"
					style="width: 40px; height: 60px; margin-left: 4px; margin-top: 30px;"></a>


				<label class="main-title">입양홍보</label>
				<div></div>
			</div>
			<hr>
			<div class="row text-center">

				<div class="col-11">

					<div class="d-flex justify-content-between margin-top">
						<div class="filter wordspace">
							<a href="<c:url value='/listAll'/>">전체</a>| <a
								href="<c:url value='/listProtect'/>">보호중</a>| <a
								href="<c:url value='/listTP'/>">임시 보호</a>| <a
								href="<c:url value='/listEnd'/>">입양완료</a>| <a
								href="<c:url value='/listDead'/>">사망</a>
						</div>
						<div class="writebtn">
							<a class="btn btn-outline-secondary wordspace"
								href="<c:url value='/adoBoardWrite'/>"
								style="margin-right: 23px;">게시글 등록</a>
						</div>
					</div>
					<br>
					<br>

					<!-- 리스트 -->
					<div class="row row-cols-3">
						<c:if test="${cur_list!=null}">
							<c:forEach items="${cur_list}" var="list">
								<div class="col-4 justify-content-center align-self-center">
									<ul class="list-group list-group-flush">
										<!--  list-group-flush -->
										<li class="list-group-item"><a
											href="<c:url value='/adoBoardDetail?ado_Num=${list.ado_Num}'/>">
												<img class="" src="${list.ado_AniPic}">
										</a></li>
										<li class="list-group-item wordspace" >${list.ado_AniDiscovery}/${list.ado_AniCon}</li>
									</ul> 
								</div>
							</c:forEach>
						</c:if>


					</div>
					<!-- 하단 리스트 번호 -->
					<div>
						<nav>
							<ul class="pagination justify-content-center">
								<!-- 이전세션버튼 -->
								<c:if test="${cur_section>1}">
									<li class="page-item"><a class="page-link"
										href="<c:url value='/adoBoardList?cur_section=${cur_section-1}&cur_page=${1}'/>">
											&lt; &lt; </a></li>
								</c:if>

								<!-- 페이지 번호 -->
								<c:forEach var="page" begin="${(cur_section-1)*10+1}"
									end="${(cur_section)*10>totalPage?totalPage:(cur_section)*10}"
									varStatus="index">
									<c:choose>
										<c:when test="${cur_page eq index.count}">
											<li class="page-item active" id="${index.count}"><a
												class="page-link"
												href="<c:url value='/adoBoardList?cur_section=${cur_section}&cur_page=${page-(cur_section-1)*10}'/>">
													${page} </a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item" id="${index.count}"><a
												class="page-link"
												href="<c:url value='/adoBoardList?cur_section=${cur_section}&cur_page=${page-(cur_section-1)*10}'/>">
													${page} </a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<!-- 다음세션버튼 -->
								<c:if test="${cur_section<totalSection}">
									<li class="page-item"><a class="page-link"
										href="<c:url value='/adoBoardList?cur_section=${cur_section+1}&cur_page=${1}'/>">
											&gt; &gt; </a></li>
								</c:if>
							</ul>
						</nav>

						<br> <br>
					</div>
				</div>
			</div>
		</div>
		<div class="col"></div>
	</div>
	<!-- row -->
	<jsp:include page="menu.jsp"></jsp:include>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>