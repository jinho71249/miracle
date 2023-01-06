<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<c:if test="${!empty list}">
	<table>
		<tr>
			<th>title</th>
			<th>content</th>
		</tr>
		<c:forEach items="${list}" var="li"> 
			<tr>
				<td>${li.user_Id}</td>
				<td>${li.user_Pwd}</td>
				<td>${li.user_name}</td>
				<td>${li.user_Tel}</td>
				<td>${li.user_Birth}</td>
				<td>${li.user_Eamil}</td>
				<td>${li.user_alarm}</td>
			</tr>
		</c:forEach>
	</table>
</c:if>
</body>
</html>