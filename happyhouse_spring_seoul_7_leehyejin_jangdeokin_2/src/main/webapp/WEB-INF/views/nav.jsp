<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500,700,900" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i" rel="stylesheet">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
	
	<link rel="stylesheet" href="/css/open-iconic-bootstrap.min.css">
	<link rel="stylesheet" href="/css/animate.css">

	<link rel="stylesheet" href="/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="/css/magnific-popup.css">

	<link rel="stylesheet" href="/css/aos.css">

	<link rel="stylesheet" href="/css/ionicons.min.css">

	<link rel="stylesheet" href="/css/bootstrap-datepicker.css">
	<link rel="stylesheet" href="/css/jquery.timepicker.css">


	<link rel="stylesheet" href="/css/flaticon.css">
	<link rel="stylesheet" href="/css/icomoon.css">
	<link rel="stylesheet" href="/css/style.css">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script>
	function login() {
		if(document.getElementById("username").value == "") {
			alert("아이디를 입력하세요");
			return;
		} else if(document.getElementById("password").value == "") {
			alert("비밀번호를 입력하세요");
			return;
		} else {
			document.getElementById("loginForm").action = "${root}/user/login";
			document.getElementById("loginForm").submit();
		}
	}
	$( document ).ready(function() {
		$("#fpSubmitBtn").click(function () {
	        $.ajax({
	            url: "${root}/main.do?action=findPW",
	            type: "POST",
	            data: {
	                "username": $('#fpusername').val()
	            },
	            success: function(data) {
	            	//window.open("",data);
	            	alert("해당 아이디의 비밀번호는 "+data+"입니다.");
	            	location.href = "index.jsp";
	            },error:function(request,error){
	                alert("message:"+request.responseText);
	            }
	        });
	    });
	});
	 
	
	
	/*  function findPW() {
		if(document.getElementById("fpusername").value == "") {
			alert("아이디를 입력하세요");
			return;
		} else {
			document.getElementById("findPWForm").action = "${root}/main.do?action=findPW";
			document.getElementById("findPWForm").submit();
			alert($('password'));
		}
	}  */

		function getContextPath() {
			var hostIndex = location.href.indexOf(location.host) + location.host.length;
			return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
		}
	</script>
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="${root}/page/index">HappyHouse</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
				aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="${root}/page/index" class="nav-link">Home</a></li>
					<!-- <li class="nav-item"><a href="properties.jsp" class="nav-link">Properties</a></li>
					<li class="nav-item"><a href="agents.jsp" class="nav-link">Agents</a></li>
					<li class="nav-item"><a href="blog.jsp" class="nav-link">Blog</a></li> -->
					<li class="nav-item"><a href="${root}/page/about" class="nav-link">About</a></li>
					<!-- <li class="nav-item"><a href="contact.jsp" class="nav-link">Contact</a></li> -->
					<li class="nav-item"><a href="${root }/page/management" class="nav-link">Manage</a></li>
					<c:choose>
						<c:when test='${empty userinfo}'>
							<li class="nav-item cta"><a data-toggle="modal" href="#myModal" class="nav-link"><span>Sign
												Up</span></a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="nav-item cta"><a href="${root }/user/logout" class="nav-link"><span>
								${userinfo.username}님 로그인중</span></a>
							</li>
							<li class="nav-item cta"><a href="${root }/user/logout" class="nav-link"><span>
								Logout</span></a>
							</li>
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
					<h4 class="modal-title">Sign In</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<form action="${root }/user/login" method="post">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<input type="text" class="form-control" id="username" name="username" placeholder="Username"
									required="required">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<input type="password" class="form-control" id="password" name="password" placeholder="Password"
									required="required">
							</div>
						</div>
						<div class="form-group">
							<button onclick="login()" class="btn btn-primary btn-block btn-lg">Sign In</button>
						</div>
						<p class="hint-text"><a data-toggle="modal" href="#pwModal" class="nav-link">Forgot Password?</a></p>
					</form>
				</div>
				<div class="modal-footer">Don't have an account? <a href="${root}/page/signup">Create one</a></div>
			</div>
		</div>
	</div>
	
		<!-- Sign In Modal Start -->
	<div id="pwModal" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Find My Password</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<form action="${root }/main.do?action=findPW" method="post" id="findPWForm">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<input type="text" class="form-control" id="fpusername" name="username" placeholder="Input Your Username."
									required="required">
							</div>
						</div>
						<!-- <div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<input type="password" class="form-control" id="password" name="password" placeholder="Password"
									required="required">
							</div>
						</div> -->
						<div>
							<div id="fppassword"></div>
						</div>
						<div class="form-group">
						<!--  -->
						<!-- onclick="findPW()" -->
							<button id="fpSubmitBtn" class="btn btn-primary btn-block btn-lg">Find P/W</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">Don't have an account? <a href="signup.jsp">Create one</a></div>
			</div>
		</div>
	</div> 
	
	<div id="showpwModal" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Show My Password</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div id="showpw">
					
					</div>
				</div>
			</div>
		</div>
	</div> 
</body>
</html>