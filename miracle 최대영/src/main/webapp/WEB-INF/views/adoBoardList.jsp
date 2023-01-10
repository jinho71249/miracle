<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    .main_title{
      text-align: center;
    }
    
    .main_list {
        width: 720px;
        margin: 0 auto;
    }
    
    .list_start {
        text-align: center;
    }
    
    .list_detail {
        display: inline-block;
        width: 220px;
        height: 260px;
        margin: 10px auto;
    }
    
    .paging_start{
      text-align: center;
    }
    img{
      width: 200px;
      height: 240px;
    }
  </style>
</head>
<body>
  <div class="main_list">
		<!-- 상단 제목 -->
		<div class="main_title">
      <h1>입양홍보 게시판</h1>
      <a href="#">게시글 등록</a>
      <a href="#">전체</a>|<a href="#">보호중</a>|<a href="#">입양완료</a>|<a href="#">사망</a>
      <hr>
		</div>
		<!-- 리스트 --> 
		<div class="list_start">
			<div class="list_detail">
        <ul>
          <li><a href="#"><img src="../shoppingAdmin/WebContent/img/01_dog.PNG"></a></li>
          <li>구조지역/구조날짜</li>
        </ul>
      </div>
			<div class="list_detail">
        <ul>
          <li><a href="#"><img src="../shoppingAdmin/WebContent/img/02_dog.PNG"></a></li>
          <li>구조지역/구조날짜</li>
        </ul>
      </div>
      <div class="list_detail">
        <ul>
          <li><a href="#"><img src="../shoppingAdmin/WebContent/img/03_dog.PNG"></a></li>
          <li>구조지역/구조날짜</li>
        </ul>
      </div>
      <div class="list_detail">
        <ul>
          <li><a href="#"><img src="../shoppingAdmin/WebContent/img/01_dog.PNG"></a></li>
          <li>구조지역/구조날짜</li>
        </ul>
      </div>
      <div class="list_detail">
        <ul>
          <li><a href="#"><img src="../shoppingAdmin/WebContent/img/02_dog.PNG"></a></li>
          <li>구조지역/구조날짜</li>
        </ul>
      </div>
      <div class="list_detail">
        <ul>
          <li><a href="#"><img src="../shoppingAdmin/WebContent/img/03_dog.PNG"></a></li>
          <li>구조지역/구조날짜</li>
        </ul>
      </div>
      <div class="list_detail">
        <ul>
          <li><a href="#"><img src="../shoppingAdmin/WebContent/img/01_dog.PNG"></a></li>
          <li>구조지역/구조날짜</li>
        </ul>
      </div>
      <div class="list_detail">
        <ul>
          <li><a href="#"><img src="../shoppingAdmin/WebContent/img/02_dog.PNG"></a></li>
          <li>구조지역/구조날짜</li>
        </ul>
      </div>
      <div class="list_detail">
        <ul>
          <li><a href="#"><img src="../shoppingAdmin/WebContent/img/03_dog.PNG"></a></li>
          <li>구조지역/구조날짜</li>
        </ul>
      </div>    
	</div>
	<!-- 하단 리스트 번호 -->
    <div class="paging_start">
      <div> << 1 2 3 4 5 >> </div>
    </div>
	</div>
</body>
</html>