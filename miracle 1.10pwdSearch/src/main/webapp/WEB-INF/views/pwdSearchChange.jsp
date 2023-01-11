<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<!--  -->

<form:form>
변경할 비밀번호<form:password path="changePwd"/> 
			<form:errors path="currentPassword"/>
비밀번호 확인<form:password path="changePwd"/> 
		<form:errors path="changePwd"/>

<button type="submit">비밀번호 변경하기</button>
</form:form>



</body>
</html>