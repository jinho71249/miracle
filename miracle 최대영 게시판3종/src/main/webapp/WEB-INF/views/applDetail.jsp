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
입양 신청서<br>
<img alt="동물사진" src="${appl.appl_Ado_AniPic}"><br>
신청자 아이디: ${appl.appl_Id}<br>
신청자 이름: ${appl.appl_Name}<br>
성별: ${appl.appl_Gender}<br>
나이: ${appl.appl_Age}<br>
전화번호: ${appl.appl_Tel}<br>
이메일: ${appl.appl_Email}<br>
연락가능 시간: ${appl.appl_Contact}<br>
주소: ${appl.appl_Addr}<br>
결혼여부: ${appl.appl_Mar}<br>
직업: ${appl.appl_Job}<br>
<button type="button" onclick="location.href='${path}'">목록으로 돌아가기</button>


</body>
</html>