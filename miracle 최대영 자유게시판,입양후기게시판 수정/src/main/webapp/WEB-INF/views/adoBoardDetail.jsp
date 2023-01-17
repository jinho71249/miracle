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
      <img alt="#animalpic" src="${info.ado_AniPic}"><br>
      <button type="button" onclick="">입양신청</button> <!-- 입양신청서 이동-->
    </div>
		<table> 
					
			<tr>
				<th>품종 :</th>
				<td>${info.ado_Breed}</td> <!-- 불러온 데이터   -->
			</tr>
			<tr>
				<th>나이 :</th>
				<td>${info.ado_AniAge}</td> <!-- 불러온 데이터 -->
			</tr>
			<tr>
				<th>접종여부 :</th>
				<td>${info.ado_AniVaccin}</td> <!-- 불러온 데이터 -->
			</tr>
			<tr>
				<th>성별 :</th>
				<td>
				<c:choose>
					<c:when test="${info.ado_AniGender==0}">수컷</c:when>
					<c:otherwise>암컷</c:otherwise>
				</c:choose>
				</td> <!-- 불러온 데이터 -->
			</tr>
			<tr>
				<th>몸무게 :</th>
				<td>${info.ado_AniWeight}</td> <!-- 불러온 데이터 -->
			</tr>
			<tr>
				<th>발견장소 :</th>
				<td>${info.ado_AniDiscovery}</td> <!-- 불러온 데이터 -->
			</tr>
			<tr>
				<th>현상태 :</th>
				<td>${info.ado_AniCon}</td> <!-- 불러온 데이터 -->
			</tr>
			<tr>
				<th>등록자 아이디 :</th>
				<td>${info.ado_User_Id}</td> <!-- 불러온 데이터 -->
			</tr>
			<tr>
				<th>등록자 이름 :</th>
				<td>${info.ado_User_Name}</td> <!-- 불러온 데이터 -->
			</tr>
			<tr>
				<th>전화번호 :</th>
				<td>${info.ado_Tel}</td> <!-- 불러온 데이터 -->
			</tr>
			<tr>
				<th>현재 보호 장소 :</th>
				<td>${info.ado_AniCareplace}</td> <!-- 불러온 데이터 -->
			</tr>
      <tr>
      <c:if test="${info.ado_User_Id==curLogin.user_Id}">
      	<td colspan="2">
            <a href="">수정</a>
            <a href="">삭제</a>
        </td>
      </c:if>
      </tr>
      <tr>
      	<td>
      	<button type="button" onclick="location.href='adoBoardList?cur_section=${cur_section}&cur_page=${cur_page}'">목록으로 돌아가기</button> 
      	</td>
      </tr>
		</table>
		</div>
	</div>

</body>
</html>