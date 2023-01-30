<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입양홍보 게시글 작성</title>
<script type="text/javascript" src="/img/jquery.js"></script>
<style type="text/css">
#file {
	display: none;
}

#upload-name {
	background-color: white;
}

.filebox .upload-display { /* 이미지가 표시될 지역 */
	margin-bottom: 5px;
}

@media ( min-width : 768px) {
	.filebox .upload-display {
		display: inline-block;
		margin-right: 5px;
		margin-bottom: 0;
	}
}

.filebox .upload-thumb-wrap { /* 추가될 이미지를 감싸는 요소 */
	display: inline-block;
	width: 54px;
	padding: 2px;
	vertical-align: middle;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
}

.filebox .upload-display img { /* 추가될 이미지 */
	display: block;
	max-width: 100%;
	width: 100% \9;
	height: auto;
}

.label-margin {
	margin-right: 20px;
}

.btn-margin {
	margin-left: 20px;
	margin-right: 20px;
}



.margin-bottom {
	margin-bottom: 70px;
}

.main-title {
	text-align: center;
	font-size: 30px;
	font-weight: bold;
	margin-right: 130px;
	margin-top: 50px;
}
.title-container{
	height: 70px;
}
</style>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col"></div>
			<div class="col-9">
				<div class="d-flex justify-content-between title-containter">
					<a href="<c:url value='/main'/>"> <img src="/img/logo2.png"
						alt="로고이미지"
						style="width: 60px; height: 80px; margin-left: 4px; margin-top: 30px;"></a>
					<label class="main-title">입양홍보</label>
					<div></div>
				</div>
				<br>
				<hr>

				<form:form action="adoBoardWriteAfter" enctype="multipart/form-data"
					modelAttribute="adoption">
					<div class="input-group mb-3 filebox preview-image">
						<label class="input-group-text" for="file">사진 파일 선택</label> <input
							type="file" id="file" name="file" class="form-control"> <input
							id="upload-name" value="파일선택" disabled="disabled">
						${fileErrorMsg}
					</div>
					<form:hidden path="ado_User_Name" />
					<br>
					
					<div class="input-group">
						<label class="form-label label-margin">품 종 :</label>
						<form:input path="ado_Breed" class="form-control"
							required="required" />
						<form:errors path="ado_Breed" />
					</div>
					<br>

					<div class="input-group">
						<label class="form-label label-margin">나 이 :</label>
						<form:input path="ado_AniAge" class="form-control"
							required="required" />
						<form:errors path="ado_AniAge" />
					</div>
					<br>

					<div class="input-group">
						<label class="form-label label-margin">접종 여부 :</label>
						<form:input path="ado_AniVaccin" class="form-control"
							required="required" />
						<form:errors path="ado_AniVaccin" />
					</div>
					<br>


					<label class="form-label label-margin">성별 :</label>

					<div class="form-check form-check-inline">
						<form:radiobutton path="ado_AniGender" class="form-check-input"
							value="0" />
						<label class="form-check-label" for="ado_AniGender"> 수컷 </label>
					</div>
					<div class="form-check form-check-inline">
						<form:radiobutton path="ado_AniGender" class="form-check-input"
							value="1" />
						<label class="form-check-label" for="ado_AniGender"> 암컷 </label>
					</div>
					<br>
					<br>

					<div class="input-group">
						<label class="form-label label-margin">몸무게 :</label>
						<form:input path="ado_AniWeight" class="form-control"
							required="required" />
						<form:errors path="ado_AniWeight" />
					</div>
					<br>

					<div class="input-group">
						<label class="form-label label-margin">발견 장소 :</label>
						<form:input path="ado_AniDiscovery" class="form-control"
							required="required" />
						<form:errors path="ado_AniDiscovery" />
					</div>
					<br>

					<div class="input-group">
						<label class="form-label label-margin">현 상태 :</label>
						<form:select path="ado_AniCon" class="form-select">
							<form:option value="보호중">보호중</form:option>
							<form:option value="입양 완료">입양 완료</form:option>
							<form:option value="임시 보호">임시 보호</form:option>
							<form:option value="사망">사망</form:option>
						</form:select>
					</div>
					<br>

					<div class="input-group">
						<label class="form-label label-margin">등록자 아이디 : </label>
						<form:input path="ado_User_Id" readonly="true"
							class="form-control" />
						<br>
					</div>
					<br>

					<div class="input-group">
						<label class="form-label label-margin">전화번호 : </label>
						<form:input path="ado_Tel" class="form-control"
							required="required" />
						<form:errors path="ado_Tel" />
						<br>
					</div>
					<br>

					<div class="input-group">
						<label class="form-label label-margin">현재 보호 장소 : </label>
						<form:input path="ado_AniCareplace" class="form-control"
							required="required" />
						<form:errors path="ado_AniCareplace" />
					</div>
					<br>

					<div class="d-flex justify-content-end margin-bottom">
						<button type="button" class="btn btn-primary btn-margin"
							onclick="location.href='adoBoardList'">취소</button>
						<button type="submit" class="btn btn-primary">등록하기</button>
					</div>
				</form:form>

				<jsp:include page="menu.jsp"></jsp:include>
			</div>
			<div class="col"></div>
		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		$(document).ready(
				function() {
					var fileTarget = $('.filebox #file');

					fileTarget.on('change', function() { // 값이 변경되면
						if (window.FileReader) { // modern browser
							var filename = $(this)[0].files[0].name;
						} else { // old IE
							var filename = $(this).val().split('/').pop()
									.split('\\').pop(); // 파일명만 추출
						}

						// 추출한 파일명 삽입
						$(this).siblings('#upload-name').val(filename);
					});
				});

		var imgTarget = $('.preview-image #file');

		imgTarget
				.on(
						'change',
						function() {
							var parent = $(this).parent();
							parent.children('.upload-display').remove();

							if (window.FileReader) {
								//image 파일만
								if (!$(this)[0].files[0].type.match(/image\//))
									return;

								var reader = new FileReader();
								reader.onload = function(e) {
									var src = e.target.result;
									parent
											.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
								}
								reader.readAsDataURL($(this)[0].files[0]);
							}

							else {
								$(this)[0].select();
								$(this)[0].blur();
								var imgSrc = document.selection.createRange().text;
								parent
										.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

								var img = $(this).siblings('.upload-display')
										.find('img');
								img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""
										+ imgSrc + "\")";
							}
						});
	</script>


</body>

</html>