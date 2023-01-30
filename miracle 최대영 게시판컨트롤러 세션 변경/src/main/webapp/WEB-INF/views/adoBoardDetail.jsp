<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
  <style>
    img{
      width: 400px; 
      height: 350px;
    }
    #logo{
		width: 100px;
		height: 100px;
	}
	.margin-right{
		margin-right: 10px;
	}
	.margin-top{
		margin-top: 10px;
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

<body>
	
	<div class="text-center"> 
 		<a href="<c:url value='/main'/>" class="w-10"><img alt="logo"src="/img/logo.png" id="logo"></a>
		<h1>입양홍보페이지 상세보기</h1>
		<br>
		<div class="d-flex justify-content-center">
			<div class="">
				
					
				<img class="margin-right" alt="동물사진" src="${info.ado_AniPic}">
				
				<div class="d-flex flex-row-reverse">
					<button class="btn btn-outline-secondary margin-right margin-top" type="button"
						onclick="location.href='applWrite?ado_Num=${info.ado_Num}&ado_AniPic=${info.ado_AniPic}&path=${path}'">입양신청</button>
				</div>
			</div>
			<div class=""> 
				<table class="table table-lg">   

					<tr class="text-start">
						<th>품종 :</th> 
						<td>${info.ado_Breed}</td>
						<!-- 불러온 데이터   -->
					</tr>
					<tr class="text-start">
						<th>나이 :</th>
						<td>${info.ado_AniAge}</td>
						<!-- 불러온 데이터 -->
					</tr>
					<tr class="text-start">
						<th>접종여부 :</th>
						<td>${info.ado_AniVaccin}</td>
						<!-- 불러온 데이터 -->
					</tr>
					<tr class="text-start">
						<th>성별 :</th>
						<td><c:choose>
								<c:when test="${info.ado_AniGender==0}">수컷</c:when>
								<c:otherwise>암컷</c:otherwise>
							</c:choose></td>
						<!-- 불러온 데이터 -->
					</tr>
					<tr class="text-start">
						<th>몸무게 :</th>
						<td>${info.ado_AniWeight}</td>
						<!-- 불러온 데이터 -->
					</tr>
					<tr class="text-start">
						<th>발견장소 :</th>
						<td>${info.ado_AniDiscovery}</td>
						<!-- 불러온 데이터 -->
					</tr>
					<tr class="text-start">
						<th>현상태 :</th>
						<td>${info.ado_AniCon}</td>
						<!-- 불러온 데이터 -->
					</tr>
					<tr class="text-start">
						<th>등록자 아이디 :</th>
						<td>${info.ado_User_Id}</td>
						<!-- 불러온 데이터 -->
					</tr>
					<tr class="text-start">
						<th>등록자 이름 :</th>
						<td>${info.ado_User_Name}</td>
						<!-- 불러온 데이터 -->
					</tr>
					<tr class="text-start"> 
						<th>전화번호 :</th>
						<td>${info.ado_Tel}</td>
						<!-- 불러온 데이터 -->
					</tr>
					<tr class="text-start">
						<th>현재 보호 장소 :</th>
						<td>${info.ado_AniCareplace}</td>
						<!-- 불러온 데이터 -->
					</tr>
					<tr class="text-start">
						<th>조회수 :</th>
						<td>${info.ado_Views}</td>
						<!-- 불러온 데이터 -->
					</tr>
				</table>
				<div class="d-flex justify-content-end"> 
					<c:if test="${info.ado_User_Id==curLogin.user_Id}">
		
						<button type="button" class="btn btn-outline-dark btn-lg margin-right"
							onclick="location.href='adoBoardModi?ado_Num=${info.ado_Num}&ado_AniPic=${info.ado_AniPic}&path=${path}'">수정</button>
						<button type="button" class="btn btn-outline-dark btn-lg" onclick="removeCheck()">삭제</button>
			
					</c:if>
				</div>
				
				
			</div>
			

		</div>
		<br>
		



		<button class="btn btn-outline-dark btn-lg" type="button"
			onclick="location.href='${path}'">
			목록으로
			<!-- adoBoardList -->
			돌아가기
		</button>
		
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

		<div>
			<jsp:include page="comment.jsp"></jsp:include>
		</div>

	</div>


	

</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<script type="text/javascript">
function removeCheck(){
	if(confirm("정말 삭제하시겠습니까??")==true){
		location.href='adoBoardDel?ado_Num=${info.ado_Num}&path=${path}';
	}
	else{
		return false;
	}
}

</script>



</html>