<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>

<style type="text/css">
 * {
            padding: 0;
            margin: 0;

        }

        #container{
            position: relative;
        }

        .maintext{
            font-size: 145px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            opacity: 90%;
            color: yellow;
            font-weight: 1000;
            }
        
        .mainImg{
            z-index: 1;
            width: 100%;
            opacity: 70%;
        }

        .logo{
            z-index: 2;
            position: absolute;
            top : 1%;
            left: 1%;
            width: 150px;
            height: 150px;
        }

 

</style>


</head>
<body>

	<div>
		<jsp:include page="menu.jsp"></jsp:include> 
	</div>	


    <div id="container">

        <div class="logo">
            <a href="##">
            <img src="./img/logo.png" width="130px" height="130px" alt="로고이미지" opacity=100%>
            </a>
        </div>

        <div class="mainImg">
            <img src="./img/mainImg.jpg" alt="메인이미지">         
        </div>

        <div class="maintext">
            <p class="textshadow">M I R A C L E</p> 
        </div> 
    </div>



</body>
</html>