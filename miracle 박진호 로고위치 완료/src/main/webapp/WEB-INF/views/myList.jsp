<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/img/jquery.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" 
crossorigin="anonymous">

</head>


<body>

<%-- 
<a href="<c:url value='/main'/>">로고</a>

 --%>
<br>

<!-- 내글 목록보기  -->

	<div>
		<ul class="nav nav-pills nav-fill nav-justified flex-column flex-sm-row list-group">
			<input type="hidden" value="${user_Id}" name="id" id="id">

			<li class="nav-item list-group-item-action"><a class="nav-link"
				href="#" onclick="getMyAdo()"> 입양홍보 </a></li>
			<li class="nav-item list-group-item-action"><a class="nav-link"
				href="#" onclick="getMyApplGet()"> 내게 온 신청서 </a></li>
			<li class="nav-item list-group-item-action"><a class="nav-link"
				href="#" onclick="getMyApplSent()"> 작성한신청서 </a></li>
			<li class="nav-item list-group-item-action"><a class="nav-link"
				href="#" onclick="getMyReview()"> 입양후기 </a></li>
			<li class="nav-item list-group-item-action"><a class="nav-link"
				href="#" onclick="getMyInfo()"> 정보공유 </a></li>
			<li class="nav-item list-group-item-action"><a class="nav-link"
				href="#" onclick="getMyFree()"> 자유게시판 </a></li>
		</ul>
	</div>

<br>




	<div>
      <div>
         <h2 id="title" style="text-align: center;">
            <!-- 선택한 게시판명이 보여짐  -->
         </h2>
      </div>

<br>
      <div style="width:80%;" class="mx-auto">
         <!-- 작성한 게시글이 보여지는 부분 -->
         <table id="infoTb" class="table table-striped table-hover" > 
         <thead> 
            <tr>
               
            </tr>
         </thead>
         <tbody>
         </tbody>
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
               blank+="<br><p>등록된 게시글이 없습니다</p><br>";
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
            $('tbody').html(str); 
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
               blank+="<br><p>등록된 게시글이 없습니다</p><br>";
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
            $('tbody').html(str);
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
               blank+="<br><p>등록된 게시글이 없습니다</p><br>";
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
            $('tbody').html(str);
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
               blank+="<br><p>등록된 게시글이 없습니다</p><br>";
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
            $('tbody').html(str);
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
               blank+="<br><p>등록된 게시글이 없습니다</p><br>";
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
            $('tbody').html(str);
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
               blank+="<br><p>등록된 게시글이 없습니다</p><br>";
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
            $('tbody').html(str);
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