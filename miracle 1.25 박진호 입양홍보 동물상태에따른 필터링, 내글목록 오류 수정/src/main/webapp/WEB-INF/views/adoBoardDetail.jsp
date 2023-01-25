<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
  <style>
    img{
      width: 200px;
      height: 240px;
    }
  </style>

<body>
<div>
	
		<h1>입양홍보페이지 상세보기</h1>
		<div>
			<button type="button"
				onclick="location.href='applWrite?ado_Num=${info.ado_Num}&ado_AniPic=${info.ado_AniPic}&path=${path}'">입양신청</button>
			<!-- 입양신청서 이동-->
		</div>

		<table>
			<tr>
				<td><img alt="동물사진" src="${info.ado_AniPic}"></td>
			</tr>
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
			<tr>
				<c:if test="${info.ado_User_Id==curLogin.user_Id}">
					<td colspan="2">
						<button type="button"
							onclick="location.href='adoBoardModi?ado_Num=${info.ado_Num}&ado_AniPic=${info.ado_AniPic}&path=${path}'">수정</button>
						<button type="button" onclick="removeCheck()">삭제</button>
					</td>
				</c:if>
			</tr>
			<tr>
				<td>
					<button type="button" onclick="location.href='${path}'">목록으로<!-- adoBoardList -->
						돌아가기</button>
				</td>
			</tr>
		</table>
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