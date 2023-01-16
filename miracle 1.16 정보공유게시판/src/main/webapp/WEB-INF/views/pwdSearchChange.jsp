<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<form:form action="pwdSearchAndChange" modelAttribute="pwdSearchAndChange">
	<!-- 넘겨받은아이디값 -->
	 나중에 삭제할 것 -- 넘겨받은 아이디값 확인 : ${user_Id}
	<input type="hidden" value="${user_Id}" name="user_Id"><br>
	변경할 비밀번호<input type="password" name="user_Pwd"><br>
	비밀번호 확인<input type="password" name="changePwdChk"><br>
				
	<button type="submit" name="searchPwdChange">비밀번호 변경하기</button>

</form:form>

</body>
</html>