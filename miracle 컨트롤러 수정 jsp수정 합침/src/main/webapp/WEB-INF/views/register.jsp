<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.2/examples/checkout/">


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">


<style type="text/css">
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

.main-title {
	text-align: center;
	font-size: 30px;
	font-weight: bold;
	margin-right: 130px;
	margin-top: 30px;
}
</style>
<!-- Custom styles for this template -->
<link href="form-validation.css" rel="stylesheet">
</head>


<body class="bg-light">


<div class="row">
		<div class="col"></div>
		<div class="col-9">
			<div class="d-flex justify-content-between">
				<a href="<c:url value='/main'/>"> <img src="/img/logo2.png"
					alt="로고이미지"
					style="width: 40px; height: 60px; margin-left: 4px; margin-top: 30px;"></a>


				<label class="main-title">회원가입</label>
				<div></div>
			</div>
			<hr>



	<div class="container" style="width:70%">
		<main>

			<div class="py-5 text-center">
				<!-- <img class="d-block mx-auto mb-4" src="../assets/brand/bootstrap-logo.svg" alt="" width="72" height="57"> -->
				<!-- <h2>회원가입</h2> -->
				<p class="lead"></p>
			</div>

			<div class="row g-5">
				<div class="col-md-5 col-lg-4 order-md-last"></div>
				<div class="col-md-7 col-lg-12">
					<h4 class="mb-3">*은 필수 입력사항입니다</h4>
					<form:form action="register" modelAttribute="data"
						class="needs-validation">
						<!-- <p>*은 필수입력사항입니다</p> -->
						<br>
						<div class="row g-3 ">
							<div class="col-sm-12">
								<label for="firstName" class="form-label text-center">
									아이디* </label>
								<form:input path="user_Id" class="form-control" id="firstName"
									placeholder="" value="" required="required" />
								<form:errors path="user_Id" />
								<div class="invalid-feedback">ID is required.</div>
							</div>


							<div class="col-sm-12">
								<label for="password" class="form-label"> 비밀번호 *</label>
								<form:password path="user_Pwd" class="form-control"
									id="password" placeholder="" value="" required="required" />
								<form:errors path="user_Pwd" />
								<div class="invalid-feedback">Password is required.</div>
							</div>


							<div class="col-sm-12">
								<label for="pwdchk" class="form-label"> 비밀번호확인 *</label>
								<form:password path="user_Pwdck" class="form-control"
									id="pwdchk" placeholder="" value="" required="required" />
								<form:errors path="user_Pwdck" />
								<div class="invalid-feedback">Password is required.</div>
							</div>


							<div class="col-12">
								<label for="username" class="form-label">이름 *</label>
								<div class="input-group has-validation">
									<!-- <span class="input-group-text">@</span> -->
									<form:input path="user_Name" class="form-control" id="username"
										placeholder="홍길동" required="required" />
									<form:errors path="user_Name" />
									<div class="invalid-feedback">Your username is required.
									</div>
								</div>
							</div>


							<div class="col-12">
								<label for="tell" class="form-label">전화번호*</label>
								<div class="input-group has-validation">
									<form:input path="user_Tel" class="form-control" id="tell"
										placeholder="010-0000-0000" required="required" />
									<form:errors path="user_Tel" />
									<div class="invalid-feedback">Your username is required.
									</div>
								</div>
							</div>

							<div class="col-12">
								<label for="email" class="form-label">Email <span
									class="text-muted">(Optional)</span></label>
								<form:input path="user_Email" class="form-control" id="email"
									placeholder="you@example.com" />
								<form:errors path="user_Email" />
								<br>

								<div class="col-12">
									<label for="birth" class="form-label">생년월일*</label>
									<form:input path="user_Birth" class="form-control" id="birth"
										placeholder="YYYY-MM-YY" required="required" />
									<form:errors path="user_Birth" />
									<div class="invalid-feedback"></div>
								</div>

								<form:hidden path="user_Admin" />
								<hr class="my-4">

								<input type="checkbox" name="agree" value="true"
									required="required" class="form-check-input" id="same-address">

								<label class="form-check-label" for="same-address">개인정보
									수집 및 이용에 동의합니다</label> <br>

								<hr class="my-4">
								<button type="submit" name="registerBtn"
									class="w-100 btn btn-primary btn-lg">회원가입</button>
					</form:form>
				</div>
			</div>
		</main>

		<footer class="my-5 pt-5 text-muted text-center text-small">
			<!-- <p class="mb-1">&copy; 2017–2022 Company Name</p>
	    <ul class="list-inline">
	      <li class="list-inline-item"><a href="#">Privacy</a></li>
	      <li class="list-inline-item"><a href="#">Terms</a></li>
	      <li class="list-inline-item"><a href="#">Support</a></li>
	    </ul> -->
		</footer>
		
	</div>
</div>
<div class="col"></div>





	<jsp:include page="menu.jsp"></jsp:include>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<!-- <script src="../assets/dist/js/bootstrap.bundle.min.js"></script> -->

	<script src="form-validation.js"></script>

</body>
</html>