<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
  <style>
    img{
      width: 400px;
      height: 400px;
    }
  </style>

<body>
	<div class="text-center">

		<h1>입양홍보페이지 상세보기</h1>
		<br>
		<div class="d-flex justify-content-center">
			<div class="col">
				<img class="justify-content-end" alt="동물사진" src="${info.ado_AniPic}">
				<br>
				<button class="btn btn-outline-secondary btn-lg" type="button"
				onclick="location.href='applWrite?ado_Num=${info.ado_Num}&ado_AniPic=${info.ado_AniPic}&path=${path}'">입양신청</button>
			</div>
			<div class="col"> 
				<table class="table w-100">

					<tr>
						<th>품종 :</th>
						<td>${info.ado_Breed}</td>
						<!-- 불러온 데이터   -->
					</tr>
					<tr>
						<th>나이 :</th>
						<td>${info.ado_AniAge}</td>
						<!-- 불러온 데이터 -->
					</tr>
					<tr>
						<th>접종여부 :</th>
						<td>${info.ado_AniVaccin}</td>
						<!-- 불러온 데이터 -->
					</tr>
					<tr>
						<th>성별 :</th>
						<td><c:choose>
								<c:when test="${info.ado_AniGender==0}">수컷</c:when>
								<c:otherwise>암컷</c:otherwise>
							</c:choose></td>
						<!-- 불러온 데이터 -->
					</tr>
					<tr>
						<th>몸무게 :</th>
						<td>${info.ado_AniWeight}</td>
						<!-- 불러온 데이터 -->
					</tr>
					<tr>
						<th>발견장소 :</th>
						<td>${info.ado_AniDiscovery}</td>
						<!-- 불러온 데이터 -->
					</tr>
					<tr>
						<th>현상태 :</th>
						<td>${info.ado_AniCon}</td>
						<!-- 불러온 데이터 -->
					</tr>
					<tr>
						<th>등록자 아이디 :</th>
						<td>${info.ado_User_Id}</td>
						<!-- 불러온 데이터 -->
					</tr>
					<tr>
						<th>등록자 이름 :</th>
						<td>${info.ado_User_Name}</td>
						<!-- 불러온 데이터 -->
					</tr>
					<tr>
						<th>전화번호 :</th>
						<td>${info.ado_Tel}</td>
						<!-- 불러온 데이터 -->
					</tr>
					<tr>
						<th>현재 보호 장소 :</th>
						<td>${info.ado_AniCareplace}</td>
						<!-- 불러온 데이터 -->
					</tr>
					<tr>
						<th>조회수 :</th>
						<td>${info.ado_Views}</td>
						<!-- 불러온 데이터 -->
					</tr>
				</table>




			</div>

		</div>
		<br>
		<c:if test="${info.ado_User_Id==curLogin.user_Id}">

			<button type="button"
				onclick="location.href='adoBoardModi?ado_Num=${info.ado_Num}&ado_AniPic=${info.ado_AniPic}&path=${path}'">수정</button>
			<button type="button" onclick="removeCheck()">삭제</button>

		</c:if>



		<button class="btn btn-outline-dark btn-lg" type="button"
			onclick="location.href='${path}'">
			목록으로
			<!-- adoBoardList -->
			돌아가기
		</button>

	</div>


	<div>
		<jsp:include page="comment.jsp"></jsp:include>
	</div>

</body>


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