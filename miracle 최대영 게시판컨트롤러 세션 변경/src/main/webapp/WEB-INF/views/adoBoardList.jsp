<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- JavaScript Bundle with Popper -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" 
crossorigin="anonymous">
	
<style>
img {
	width: 70%;
	height: 70%;
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

#container {
	position: relative;
	width: 100%;
}

.maintext {
	font-size: 7vw;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	opacity: 90%;
	color: yellow;
	font-weight: 1000;
}

.mainImg {
	z-index: 1;
	max-width: 100%;
	opacity: 70%;
}

.mbtn {
	position: absolute;
	top: 5%;
	right: 3%;
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
							end="${(cur_section)*10>totalPage?totalPage:(cur_section)*10}" varStatus="index">
							<c:choose>
								<c:when test="${cur_page eq index.count}">
									<li class="page-item active" id="${index.count}"><a class="page-link"
									href="<c:url value='/adoBoardList?cur_section=${cur_section}&cur_page=${page-(cur_section-1)*10}'/>">
									${page} </a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item" id="${index.count}"><a class="page-link"
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
		
		<nav class="navbar fixed-top" style="padding: 0;">
		<div class="container-fluid" style="padding: 0;">
			<!-- <img src="/img/logo.png" style="width:80px; height:80px; margin-left: 50px;" >  -->
			<a class="navbar-brand"
				style="font-size: 50px; margin: 0; padding: 0;" href="#">

				<button class="navbar-toggler mbtn" type="button"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
					aria-controls="offcanvasNavbar" style="margin-top: 40px;">
					<span class="navbar-toggler-icon"></span>
				</button>

			</a>


			<div class="offcanvas offcanvas-end" tabindex="-1"
				id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
				<div class="offcanvas-header">
					<h5 class="offcanvas-title table " id="offcanvasNavbarLabel">

						<c:if test="${!empty curLogin}">
							<!-- <h4 style="float:right;"> -->
                     ${curLogin.user_Name}님
                        <c:if test="${curLogin.user_Alarm eq 1}">
								<a href="<c:url value='/myList?back=applGet'/>">[new!!!]</a>
							</c:if>
							<!-- </h4> -->
						</c:if>

					</h5>
					<button type="button" class="btn-close mbtn" data-bs-dismiss="offcanvas"
						aria-label="Close"></button>
				</div>

				<div class="offcanvas-body">
					<ul
						class="navbar-nav justify-content-end flex-grow-1 pe-3 list-group list-group-flush">

						<c:if test="${empty curLogin}">
							<li class="nav-item list-group-item list-group-item-action">
								<a class="nav-link" href="<c:url value='/login'/>"> 로그인 </a>
							</li>
							<li class="nav-item list-group-item list-group-item-action">
								<a class="nav-link" href="<c:url value='/regSelect'/>"> 회원가입
							</a>
							</li>
						</c:if>

						<c:if test="${!empty curLogin}">
							<li class="nav-item list-group-item list-group-item-action">
								<a class="nav-link" href="<c:url value='/userInfoModi'/>">
									회원정보수정 </a>
							</li>

							<li class="nav-item list-group-item list-group-item-action">
								<a class="nav-link" href="<c:url value='/myList?back=ado'/>">
									내글목록보기 </a>
							</li>


						</c:if>


						<li class="nav-item list-group-item list-group-item-action">
							<a class="nav-link" href="<c:url value='/guide'/>"> 대처요령 </a>
						</li>
						<li class="nav-item list-group-item list-group-item-action">
							<a class="nav-link"
							href="<c:url value='/adoBoardList?cur_section=1&cur_page=1'/>">입양홍보</a>
						</li>
						<li class="nav-item list-group-item list-group-item-action">
							<a class="nav-link"
							href="<c:url value='/reviewBoard?cur_section=1&cur_page=1'/>">
								입양후기 </a>
						</li>
						<li class="nav-item list-group-item list-group-item-action">
							<a class="nav-link"
							href="<c:url value='/infoBoardList?cur_section=1&cur_page=1'/>">
								정보공유 </a>
						</li>
						<li class="nav-item list-group-item list-group-item-action">
							<a class="nav-link"
							href="<c:url value='/freeBoard?cur_section=1&cur_page=1'/>">
								자유게시판 </a>
						</li>

						<c:if test="${!empty curLogin}">
							<li class="nav-item list-group-item list-group-item-action">
								<a class="nav-link" href="<c:url value='/logout'/>"> 로그아웃 </a>
							</li>

							<li class="nav-item list-group-item list-group-item-action">
								<a class="nav-link" href="<c:url value='/secede'/>"> 회원탈퇴 </a>
							</li>
						</c:if>


					
				</div>
			</div>
		</div>
	</nav>
		
		
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>