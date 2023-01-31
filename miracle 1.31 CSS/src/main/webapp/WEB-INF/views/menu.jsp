<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
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
<body>

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


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>