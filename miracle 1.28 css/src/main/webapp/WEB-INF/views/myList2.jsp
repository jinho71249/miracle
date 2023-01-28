<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/img/jquery.js"></script>
</head>
<body>
<a href="<c:url value='/main'/>">로고</a>
<br>

<!-- 내글 목록보기  -->

<div>
	<input type="hidden" value="${user_Id}" name="id" id="id">  
	<button type="button" onclick="getMyAdo()">입양홍보</button>
	<button type="button" onclick="getMyApplGet()">내게온신청서</button>
	<button type="button" onclick="getMyApplSent()">작성한신청서</button>
	<button type="button" onclick="getMyReview()">입양후기</button>
	<button type="button" onclick="getMyInfo()">정보공유</button>
	<button type="button" onclick="getMyFree()">자유게시판</button>


</div>
	<div>
		<div>
			<h2 id="title">
				<!-- 선택한 게시판명이 보여짐  -->
			</h2>
		</div>

		<div>
			<!-- 작성한 게시글이 보여지는 부분 -->
			<table border="1" id="infoTb">
			</table>
			<p id="blank"></p> 

		</div>

	</div>
	
	
	<script type="text/javascript">
	let id = $('#id').val();
	
	//내입양신청서
	function getMyAdo() {
		$.ajax({
			url : "adoAjax",
			data : {
				id : id
			},
			datatype : "JSON",
			success : function(data) {
				let info = JSON.parse(data);
				let blank="";
				if(info==''){
					blank+="<br><p>게시글이 비어있습니다</p><br>";
				}
				let str = "<tr>";
				str += "<th>글 번호</th>";
				str += "<th>품종 / 현상태</th>";
				str += "<th>조회수</th>";
				str += "</tr>";
				for (let i = 0; i < info.length; i++) {
					str += "<tr>";
					str += "<td>" + info[i].ado_Num + "</td>";
					str += "<td><a href=\"<c:url value='/adoBoardDetail?ado_Num="
							+ info[i].ado_Num+"&path=myList'/>\">" 
							+ info[i].ado_Breed + "/"
							+ info[i].ado_AniCon + "</a></td>";
					str += "<td>" + info[i].ado_Views + "</td>";
					str += "</tr>";
					
				}
				let title="<label>입양홍보 게시판<label>"
				$('#infoTb').html(str);
				$('#blank').html(blank);
				$('#title').html(title);

			},
			error : function() {
				alert('fail');
			}
		});
	}
	//받은 신청서
	function getMyApplGet() {
		$.ajax({
			url : "applGet",
			data : {
				id : id
			},
			datatype : "JSON",
			success : function(data) {
				let info = JSON.parse(data);
				let blank="";
				if(info==''){
					blank+="<br><p>게시글이 비어있습니다</p><br>";
				}
				let str = "<tr>";
				str += "<th>글 번호</th>";
				str += "<th>신청자 이름</th>";
				str += "</tr>";
				for (let i = 0; i < info.length; i++) {
					str += "<tr>";
					str += "<td>" + info[i].appl_Num + "</td>";
					str += "<td><a href=\"<c:url value='/applDetail?appl_Num="
							+ info[i].appl_Num+"&path=myListG'/>\">" 
							+ info[i].appl_Name + "</a></td>";
					//str += "<td>" + info[i].ado_Views + "</td>";
					str += "</tr>";
					
				}
				let title="<label>내게 온 신청서<label>"
				$('#infoTb').html(str);
				$('#blank').html(blank);
				$('#title').html(title);

			},
			error : function() {
				alert('fail');
			}
		});
	}
	//내가 작성한 신청서
	function getMyApplSent() {
		$.ajax({
			url : "applSent",
			data : {
				id : id
			},
			datatype : "JSON",
			success : function(data) {
				let info = JSON.parse(data);
				let blank="";
				if(info==''){
					blank+="<br><p>게시글이 비어있습니다</p><br>";
				}
				let str = "<tr>";
				str += "<th>신청서 글 번호</th>";
				str += "<th>신청대상의 동물 품종 / 현상태</th>";
				str += "</tr>";
				for (let i = 0; i < info.length; i++) {
					str += "<tr>";
					str += "<td>" + info[i].ado_Num + "</td>";//appl_Num을 넣은 ado_Num
					str += "<td><a href=\"<c:url value='/applDetail?appl_Num="
							+ info[i].ado_Num+"&path=myListS'/>\">" 
							+ info[i].ado_Breed + "/"
							+ info[i].ado_AniCon + "</a></td>";
					str += "</tr>";
					
				}
				let title="<label>내가 작성한 신청서<label>"
				$('#infoTb').html(str);
				$('#blank').html(blank);
				$('#title').html(title);

			},
			error : function() {
				alert('fail');
			}
		});
	}
	function getMyReview() {
		$.ajax({
			url : "reviewAjax",
			data : {
				id : id
			},
			datatype : "JSON",
			success : function(data) {
				let info = JSON.parse(data);
				let blank="";
				if(info==''){
					blank+="<br><p>게시글이 비어있습니다</p><br>";
				}
				let str = "<tr>";
				str += "<th>글 번호</th>";
				str += "<th>글제목</th>";
				str += "<th>조회수</th>";
				str += "</tr>";
				for (let i = 0; i < info.length; i++) {
					str += "<tr>";
					str += "<td>" + info[i].board_Num + "</td>";
					str += "<td><a href=\"<c:url value='/reviewBoardDetail?board_Num="
							+ info[i].board_Num+"&path=myList&cur_page=1&cur_section=1'/>\">" 
							+ info[i].board_Title + "</a></td>";
					str += "<td>" + info[i].board_Views + "</td>";
					str += "</tr>";
					
				}
				let title="<label>후기 게시판<label>"
				$('#infoTb').html(str);
				$('#blank').html(blank);
				$('#title').html(title);

			},
			error : function() {
				alert('fail');
			}
		});
	}
	
	function getMyInfo() {
		$.ajax({
			url : "infoAjax",
			data : {
				id : id
			},
			datatype : "JSON",
			success : function(data) {
				let info = JSON.parse(data);
				let blank="";
				if(info==''){
					blank+="<br><p>게시글이 비어있습니다</p><br>";
				}
				let str = "<tr>";
				str += "<th>글 번호</th>";
				str += "<th>글제목</th>";
				str += "<th>조회수</th>";
				str += "</tr>";
				for (let i = 0; i < info.length; i++) {
					str += "<tr>";
					str += "<td>" + info[i].board_Num + "</td>";
					str += "<td><a href=\"<c:url value='/infoBoardDetail?board_Num="
							+ info[i].board_Num+"&path=myList&cur_page=1&cur_section=1'/>\">" 
							+ info[i].board_Title + "</a></td>";
					str += "<td>" + info[i].board_Views + "</td>";
					str += "</tr>";
					
				}
				let title="<label>정보공유 게시판<label>"
				$('#infoTb').html(str);
				$('#blank').html(blank);
				$('#title').html(title);

			},
			error : function() {
				alert('fail');
			}
		});
	}
	
	function getMyFree() {
		$.ajax({
			url : "freeAjax",
			data : {
				id : id
			},
			datatype : "JSON",
			success : function(data) {
				let info = JSON.parse(data);
				let blank="";
				if(info==''){
					blank+="<br><p>게시글이 비어있습니다</p><br>";
				}
				let str = "<tr>";
				str += "<th>글 번호</th>";
				str += "<th>글제목</th>";
				str += "<th>조회수</th>";
				str += "</tr>";
				for (let i = 0; i < info.length; i++) {
					str += "<tr>";
					str += "<td>" + info[i].board_Num + "</td>";
					str += "<td><a href=\"<c:url value='/freeBoardDetail?board_Num="
							+ info[i].board_Num+"&path=myList&cur_page=1&cur_section=1'/>\">" 
							+ info[i].board_Title + "</a></td>";
					str += "<td>" + info[i].board_Views + "</td>";
					str += "</tr>";
					
				}
				let title="<label>자유 게시판<label>"
				$('#infoTb').html(str);
				$('#blank').html(blank);
				$('#title').html(title);

			},
			error : function() {
				alert('fail');
			}
		});
	}
	
	
</script>


<c:if test="${back eq 'ado'}">
	<script type="text/javascript">
		getMyAdo();
	</script>
</c:if>

<c:if test="${back eq 'applGet'}">
	<script type="text/javascript">
		getMyApplGet();
	</script>
</c:if>

<c:if test="${back eq 'applSent'}">
	<script type="text/javascript">
		getMyApplSent();
	</script>
</c:if>

<c:if test="${back eq 'review'}">
	<script type="text/javascript">
	getMyReview();
	</script>
</c:if>

<c:if test="${back eq 'info'}">
	<script type="text/javascript">
	getMyInfo();
	</script>
</c:if>

<c:if test="${back eq 'free'}">
	<script type="text/javascript">
	getMyFree();
	</script>
</c:if>





</body>
</html>