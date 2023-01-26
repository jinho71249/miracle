<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- JavaScript Bundle with Popper -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	
<style>
	img {
		width: 70%;
		height: 70%;
	}
	#logo{
		width: 100px;
		height: 100px;
	}
	.img-fluid{
		
		height: auto;
	}
	#myflex{
		display: flex;
		justify-content: space-between;
	}
	
</style>
</head>

<body > 
	
	<div class="row text-center">

		<div class="col-11">
			<a href="<c:url value='/main'/>"><img alt="logo"
				src="/img/logo.png" id="logo" class="">
			</a><br>
			<!-- 상단 제목 -->
			<div class="">

				<h1>입양홍보 게시판</h1>
				<div float-center>
					<a href="<c:url value='/listAll'/>">전체</a>|
					<a href="<c:url value='/listProtect'/>">보호중</a>|
					<a href="<c:url value='/listTP'/>">임시 보호</a>|
					<a href="<c:url value='/listEnd'/>">입양완료</a>|
					<a href="<c:url value='/listDead'/>">사망</a>
				</div>
				<div id="myflex">
					<div></div>
					<label style="margin-left: 120px;">${(cur_section-1)*10+cur_page}페이지</label>
					<a class="btn btn-outline-secondary"  href="<c:url value='/adoBoardWrite'/>" style="margin-right: 23px;">게시글 등록</a> 
				</div>
				<hr>
				
			</div>
			<!-- 리스트 -->
			<div class="row row-cols-3" >
				<c:if test="${cur_list!=null}">
					<c:forEach items="${cur_list}" var="list">
						<div class="col-4 justify-content-center align-self-center">
							<ul class="list-group list-group-flush"><!--  list-group-flush -->
								<li class="list-group-item"><a
									href="<c:url value='/adoBoardDetail?ado_Num=${list.ado_Num}'/>">
										<img class="img-fluid" src="${list.ado_AniPic}">
								</a></li>
								<li class="list-group-item">${list.ado_AniDiscovery}/${list.ado_AniCon}</li>
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
							end="${(cur_section)*10>totalPage?totalPage:(cur_section)*10}">
							<li class="page-item"><a class="page-link"
								href="<c:url value='/adoBoardList?cur_section=${cur_section}&cur_page=${page-(cur_section-1)*10}'/>">
								${page} </a></li>
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
		
		<div class="col-1">
			<jsp:include page="menu.jsp"></jsp:include>
		</div>
		
	</div>
</body>
</html>