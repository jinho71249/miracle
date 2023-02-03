<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
<meta name="generator" content="Hugo 0.104.2">
<title>MIRACLE</title>

<link rel="canonical"
	href="https://getbootstrap.kr/docs/5.2/examples/heroes/">


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- Favicons -->
<link rel="apple-touch-icon"
	href="/docs/5.2/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon"
	href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg"
	color="#712cf9">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">


<style>
body::before{
        content: "";
        background: url('/img/backgroundImg.png');
        background-size: cover;
        opacity: 0.2;
        position: fixed;
        top: 0px;
        left: 0px;
        right: 0px;
        bottom: 0px;
        z-index: -1;
    }
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


<!-- Custom styles for this template -->
<link href="heroes.css" rel="stylesheet">
</head>


<body>


	<div class="container">

		<nav class="navbar bg-light row fixed-top mx-auto"
			style="float: none; /*  margin: 100 auto;  */ width: 80%;">
			<form class="container-fluid justify-content-start">
				<button class="btn btn-secondary me-2 col"
					style="float: none; margin: 0 auto;" type="button">
					<a class="nav-link" href="#scrollspyHeading1">긴급동물 발견시 대처요령</a>
				</button>
				<button class="btn btn-secondary me-2 col"
					style="float: none; margin: 0 auto;" type="button">
					<a class="nav-link" href="#scrollspyHeading2">이런동물의 구조는 미뤄보세요.</a>
				</button>
				<button class="btn btn-secondary me-2 col"
					style="float: none; margin: 0 auto;" type="button">
					<a class="nav-link" href="#scrollspyHeading3">보호조치 접수</a>
				</button>
				<button class="btn btn-secondary me-2 col"
					style="float: none; margin: 0 auto;" type="button">
					<a class="nav-link" href="#scrollspyHeading4">구조단체</a>
				</button>
			</form>
		</nav>


		<main>
			<h1 class="visually-hidden" id="pageTop"></h1>

			<!-- 		<div class="px-4 py-5 my-5 text-center "> -->
			<div class="px-4 py-5 my-5 text-center" style="margin-bottom: 0;">
				<!-- <img class="d-block mx-auto mb-4" src="/docs/5.2/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57"> -->
				<!-- <img src="./img/logo.png" style="width:12%;height:12%; display:hidden;" > -->
				<div class="mx-auto" style="text-align: center;">
					<img src="/img/logo.png" style="width: 12%; height: 12%;"
						id="scrollspyHeading1"> <img src="/img/logo.png"
						style="width: 12%; height: 12%;"> <img src="/img/logo.png"
						style="width: 12%; height: 12%;">
				</div>

				<h1 class="display-5 fw-bold">긴급동물 발견시 대처요령</h1>

				<div class="container my-5">
					<div class="bg-light p-5 rounded">
						<div class="col-sm-12 py-10 mx-auto">
							<h5 class="display-5 fw-normal fs-4 fw-bolder"
								style="color: rgb(127, 127, 255);">먼저 읽어주세요!</h5>
							<p class="fs-5">긴급하게 치료 및 보호를 필요로 하는 동물을 발견했을 때엔 동물단체의 도움을
								즉각적으로 받을 수 없습니다. 왜냐하면 동물 구조 및 보호조치는 119시스템처럼 바로 출동을 할 수 있는 여건이
								안되어 있기 때문입니다. 간혹 긴급을 요하는 동물을 발견했을 때 전화 제보를 통해 ‘빨리 와서 데려가세요’ 라고
								요청하는데, 단체 관계자가 그 현장 가까이에 있지 않는 한, 이는 어느 동물단체에서도 해결할 수 없습니다</p>
						</div>
					</div>
				</div>

				<div class="container px-4 py-5" id="featured-3">
					<h2 class="pb-2 border-bottom">차량 사고 등으로 인해 긴급 치료를 요할 시</h2>
					<div class="row g-4 py-5 row-cols-1 row-cols-lg-3">
						<div class="feature col bg-light p-3 rounded">
							<div
								class="feature-icon d-inline-flex align-items-center justify-content-center text-bg-primary bg-gradient fs-2 mb-3">
								<!-- <svg class="bi" width="1em" height="1em">
									<use xlink:href="#collection" /></svg> -->
							</div>
							<h3 class="fs-2">목격자의 빠른 대응</h3>
							<p>이때 주인이 없는 동물일 경우 다소 난감하게 대하는 동물의사도 있습니다. 치료비 때문이라기보다는 동물의
								사후 처리에 대해 곤혹스러운 마음이 들어서일 것입니다. 먼저 동물을 병원에 버리고 가지 않는다는 신뢰를 줄 수
								있도록 잘 설득하시고, 치료비 일부라도 지불해 응급처치를 받을 수 있게 해주십시오.</p>
							<!-- 	<a href="#" class="icon-link d-inline-flex align-items-center">
								Call to action <svg class="bi" width="1em" height="1em">
									<use xlink:href="#chevron-right" /></svg> 
							</a>-->
						</div>
						<div class="feature col bg-light p-3 rounded">
							<div
								class="feature-icon d-inline-flex align-items-center justify-content-center text-bg-primary bg-gradient fs-2 mb-3">
								<!-- <svg class="bi" width="1em" height="1em">
									<use xlink:href="#people-circle" /></svg> -->
							</div>
							<h3 class="fs-2">동물이송</h3>
							<p>대부분의 목격자들이 동물 이송을 난감해 하는데 이는 그리 어려운 일이 아닙니다. 마음을 진정시키고 다음과
								같이 침착하게 대처해 주십시오. 작은 동물일 경우 그대로 품에 안아서 택시를 이용하는 방법도 있으며, 조금 큰
								동물은 주변의 상가나 주변인에게 도움을 요청, 종이 박스 같은 것에 담아서 이송하는 방법도 있습니다. 이때 동물이
								구토, 설사, 출혈 등의 경우도 있으므로 반드시 타월이나 신문지, 비닐봉투 등을 준비하시기 바랍니다.</p>
							<!-- <a href="#" class="icon-link d-inline-flex align-items-center">
								Call to action <svg class="bi" width="1em" height="1em">
									<use xlink:href="#chevron-right" /></svg>
							</a> -->
						</div>
						<div class="feature col bg-light p-3 rounded">
							<div
								class="feature-icon d-inline-flex align-items-center justify-content-center text-bg-primary bg-gradient fs-2 mb-3">
								<!-- 		<svg class="bi" width="1em" height="1em">
									<use xlink:href="#toggles2" /></svg> -->
							</div>
							<h3 class="fs-2">중대형의 개일 경우</h3>
							<p>통증 때문에 난폭한 행동을 할 수 있으므로 119에 도움을 요청하십시오. 지역에 따라 119가 출동하기를
								난감해 하는 경우도 있습니다. 그럴 경우, 난폭한 개를 보통의 사람이 이송할 경우 인재로 이어지게 되면 어차피
								119가 출동해야 한다는 것을 주지시키고, 사전 예방을 위한 조치라는 것을 잘 설득하셔서 도움을 받으십시오.</p>
							<!-- <a href="#" class="icon-link d-inline-flex align-items-center">
								Call to action <svg class="bi" width="1em" height="1em">
									<use xlink:href="#chevron-right" /></svg>
							</a> -->
						</div>
					</div>
				</div>

				<!-- -------------- -->

				<div class="container px-4 py-5" id="featured-3">
					<h2 class="pb-2 border-bottom">긴급한 동물의 응급처치를 끝낸후의 조치</h2>
					<div class="row g-4 py-5 row-cols-1 row-cols-lg-2">
						<div class="feature col bg-light p-3 rounded">
							<div
								class="feature-icon d-inline-flex align-items-center justify-content-center text-bg-primary bg-gradient fs-2 mb-3">
								<!-- <svg class="bi" width="1em" height="1em">
									<use xlink:href="#collection" /></svg> -->
							</div>

							<h3 class="fs-2">임시보호 & 입양</h3>
							<p>

								모든 동물 단체는 늘어만 가는 집 없는 동물로 인해 한계상황에 처해 있고, 누구에게나 임시보호는 힘에 겨운
								일입니다. 가여운 생명을 외면하지 말고 조금만 더 적극적인 입장을 취해 주시기 바랍니다. 그러나 도저히 그럴 입장이
								안 되시면 동물 구조 단체에 도움을 요청하십시오. 동물단체가 성의껏 도와줄 것입니다.
								<!-- <a href="#" class="icon-link d-inline-flex align-items-center">
								Call to action <svg class="bi" width="1em" height="1em">
									<use xlink:href="#chevron-right" /></svg>
							</a> -->
						</div>
						<div class="feature col bg-light p-3 rounded">
							<div
								class="feature-icon d-inline-flex align-items-center justify-content-center text-bg-primary bg-gradient fs-2 mb-3">
								<!-- 		<svg class="bi" width="1em" height="1em">
									<use xlink:href="#toggles2" /></svg> -->
							</div>
							<h3 class="fs-2">주인 찾기</h3>
							<p>구조자는 구조 동물에 대해 주인을 찾을 수 있도록 노력해 주시기 바랍니다. 동물이 버려진 것이 아니라
								집을 나왔다가 길을 잃은 것이라면 주인이 애타게 찾고 있을 겁니다. 동물 입장에서도 입양보다는 주인을 찾는 것이
								우선이며 더 좋은 일입니다. 인근지역에 동물의 특성을 표기한 후 사진을 첨부해서 전단지를 붙이고, 파출소, 구청,
								동물병운, 애견샵 등에 배포, 부착해 주시기바랍니다.</p>
							<!-- <a href="#" class="icon-link d-inline-flex align-items-center">
								Call to action <svg class="bi" width="1em" height="1em">
									<use xlink:href="#chevron-right" /></svg>
							</a> -->
						</div>
					</div>
				</div>
			</div>

			<!-- ===================================여기서부터 두번째 내용 ======================================== -->

			<div class="px-4 py-5 my-5 text-center"
				style="margin: 0; padding: 0;">
				<!-- <img class="d-block mx-auto mb-4" src="/docs/5.2/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57"> -->
				<!-- <img src="./img/logo.png" style="width:12%;height:12%; display:hidden;" > -->
				<div class="mx-auto" style="text-align: center;">
					<img src="/img/logo.png" style="width: 12%; height: 12%;"
						id="scrollspyHeading2"> <img src="/img/logo.png"
						style="width: 12%; height: 12%;"> <img src="/img/logo.png"
						style="width: 12%; height: 12%;">
				</div>

				<h1 class="display-5 fw-bold">이런 동물의 구조는 미뤄보세요</h1>

				<div class="container my-5">
					<div class="bg-light p-5 rounded">
						<div class="col-sm-12 py-10 mx-auto">
							<h5 class="display-5 fw-normal fs-4 fw-bolder"
								" style="color: rgb(127, 127, 255);">육안으로 보아 건강상태가 비교적 양호한,
								그러나 다소 초췌한 발바리들을 만날지라도 모두 구조의 대상으로 보지 말아주십시오.</h5>
							<p class="fs-5">대다수의 발바리들은 주인의 관리로부터 자유롭게 키워지는 경우가 많아 행동 반경이
								넓습니다. 인근지역 어딘가에 집이 있는 경우가 많으므로 떠돌이 개라고 추정될 경우엔 즉각적으로 잡는 것보다는 시간을
								두고 지켜보는 것이 좋습니다.</p>
						</div>
					</div>
				</div>

				<div class="container my-5" style="margin: 0; padding: 0;">
					<div class="bg-light p-5 rounded">
						<div class="col-sm-12 py-10 mx-auto">
							<h5 class="display-5 fw-normal fs-4 fw-bolder"
								" style="color: rgb(127, 127, 255);">떠돌이 생활에 적응력을 보이는 개를
								포획할 경우, 오히려 불행한 결과를 초래할 수도 있습니다.</h5>
							<p class="fs-5">이들은 최선의 환경을 제공할 수 있는 입양의 기회가 매우 적은 현실이므로 전문
								구조단체에서 보호하다가 수용능력 한계로 인해 일정기간이 지나면 안락사될 수도 있습니다. 사설보육원들은 모두
								한계상황이기 때문에 이들을 다 받아줄 수도 없고 재정 부족으로 확장도 어려운 상황에 있습니다. 그리고 운좋게
								사설보육시설에 수용된다고 하더라도 수백 마리의 틈에서 살아가야 하기 때문에 이들은 반려동물로서 좋은 환경과 사랑을
								얻기 어렵고, 사육의 개념으로 목숨을 이어갈 수밖에 없습니다. 부상, 질병 등의 긴급을 요하는 사안이 아닐 경우엔
								그대로 지켜보며 동물들의 자유로운 행동을 인정해 주며 적당하고 간헐적인 관리를 하는 것도 동물을 돌보는 방법 중
								하나라 할 수 있습니다.</p>
						</div>
					</div>
				</div>
			</div>

			<!-- ===================================여기서부터  세번째 ======================================= -->



			<div class="px-4 py-5 my-5 text-center ">
				<!-- <img class="d-block mx-auto mb-4" src="/docs/5.2/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57"> -->
				<!-- <img src="./img/logo.png" style="width:12%;height:12%; display:hidden;" > -->
				<div class="mx-auto" style="text-align: center;">
					<img src="/img/logo.png" style="width: 12%; height: 12%;"
						id="scrollspyHeading3"> <img src="/img/logo.png"
						style="width: 12%; height: 12%;"> <img src="/img/logo.png"
						style="width: 12%; height: 12%;">
				</div>

				<h1 class="display-5 fw-bold">긴급동물 보호조치 접수방법</h1>

				<div class="container my-5">
					<div class="bg-light p-5 rounded">
						<div class="col-sm-12 py-10 mx-auto">
							<!-- 	<h5 class="display-5 fw-normal fs-4 fw-bolder"
								style="color: rgb(127, 127, 255); ">먼저 읽어주세요!</h5> -->
							<p class="fs-5">동물보호관리시스템상 동물보호 업무 부서 안내 에서 담당부서 검색 가능</p>
							<p class="fs-5">또는 해당 지자체 전화 후 동물보호 담당 주무관 연결 요청</p>

						</div>
					</div>
				</div>
			</div>



			<!-- ===================================기관연락처 ======================================= -->


			<div class="px-4 py-5 my-5 text-center border-bottom">
				<!-- <img class="d-block mx-auto mb-4" src="/docs/5.2/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57"> -->
				<!-- <img src="./img/logo.png" style="width:12%;height:12%; display:hidden;" > -->
				<div class="mx-auto" style="text-align: center;">
					<img src="/img/logo.png" style="width: 12%; height: 12%;"
						id="scrollspyHeading4"> <img src="/img/logo.png"
						style="width: 12%; height: 12%;"> <img src="/img/logo.png"
						style="width: 12%; height: 12%;">
				</div>

				<h1 class="display-5 fw-bold">야생동물 구조 관련 단체 및 기관</h1>

				<div class="container my-5">
					<div class="p-5">
						<div class="col-sm-12 py-10 mx-auto">


							<table class="table table-striped table-hover">
								<tr>
									<th>센터명</th>
									<th>소재지</th>
									<th>연락처</th>
									<th>운영기관</th>
									<th>비고</th>
								</tr>
								<tr>
									<th>서울</th>
									<td>서울시 관악구 관악로 1</td>
									<td>02-880-8659</td>
									<td><a href="http://www.seoulwildlifecenter.or.kr/"
										target="_blank" class="text-decoration-none">서울대학교 수의과대학 </a></td>
									<td>위탁</td>
								</tr>
								<tr>
									<th>경기</th>
									<td>경기도 평택시 진위면 동천길 132-93</td>
									<td>031-8008-6212</td>
									<td><a href="https://gvs.gg.go.kr/" target="_blank"
										class="text-decoration-none">경기도청 동물보호과 </a></td>
									<td>직영</td>
								</tr>
								<tr>
									<th>인천</th>
									<td>인천시 연수구 송도동 13-20 (솔찬공원내)</td>
									<td>032-858-9702</td>
									<td><a href="http://ecopia.incheon.go.kr/" target="_blank"
										class="text-decoration-none">인천시 보건환경연구원 </a></td>
									<td>직영</td>
								</tr>
								<tr>
									<th>강원</th>
									<td>강원도 춘천시 강원대학길 1</td>
									<td>033-250-7504</td>
									<td><a href="https://vetmed.kangwon.ac.kr/vetmed/index.do"
										target="_blank" class="text-decoration-none">강원대학교 수의과대학 </a></td>
									<td>직영</td>
								</tr>
								<tr>
									<th>부산</th>
									<td>부산시 사하구 낙동남로 1240-2</td>
									<td>051-209-2091</td>
									<td><a
										href="http://www.busan.go.kr/wetland/wildanimalinfo01"
										target="_blank" class="text-decoration-none">낙동강 에코센터 </a></td>
									<td>직영</td>
								</tr>
								<tr>
									<th>대전</th>
									<td>대전시 유성구 궁동 대학로 99</td>
									<td>042-821-7930</td>
									<td><a href="http://dwrc.or.kr/" target="_blank"
										class="text-decoration-none">충남대학교 수의과대학</a></td>
									<td>위탁</td>
								</tr>
								<tr>
									<th>울산</th>
									<td>울산시 남구 옥동 506-3</td>
									<td>052-256-5322</td>
									<td><a
										href="http://www.ulsanpark.com/institution/institution01_8.php"
										target="_blank" class="text-decoration-none">울산대공원 </a></td>
									<td>직영</td>
								</tr>
								<tr>
									<th>충북</th>
									<td>충북 청주시 청원구 양청4길 45</td>
									<td>043-216-3328</td>
									<td><a href="http://wildlife-center.kr/" target="_blank"
										class="text-decoration-none">충북대학교 수의과대학 </a></td>
									<td>위탁</td>
								</tr>
								<tr>
									<th>충남</th>
									<td>충남 예산군 예산읍 대학로 54 (공주대학교 산업과학대학 내)</td>
									<td>041-334-1666</td>
									<td><a href="https://cnwarc.modoo.at/" target="_blank"
										class="text-decoration-none">공주대학교 산학협력단 </a></td>
									<td>위탁</td>
								</tr>
								<tr>
									<th>전북</th>
									<td>전북 익산시 고봉로 79번지</td>
									<td>063-850-0983</td>
									<td><a href="http://wildlife.chonbuk.ac.kr/"
										target="_blank" class="text-decoration-none">전북대학교 수의과대학 </a></td>
									<td>위탁</td>
								</tr>
								<tr>
									<th>전남</th>
									<td>전남 순천시 순천만길 922-15</td>
									<td>061-749-4800</td>
									<td><a class="text-decoration-none">순천시 환경보호과</a></td>
									<td>직영</td>
								</tr>
								<tr>
									<th>경북</th>
									<td>경북 안동시 도산면 퇴계로 2150-44</td>
									<td>054-840-8250</td>
									<td><a
										href="https://www.gb.go.kr/Main/open_contents/section/gbforest/index.html"
										target="_blank" class="text-decoration-none">경상북도 산림자원개발원
									</a></td>
									<td>직영</td>
								</tr>
								<tr>
									<th>경남</th>
									<td>경남 진주시 진주대로 501(가좌동 900)</td>
									<td>055-754-9575</td>
									<td><a href="http://gamc.gnu.ac.kr/" target="_blank"
										class="text-decoration-none">경상대학교 수의과대학 </a></td>
									<td>위탁</td>
								</tr>
								<tr>
									<th>제주</th>
									<td>제주도 제주시 산천단남길 42</td>
									<td>064-752-9982</td>
									<td><a href="https://vetmed.jejunu.ac.kr/" target="_blank"
										class="text-decoration-none">제주대학 수의학과대학 </a></td>
									<td>직영</td>
								</tr>
								<tr>
									<th>광주</th>
									<td>광주시 서구 유촌동 719-2일원</td>
									<td>062-613-6651</td>
									<td><a class="text-decoration-none">광주시 보건환경연구원</a></td>
									<td>직영</td>
								</tr>
							</table>


					




						</div>
					</div>
				</div>
			</div>




			<!-- ===================================기관연락처 ======================================= -->
	</div>
	<div class="overflow-hidden" style="max-height: 30vh;">
		<div class="container px-5">
			<!-- <img src="bootstrap-docs.png" class="img-fluid border rounded-3 shadow-lg mb-4" alt="Example image" width="700" height="500" loading="lazy"> -->
		</div>
	</div>
	</div>




	<div class="b-example-divider mb-0"></div>
	-->
	</main>
	</div>

		<jsp:include page="menu.jsp"></jsp:include>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>



</body>
</html>
