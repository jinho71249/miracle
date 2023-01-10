<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<h1>입양홍보 게시글 작성</h1>
	<form action="">
		사진 : <input type="file" name="ado_AniPic" required><br>
		품 종 :<input type="text" name="ado_Breed" required><br>
		나 이 :<input type="number" name="ado_AniAge" required><br>
		접종 여부 :<input type="text" name="ado_AniVaccin" required><br>
		성 별 : <input type="radio" name="ado_AniGender" value="0" checked>수컷
			  <input type="radio" name="ado_AniGender" value="1">암컷<br>
		몸무게 : <input type="number" name="ado_AniWeight" required><br>
		발견장소 : <input type="text" name="ado_AniDiscovery" required><br>
		현 상태 : <select>
				<option value="보호중">보호중</option>
				<option value="입양 완료">입양 완료</option>
				<option value="임시 보호">임시 보호</option>
				<option value="사망">사망</option>	
			   </select><br>
		등록자 아이디 : <input type="text" name="ado_User_Id" value="" readonly><br><!-- value 로그인한 정보  -->
		전화번호 : <input type="tel" name="ado_Tel" required><br>
		현재 보호 장소 : <input type="text" name="ado_AniCareplace" required><br>
		<button type="submit">등록하기</button><button type="reset">다시작성</button> 
	</form>
</div>
</body>
</html>