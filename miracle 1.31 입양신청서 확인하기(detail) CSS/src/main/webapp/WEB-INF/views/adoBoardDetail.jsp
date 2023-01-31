<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>




<style>
img {
	width: 400px;
	height: 350px;
}

.margin-right {
	margin-right: 10px;
}

.margin-top {
	margin-top: 30px;
}

.minw {
	min-width: 200px;
}

td {
	white-space: nowrap;
	text-overflow: ellipsis;
}

.title {
	text-align: center;
	font-size: 30px;
	font-weight: bold;
}

.main-title {
	text-align: center;
	font-size: 30px;
	font-weight: bold;
	margin-right: 130px;
	margin-top: 30px;
}
</style>




<body class="container">
	<div class="row">
		<div class="col"></div>
		<div class="col-9">
			<div class="d-flex justify-content-between">
				<a href="<c:url value='/main'/>"> <img src="/img/logo2.png"
					alt="로고이미지"
					style="width: 40px; height: 60px; margin-left: 4px; margin-top: 30px;"></a>


				<label class="main-title margin-top">입양홍보</label>
				<div></div>
			</div>
			<hr>
			<div class="text-center">


				<br>
				<div class="d-flex justify-content-between flex-row overflow: hidden;">
					<div class="margin-right" style="width:50%;">

						<img class="margin-right" alt="동물사진" src="${info.ado_AniPic}" class="d-flex align-items-stretch" style="width:100%; height:98%;">

						<!-- <div class="d-flex flex-row-reverse"> -->
						
					</div>
					
					
					<div style="width:50%;">
						<table class="table table-lg">

							<tr class="text-start">
								<th class="minw" style="width:30%;">품종 :</th>
								<td>${info.ado_Breed}</td>
								<!-- 불러온 데이터   -->
							</tr>
							<tr class="text-start">
								<th class="minw">나이 :</th>
								<td>${info.ado_AniAge}</td>
								<!-- 불러온 데이터 -->
							</tr>
							<tr class="text-start">
								<th class="minw">접종여부 :</th>
								<td>${info.ado_AniVaccin}</td>
								<!-- 불러온 데이터 -->
							</tr>
							<tr class="text-start">
								<th class="minw">성별 :</th>
								<td><c:choose>
										<c:when test="${info.ado_AniGender==0}">수컷</c:when>
										<c:otherwise>암컷</c:otherwise>
									</c:choose></td>
								<!-- 불러온 데이터 -->
							</tr>
							<tr class="text-start">
								<th class="minw">몸무게 :</th>
								<td>${info.ado_AniWeight}</td>
								<!-- 불러온 데이터 -->
							</tr>
							<tr class="text-start">
								<th class="minw">발견장소 :</th>
								<td>${info.ado_AniDiscovery}</td>
								<!-- 불러온 데이터 -->
							</tr>
							<tr class="text-start">
								<th class="minw">현상태 :</th>
								<td>${info.ado_AniCon}</td>
								<!-- 불러온 데이터 -->
							</tr>
							<tr class="text-start">
								<th class="minw">등록자 아이디 :</th>
								<td>${info.ado_User_Id}</td>
								<!-- 불러온 데이터 -->
							</tr>
							<tr class="text-start">
								<th class="minw">등록자 이름 :</th>
								<td>${info.ado_User_Name}</td>
								<!-- 불러온 데이터 -->
							</tr>
							<tr class="text-start">
								<th class="minw">전화번호 :</th>
								<td>${info.ado_Tel}</td>
								<!-- 불러온 데이터 -->
							</tr>
							<tr class="text-start">
								<th class="minw">현재 보호 장소 :</th>
								<td>${info.ado_AniCareplace}</td>
								<!-- 불러온 데이터 -->
							</tr>
							<tr class="text-start">
								<th class="minw">조회수 :</th>
								<td>${info.ado_Views}</td>
								<!-- 불러온 데이터 -->
							</tr>
						</table>

					

					</div>


				</div>
				<br>
				
				<!-- <div class="d-flex justify-content-start"> -->
					<div class="container text-center">
						<div  class="row">
						
							<div class="col-3 d-flex justify-content-start" style="padding:0;">
							<button class="btn btn-secondary btn-sm" type="button"
								style="margin-right: 80px;" onclick="location.href='${path}'">
								목록으로 돌아가기</button>
							</div>
							
							<div class="col-5" >
								<button class="btn btn-secondary btn-sm margin-right"
									type="button"
									onclick="location.href='applWrite?ado_Num=${info.ado_Num}&ado_AniPic=${info.ado_AniPic}&path=${path}'">입양신청</button>
							</div>
							
							<div class="col-4 d-flex justify-content-end">
							<c:if test="${info.ado_User_Id==curLogin.user_Id}">
								
								<button type="button"
									class="btn btn-secondary btn-sm margin-right"
									onclick="location.href='adoBoardModi?ado_Num=${info.ado_Num}&ado_AniPic=${info.ado_AniPic}&path=${path}'">수정</button>
								<button type="button" class="btn btn-secondary btn-sm"
									onclick="removeCheck()">삭제</button>

							</c:if>
							</div>

							<!--  입양신청버튼  -->

							<%-- <div class="d-flex justify-content-end">
							<c:if test="${info.ado_User_Id==curLogin.user_Id}">

								<button type="button"
									class="btn btn-secondary btn-sm margin-right"
									onclick="location.href='adoBoardModi?ado_Num=${info.ado_Num}&ado_AniPic=${info.ado_AniPic}&path=${path}'">수정</button>
								<button type="button" class="btn btn-secondary btn-sm"
									onclick="removeCheck()">삭제</button>

							</c:if>
						</div> --%>
							






							
						</div>
				
				
				</div>
				
				
		

<%-- 
				<button class="btn btn-secondary btn-sm" type="button"
					onclick="location.href='${path}'">
					목록으로 돌아가기
				</button> --%>

				<jsp:include page="menu.jsp"></jsp:include>

				<div>
					<jsp:include page="comment.jsp"></jsp:include>
				</div>

			</div>
		</div>
		<div class="col"></div>
	</div>
	<!-- row -->



</body>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>

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