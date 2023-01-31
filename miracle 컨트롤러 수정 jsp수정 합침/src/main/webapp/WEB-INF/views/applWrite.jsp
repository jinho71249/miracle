<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">
<title>Checkout example · Bootstrap v5.2</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/checkout/">


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">


<!-- <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet"> -->

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}
</style>


<link href="form-validation.css" rel="stylesheet">

</head>
<style>
img {
	width: 200px;
	height: 500px;
}
</style>
<body class="bg-light">


	<div class="container">
		<main>
			<div class="py-5 text-center">
				<h1>입양신청서</h1>
				<p class="lead"></p>
			</div>


			<div class="row justify-content-md-center">
				<div class="card justify-content-md-center" style="width: 50rem;">
					<img src="${appl.appl_Ado_AniPic}" class="card-img-top"
						alt="입양동물사진">
					<div class="card-body">
						<h5 class="card-title">* 항목은 필수항목입니다</h5>


						<p class="card-text"></p>
						<div class="row g-5">
							<div class="col-md-5 col-lg-4 order-md-last"></div>

							<form:form action="applWriteAfter" modelAttribute="appl"
								method="post" class="needs-validation" novalidate="novalidate">
								<input type="hidden" name="path" value="${path}"> 
								<form:hidden path="appl_Ado_Num" />
								<form:hidden path="appl_Ado_AniPic" />
								<br>

								<div class="row g-3 ">
									<div class="col-sm-12">
										<label for="appId" class="form-label text-center">
											신청인아이디 </label>
										<form:input path="appl_Id" class="form-control" id="appId"
											readonly="true" />
										<br>
									</div>
								</div>

								<div class="col-sm-12">
									<label for="appName" class="form-label"> 신청인 성명 *</label>
									<form:input path="appl_Name" class="form-control" id="appName"
										required="required" />
									<form:errors path="appl_Name" />
									<br>

									<div class="col-sm-12">
										<label for="password" class="form-label"> 성별 *</label> <br>
										<span class="class="form-control"> 
										<form:radiobutton
												path="appl_Gender" value="0" class="form-check-input" />
												&nbsp&nbsp남성
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											<form:radiobutton path="appl_Gender" value="1"
												class="form-check-input" />&nbsp&nbsp여성 <br>
										</span>
									</div>
									<br>

									<div class="col-sm-12">
										<label for="age" class="form-label"> 나이 * (미성년자는 보호자의
											동의가 필요합니다)</label>
										<form:input path="appl_Age" class="form-control" id="age" />
										<form:errors path="appl_Age" />
										<div class="invalid-feedback"></div>
									</div>
									<br>

									<div class="col-12">
										<label for="tell" class="form-label">전화번호*</label>
										<div class="input-group has-validation">
											<form:input path="appl_Tel" class="form-control" id="tell" />
											<form:errors path="appl_Tel" />
											<br>
											<div class="invalid-feedback"></div>
										</div>
									</div>
									<br>

									<div class="col-12">
										<label for="email" class="form-label">Email</label>
										<form:input path="appl_Email" class="form-control" id="email" />
										<form:errors path="appl_Email" />
										<br>
										<div class="invalid-feedback"></div>
									</div>

									<div class="col-12">
										<label for="applContact" class="form-label">연락 가능 시간*</label>
										<form:input path="appl_Contact" class="form-control"
											id="applContact" />
										<form:errors path="appl_Contact" />
										<br>
										<div class="invalid-feedback"></div>
									</div>


									<div class="col-12">
										<label for="applAddr" class="form-label">주 소 *</label>
										<form:input path="appl_Addr" class="form-control"
											id="applAddr" />
										<form:errors path="appl_Addr" />
										<br>
										<div class="invalid-feedback"></div>
									</div>

									<div class="col-sm-12">
										<label for="password" class="form-label"> 결혼여부 *</label> <br>
										<span class="class="form-control"> <form:radiobutton
												path="appl_Mar" value="0" class="form-check-input" />&nbsp&nbsp
											미혼
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											<form:radiobutton path="appl_Mar" value="1"
												class="form-check-input" />&nbsp&nbsp 기혼 <br>
										</span>
									</div>
									<br>


									<div class="col-12">
										<label for="applJob" class="form-label">직업*</label>
										<form:input path="appl_Job" class="form-control" id="applJob" />
										<form:errors path="appl_Job" />
										<br>
										<div class="invalid-feedback"></div>
									</div>

									<br>
									<!-- 	<button type="submit">신청하기</button>  -->
									<div class="grid row justify-content-md-center">
										<button type="submit" class="btn btn-primary btn-lg col-6">
											입양신청하기</button>
									</div>
								</div>
							</form:form>

						</div>
					</div>
				</div>
			</div>

		</main>


	</div>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<!-- <script src="../assets/dist/js/bootstrap.bundle.min.js"></script> -->

	<script src="form-validation.js"></script>
</body>
</html>