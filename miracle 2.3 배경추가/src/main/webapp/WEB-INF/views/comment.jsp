<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글</title>

<style type="text/css">



.space{
	margin: 10px;
}

.margin-bottom{
	margin-bottom: 5px;
}


.btntd{
	display: inline-flex;
	justify-content: flex-end;
	text-align: right;
}

 
</style>

<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
  

 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>

<body>

	<!-- 게시글과 공백 -->
	<br>
	<br>

	<!-- 댓글작성 -->


	<div class="card">
		<!-- 	<div class="space"></div> -->
		<form:form action="commentWrite" modelAttribute="comment">
			<h5 class="card-header">
				<!-- 댓글 등록 후 다시 이전 상세글로 돌아가기위한 -->
				<input type="hidden" id="returnNum" name="returnNum" value="${returnNum}">

				<div class="form-group row" style="width: 100%">
					<div class="col-xs-6 fs-6" style="width: 50%">
						<label for="ex1"> 작성자 </label>
						<form:input path="com_Name" class="form-control"  />
						<form:errors path="com_Name" />
					</div>
					<div class="col-xs-6 fs-6" style="width: 50%">
						<label for="ex2">비밀번호</label>
						<form:password path="com_Pwd" class="form-control" />
					</div>
				</div>
			</h5>

			<div class="card-body position-relative">
				<h5 class="card-title">
					<form:textarea path="com_Con" class="form-control" rows="5" />
					<form:errors path="com_Con" />
					
				</h5>

				<!-- <p class="card-text">With supporting text below as a natural lead-in to additional content.</p> -->
				<button type="submit" name="commentBtn"
					class="btn btn-secondary btn-sm margin-bottom" style="float: right;">댓글
					등록하기</button>
			</div>

		</form:form>
	</div>
	<br>


	<c:if test="${!empty comments}">

		<c:forEach items="${comments}" var="com" varStatus="index">
			<div class="card" style="margin:auto">

				<form:form action="commentUpdate" modelAttribute="comment">
					<h5 class="card-header">
						<div class="form-group row" style="width: 100%">
							<div class="col-xs-6 fs-6" style="width: 50%">
								<label for="ex1"> 작성자 </label> <input class="form-control"
									id="ex1" type="text" value="${com.com_Name}" readonly>
								<input type="hidden" name="com_Board_Num"
									value="${com.com_Board_Num}"> <input type="hidden"
									name="com_Ado_Num" value="${com.com_Ado_Num}"> <input
									type="hidden" name="com_Name" value="${com.com_Name}">
								<input type="hidden" name="com_Pwd" value="${com.com_Pwd}">
								<input type="hidden" name="com_Num" value="${com.com_Num}">
								<input type="hidden" id="returnNum" name="returnNum"
									value="${returnNum}">
							</div>

							<div class="col-xs-6 fs-6" style="width: 50%">
								<label for="ex2">비밀번호</label> <input class="form-control"
									name="pwd" type="password" id="p${index.count}"
									placeholder="댓글을 수정하거나 삭제할때 입력하세요">
							</div>
						</div>
					</h5>

					<div class="card-body">

						<div class="card body">
							<textarea class="form-control" style="height: 100px;" readonly id="${index.count}" name="com_Con"> ${com.com_Con}</textarea>
						</div>

						<div style="margin-top: 5px; margin-right: 7px;">
							<c:choose>
								<c:when test="${curLogin.user_Admin==1}">
									<button type="button" style="margin-right:5px;" 
											class="btn btn-secondary btn-sm margin-bottom float-end" id="d${index.count}"
											onclick="location.href='commentDel?com_Num=${com.com_Num}&returnNum=${returnNum}'">삭제
									</button>
								</c:when>
								<c:otherwise>
									<button type="button" id="m${index.count}"
										onclick="modi(${index.count}, ${com.com_Pwd})"
										class="btn btn-secondary btn-sm margin-bottom" style="float: right;"> 
										수정/삭제 비밀번호 확인</button>
									
									<button type="submit" style="display: none; float: right;"
										id="s${index.count}" class="btn btn-secondary btn-sm margin-bottom">수정</button>
			
									<button type="button" style="display: none; float: right; margin-right: 5px;"
										class="btn btn-secondary btn-sm margin-bottom" id="d${index.count}"
										onclick="location.href='commentDel?com_Num=${com.com_Num}&returnNum=${returnNum}'">삭제</button> 
								</c:otherwise>
							</c:choose>
						</div>
				

					</div>
			</form:form>
			</div>
			<br>
		</c:forEach>
	</c:if>


	<!-- 댓글이 없을 때  -->
	<br>

	<c:if test="${empty comments}">
		<div class="card" style="width: 100%; margin:auto">
			<div class="card-body fs-6">등록된 댓글이 없습니다</div>
		</div>
	</c:if>

<br>



	<script type="text/javascript">
		function modi(area, pw){
			let pwd=document.getElementById('p'+area);
			if(pwd.value==pw){
				alert('비밀번호가 확인되었습니다.');
				let textarea=document.getElementById(area);
				let modify=document.getElementById('m'+area);
				let submit=document.getElementById('s'+area);
				let del=document.getElementById('d'+area);
			
				textarea.readOnly=false;
				modify.style.display="none"; 
				submit.style.display="flex";
				del.style.display="flex";
			}
			else{
				alert('비밀번호가 일치하지않습니다');
			}
			
			//글 수정할수있게 제출버튼 보이게 수정버튼 안보이게
		}
		
	
	</script>

	<!-- <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script> -->


</body>
</html>