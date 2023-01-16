<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
table {
	border: 1px black solid;
}

tr {
	border: 1px black solid;
}

td {
	border: 1px black solid;
}

.space{
	margin: 10px;
}
.btntd{
	text-align: right;
}

</style>

</head>
<body>

	<div>
	<div class="space"></div>
		<form:form action="commentWrite" modelAttribute="comment">
			<!-- 댓글 등록 후 다시 이전 상세글로 돌아가기위한 -->
			<input type="hidden" id="returnNum" name="returnNum" value="${returnNum}">
			<table>
				<tr>
					<th>작성자</th>
					<th>비밀번호</th>
				</tr>
				<tr>
					<td>
						<form:input path="com_Name"/>
					</td>
					<td><form:password path="com_Pwd"/>
				</tr>

				<tr>
					<td colspan="2">
						<form:textarea path="com_Con" cols="70" rows="5"/>
					</td>
				</tr>

				<tr>
					<td colspan="2">
						<button type="submit" name="commentBtn">등록</button>
					</td>
				</tr>
			</table>
		</form:form>


		<c:if test="${!empty comments}">
			<c:forEach items="${comments}" var="com" varStatus="index"> 
				<div class="space"></div> 
				
				<table>
					<tr>
						<td colspan="2">${com.com_Name}</td>
					</tr>
					<tr>
						<td colspan="2"><textarea cols="70" id="${index.count}" readonly>${com.com_Con}</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="btntd"> 
							<input type="button" onclick="modi(${index.count})" value="수정">
							<input type="button" value="삭제">
						</td>
					</tr>
				</table>
			</c:forEach>
		</c:if>
		<table>
			<c:if test="${empty comments}">
				<tr>
					<td>댓글없음</td>
				</tr>
			</c:if>
		</table>
	</div>
	<script type="text/javascript">
		function modi(index){
			let modi=document.getElementById(index).value;//내용갖고오기성공
			alert(modi+' 되냐');
		}
	</script>


</body>
</html>