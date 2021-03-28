<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:if test="${userinfo == null}">
	<c:redirect url="/"/>
</c:if>
<c:if test="${userinfo != null}">
<!DOCTYPE html>
<html>
<head>
<title>HappyHouse_Front_End_서울_7_이혜진_장덕인</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Rubik:300,400,500,700,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">


<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA7GT09DhDSFW-RCE_lr1Qv78b1av8RO9k&callback=initMap&region=kr"></script> -->

<script type="text/javascript">
	$(document).ready(function() {
		$("#writeBtn").click(function() {
			if ($("#subject").val() == "") {
				alert("제목 입력!!!");
				return;
			} else if ($("#content").val() == "") {
				alert("내용 입력!!!");
				return;
			} else {
				let data = JSON.stringify({
					'userid' : $('#userid').val(),
					'subject' : $('#subject').val(),
					'content' : $('#content').val(),
				});
				console.log(data);

				$.ajax({
					url : '${root}/notice/write',
					type : 'post',
					data : data,
					contentType : 'application/json;charset=utf-8',
					success : function() {
						location.href = "${root}/notice/qna?pg=1&key=noticeno&word=";
					},
					error : function(xhr, status, msg) {
						console.log();
						console.log("상태값 : " + status + " Http에러메시지 : " + msg);
					}
				});
			}
		});
		$("#goHome").click(function() {
			location.href = "${root}/notice/qna?pg=1&key=noticeno&word=";
		})
	});
</script>
</head>
<body>

	<jsp:include page="../nav.jsp"></jsp:include>

	<div class="container col-lg-6" align="center">
		<h1 class="page_header">새로운 Q&A 작성</h1>
		<table class="table_board">
			<form id="writeform" method="post" action="">
				<input type="hidden" id="userid" name="userid" value="${userinfo.username}">
				<tr class="spacing_1" align="center">
					<td><label class="label_style_1" for="subject">제목:</label></td>
					<td><input type="text" class="input_style_2" id="subject"
						name="subject"></td>
				</tr>
				<tr class="spacing_1" align="center">
					<td><label class="label_style_1" for="content">내용:</label>
					</td>
					<td><textarea class="input_style_2" rows="15" id="content"
							name="content"></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="reset" class="btn_font btn_spacing btn_default">초기화</button>
						<button type="button" id="writeBtn"
							class="btn_font btn_register btn_spacing">글작성</button>
						<button type="button" class="btn_font btn_default btn_spacing"
							id="goHome">글목록</button>
					</td>
				</tr>
			</form>
		</table>
	</div>

	<!-- 비밀번호 modal -->
	<div class="modal" id="hi" data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">게시글이 등록되었습니다 !!</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td class="text-center">글 목록을 확인해주세요.</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal"
						onclick='location.href = "${root}/notice/qna?pg=1&key=noticeno&word="'>Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- modal 끝 -->
</body>
<script src="${root}/js/jquery.min.js"></script>
<script src="${root}/js/jquery-migrate-3.0.1.min.js"></script>
<script src="${root}/js/popper.min.js"></script>
<script src="${root}/js/bootstrap.min.js"></script>
<script src="${root}/js/jquery.easing.1.3.js"></script>
<script src="${root}/js/jquery.waypoints.min.js"></script>
<script src="${root}/js/jquery.stellar.min.js"></script>
<script src="${root}/js/owl.carousel.min.js"></script>
<script src="${root}/js/jquery.magnific-popup.min.js"></script>
<script src="${root}/js/aos.js"></script>
<script src="${root}/js/jquery.animateNumber.min.js"></script>
<script src="${root}/js/scrollax.min.js"></script>
<script src="${root}/js/main.js"></script>
<%-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="${root}/js/google-map.js"></script> --%>
	</html>
	</c:if>