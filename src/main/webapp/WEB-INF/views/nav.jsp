<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

<link rel="stylesheet" href="${root}/css/style_hyejin.css">
<link rel="stylesheet" href="${root}/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="${root}/css/animate.css">

<link rel="stylesheet" href="${root}/css/owl.carousel.min.css">
<link rel="stylesheet" href="${root}/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${root}/css/magnific-popup.css">

<link rel="stylesheet" href="${root}/css/aos.css">
<link rel="stylesheet" href="${root}/css/ionicons.min.css">

<link rel="stylesheet" href="${root}/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="${root}/css/jquery.timepicker.css">


<link rel="stylesheet" href="${root}/css/flaticon.css">
<link rel="stylesheet" href="${root}/css/icomoon.css">
<link rel="stylesheet" href="${root}/css/style.css">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
	function login() {
		if (document.getElementById("username").value == "") {
			alert("???????????? ???????????????");
			return;
		} else if (document.getElementById("password").value == "") {
			alert("??????????????? ???????????????");
			return;
		} else {
			/* document.getElementById("loginForm").action = "${root}/login";
			document.getElementById("loginForm").submit(); */
			$.ajax({
				url: "${root}/login",
				type:'POST',
				success:function() {
				},
				error:function(xhr,status,msg){
					console.log("????????? : " + status + " Http??????????????? : "+msg);
				}
			})
		}
	};
	
	$(document).ready(function() {
		var me = '${msg}';
		if(me != '') {
			$("#hi").modal();
		}
		$("#findpw").on('click', function() {
			let username = $('#fpusername').val();
			console.log("username => ", username);
			$.ajax({
				url:'${root}/member/password/' + username,  
				type:'GET',
				contentType:'application/json;charset=utf-8',
				success:function(pw) {
					console.log("data return => ", pw);
					$("#modal_password").text(pw);
					$("#pwModal").modal('hide');
					$("#passwordModal").modal();
				},
				error:function(xhr,status,msg){
					console.log("????????? : " + status + " Http??????????????? : "+msg);
				}
			});
		})
	});
	
	
	function getContextPath() {
		var hostIndex = location.href.indexOf(location.host)
				+ location.host.length;
		return location.href.substring(hostIndex, location.href.indexOf('/',
				hostIndex + 1));
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="${root}/index"><img class="img_logo" src="${root}/images/logo_full_bg.png"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="${root}/index" class="nav-link tmoney-round-wind-extrabold">Home</a></li>
					<li class="nav-item"><a href="${root}/notice/list?pg=1&key=&word=" class="nav-link tmoney-round-wind-extrabold">Board</a></li>
					<li class="nav-item"><a href="${root}/notice/qna?pg=1&key=&word=" class="nav-link tmoney-round-wind-extrabold">QnA</a></li>
					<c:choose>
						<c:when test='${empty userinfo}'>
							<li class="nav-item cta"><a data-toggle="modal"
								href="#myModal" class="nav-link nav-login"><span class="text_signup tmoney-round-wind-extrabold">Sign Up</span></a></li>
						</c:when>
						<c:otherwise>
							<c:if test='${userinfo.username == "admin" }'>
							<li class="nav-item"><a href="${root}/management" class="nav-link">Manage</a></li>
							</c:if>
							<li class="nav-item cta"><a href="${root}/mypage"
								class="nav-link nav-userinfo"><span class="text_signup"> ${userinfo.username}??? ????????????</span></a></li>
							<li class="nav-item cta"><a href="${root}/logout"
								class="nav-link nav-login"><span class="text_logout tmoney-round-wind-extrabold"> Logout</span></a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Sign In Modal Start -->
	<div id="myModal" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title board_title">?????????</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<form action="${root}/login" method="post">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<input type="text" class="form-control" id="username"
									name="username" placeholder="id" required="required">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<input type="password" class="form-control" id="password"
									name="password" placeholder="????????????" required="required">
							</div>
						</div>
						<div class="form-group" align="center">
							<button onclick="login()"
								class="btn_font btn_spacing btn_register">?????????</button>
						</div>
						<p class="hint-text">
							<a data-toggle="modal" href="#pwModal" class="nav-link">???????????? ??????</a>
						</p>
					</form>
				</div>
				<div class="modal-footer">
					?????? ????????? ????????????????<a href="${root}/signup">????????????</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Find Password Modal Start -->
	<div id="pwModal" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title board_title">???????????? ??????</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<form id="findPWForm" name="findPWForm">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<input type="text" class="form-control" id="fpusername"
									name="fpusername" placeholder="ID??? ???????????????."
									required="required">
							</div>
						</div>
						<div align="center">
							<button id = "findpw" name = "findpw" class="btn_font btn_spacing btn_register" data-dismiss="modal">
							??????
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- ???????????? modal -->
	<div class="modal" id="passwordModal" data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title board_titme">???????????? ?????? ??????</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<table class="table table-bordered">
						<colgroup>
							<col width="120">
							<col width="*">
							<col width="120">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th class="text-center">????????????</th>
								<td id="modal_password"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
			        <button type="button" class="btn_font btn_spacing_2 btn_default" data-dismiss="modal" onclick="#myModal">??????</button>
		      </div>
			</div>
		</div>
	</div>
	<!-- modal ??? -->
	
	<!-- ????????? ?????? modal -->
	<div class="modal" id="hi" data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">???????????? ??????????????? ??????????????????.</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td class="text-center">???????????? ????????? ????????????.</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- modal ??? -->
</body>
</html>