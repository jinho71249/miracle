<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
</head>
<body>
<div >
<div><a href="<c:url value='/main'/>">로고</a></div>
<jsp:include page="menu.jsp"></jsp:include> 
</div>

</body>
</html>