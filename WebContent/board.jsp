<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>HappyHouse_Front_End_서울_7_이혜진_최낙훈</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500,700,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">

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

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA7GT09DhDSFW-RCE_lr1Qv78b1av8RO9k&callback=initMap&region=kr"></script> -->
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">HappyHouse</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="index.jsp" class="nav-link">Home</a></li>
					<li class="nav-item"><a href="properties.html" class="nav-link">Properties</a></li>
					<!-- <li class="nav-item"><a href="agents.html" class="nav-link">Agents</a></li> -->
					<!-- <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li> -->
					<li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
					<!-- <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li> -->
					<li class="nav-item"><a href="member-management.html" class="nav-link">Manage</a></li>
					<li class="nav-item cta"><a data-toggle="modal" href="#myModal" class="nav-link"><span>Sign Up</span></a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<section class="ftco-section ftco-no-pb ftco-no-pt" >
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="search-wrap-1 ftco-animate p-4 px-5" style="margin-top:0;">
						<form action="#" class="search-property-1">
							<div class="row">
								<!-- <div class="col-lg align-items-end">
									<div class="form-group">
										<label for="#">Location</label>
										<div class="form-field">
											<div class="icon"><span class="ion-ios-search"></span></div>
											<input type="text" class="form-control" placeholder="City/Locality Name">
										</div>
									</div>
								</div> -->
								<div class="col-lg align-items-end">
									<div class="form-group">
										<label for="#">도/광역시</label>
										<div class="form-field">
											<div class="select-wrap">
												<div class="icon"><span class="ion-ios-arrow-down"></span></div>
												<select name="" id="" class="form-control">
													<optgroup label="광역시">
														<option value="">서울특별시</option>
														<option value="">부산광역시</option>
														<option value="">대구광역시</option>
														<option value="">인천광역시</option>
														<option value="">광주광역시</option>
														<option value="">대전광역시</option>
														<option value="">울산광역시</option>
														<option value="">세종특별자치시</option>
													</optgroup>
													<optgroup>
														<option value="">경기도</option>
														<option value="">강원도</option>
														<option value="">충청북도</option>
														<option value="">충청남도</option>
														<option value="">전라북도</option>
														<option value="">전라남도</option>
														<option value="">경상북도</option>
														<option value="">경상남도</option>
														<option value="">제주특별자치도</option>
													</optgroup>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg align-items-end">
									<div class="form-group">
										<label for="#">구/군</label>
										<div class="form-field">
											<div class="select-wrap">
												<div class="icon"><span class="ion-ios-arrow-down"></span></div>
												<select name="" id="" class="form-control">
													<option value="">서초구</option>
													<option value="">동작구</option>
													<option value="">강남구</option>
													<option value="">송파구</option>

												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg align-items-end">
									<div class="form-group">
										<label for="#">동</label>
										<div class="form-field">
											<div class="select-wrap">
												<div class="icon"><span class="ion-ios-arrow-down"></span></div>
												<select name="" id="" class="form-control">
													<option value="">역삼동</option>
													<option value="">일원동</option>
													<option value="">논현동</option>
													<option value="">삼성동</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg align-self-end">
									<div class="form-group">
										<div class="form-field">
											<input type="submit" value="Search" class="form-control btn btn-primary">
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	<div class="container">
			
			<div class="row container">
				
				<section class="ftco-section" style="margin-right:50px; padding-top:30px;">
					<h1 class="ftco-heading-1">거래 정보</h1>
					<div class="card" style="width: 18rem;">
						<img class="card-img-top" width="200px" height="200px" src="./img/동성아파트.jpg" alt="동성아파트">
						<div class="card-body">
							<h5 class="card-title">동성아파트</h5>
							<p class="card-text"> 거래금액 : 52,500만원 </p>
							<p class="card-text"> 전용면적 : 84.695</p>
							<p class="card-text"> 거래구분 : 아파트 매매 </p>
							<!-- <a href="#" class="btn btn-primary">Go somewhere</a> -->
						</div>
					</div>
					<div class="card" style="width: 18rem;">
						<img class="card-img-top" width="200px" height="200px" src="./img/창신동두산.jpg" alt="창신동두산">
						<div class="card-body">
							<h5 class="card-title">창신동두산</h5>
							<p class="card-text"> 거래금액 : 77,777만원 </p>
							<p class="card-text"> 전용면적 : 84.695</p>
							<p class="card-text"> 거래구분 : 아파트 매매 </p>
							<!-- <a href="#" class="btn btn-primary">Go somewhere</a> -->
						</div>
					</div>
					<div class="card" style="width: 18rem;">
						<img class="card-img-top" width="200px" height="200px" src="./img/현대뜨레비앙.jpg" alt="현대뜨레비앙">
						<div class="card-body">
							<h5 class="card-title">현대뜨레비앙</h5>
							<p class="card-text"> 거래금액 : 64,500만원 </p>
							<p class="card-text"> 전용면적 : 118.695</p>
							<p class="card-text"> 거래구분 : 아파트 매매 </p>
							<!-- <a href="#" class="btn btn-primary">Go somewhere</a> -->
						</div>
					</div>
				</section>
				<section class="ftco-section" style="padding-top:80px;">
					<div align="center" style="margin-top: 20px;">
						<iframe src="./map.html" width="700px" height="800px"></iframe>
					</div>
				</section>
			</div>
	</div>

</body>
<script src="js/jquery.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/aos.js"></script>
<script src="js/jquery.animateNumber.min.js"></script>
<script src="js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="js/google-map.js"></script>
<script src="js/main.js"></script>
</html>