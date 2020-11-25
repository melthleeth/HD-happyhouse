<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:if test="${userinfo == null}">
	<c:redirect url="/"/>
</c:if>
<c:if test="${userinfo != null}">
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>My Page</title>
<link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500,700,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i" rel="stylesheet">

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

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
body {
	color: #566787;
	background: #f5f5f5;
	/* font-family: 'Varela Round', sans-serif; */
	font-size: 13px;
}

.table-responsive {
	margin: 30px 0;
	font-family: 'Varela Round', sans-serif;
}

.table-wrapper {
	background: #fff;
	padding: 20px 25px;
	border-radius: 3px;
	min-width: 1000px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title {
	padding-bottom: 15px;
	background: #435d7d;
	color: #fff;
	padding: 16px 30px;
	min-width: 100%;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

.table-title .btn-group {
	float: right;
}

.table-title .btn {
	color: #fff;
	float: right;
	font-size: 13px;
	border: none;
	min-width: 50px;
	border-radius: 2px;
	border: none;
	outline: none !important;
	margin-left: 10px;
}

.table-title .btn i {
	float: left;
	font-size: 21px;
	margin-right: 5px;
}

.table-title .btn span {
	float: left;
	margin-top: 2px;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 15px;
	vertical-align: middle;
}

table.table tr th:first-child {
	width: 60px;
}

table.table tr th:last-child {
	width: 100px;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}

table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table td:last-child i {
	opacity: 0.9;
	font-size: 22px;
	margin: 0 5px;
}

table.table td a {
	font-weight: bold;
	color: #566787;
	display: inline-block;
	text-decoration: none;
	outline: none !important;
}

table.table td a:hover {
	color: #2196F3;
}

table.table td a.edit {
	color: #FFC107;
}

table.table td a.delete {
	color: #F44336;
}

table.table td i {
	font-size: 19px;
}

table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
}

.pagination {
	float: right;
	margin: 0 0 5px;
}

.pagination li a {
	border: none;
	font-size: 13px;
	min-width: 30px;
	min-height: 30px;
	color: #999;
	margin: 0 2px;
	line-height: 30px;
	border-radius: 2px !important;
	text-align: center;
	padding: 0 6px;
}

.pagination li a:hover {
	color: #666;
}

.pagination li.active a, .pagination li.active a.page-link {
	background: #03A9F4;
}

.pagination li.active a:hover {
	background: #0397d6;
}

.pagination li.disabled i {
	color: #ccc;
}

.pagination li i {
	font-size: 16px;
	padding-top: 6px
}

.hint-text {
	float: left;
	margin-top: 10px;
	font-size: 13px;
}

/* Modal styles */
.modal .modal-dialog {
	max-width: 400px;
}

.modal .modal-header, .modal .modal-body, .modal .modal-footer {
	padding: 20px 30px;
}

.modal .modal-content {
	border-radius: 3px;
	font-size: 14px;
}

.modal .modal-footer {
	background: #ecf0f1;
	border-radius: 0 0 3px 3px;
}

.modal .modal-title {
	display: inline-block;
}

.modal .form-control {
	border-radius: 2px;
	box-shadow: none;
	border-color: #dddddd;
}

.modal textarea.form-control {
	resize: vertical;
}

.modal .btn {
	border-radius: 2px;
	min-width: 100px;
}

.modal form label {
	font-weight: normal;
}

#form-size-small {
	width: 100%;
}
</style>
<script>
	$(document).ready(function() {
		$("#update").click(function() {
			if($("#updatePassword").val() == $("#updatePasswordConfirm").val()) {
				let modifyinfo = JSON.stringify({
					"memberno" : $('#updatememberno').val(),
					"password" : $('#updatePassword').val(), 
					"email" : $('#updateEmail').val(), 
					"address" : $('#updateAddress').val(), 
					"phone" : $('#updatePhone').val()
				   });
				console.log($('#updatememberno').val());
				$.ajax({
					url:'${root}/member/update',  
					type:'PUT',
					contentType:'application/json;charset=utf-8',
					dataType:'json',
					data: modifyinfo,
					success:function(users) {
						console.log("닫히라구!!!!!")
						$("#hi").modal();
					},
					error:function(xhr,status,msg){
						console.log("상태값 : " + status + " Http에러메시지 : "+msg);
					}
				});
			} else {
				alert("비밀번호가 일치하지 않습니다.");
			}
		});
		
		$("#delete").click(function() {
			var delid = $("#deletememberno").val();
			console.log(delid);
			$.ajax({
				url:'${root}/member/delete/' + delid,  
				type:'DELETE',
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				success:function(users) {
					location.href = "${root}/logout"; 
				},
				error:function(xhr,status,msg){
					alert("상태값 : " + status + " Http에러메시지 : "+msg);
				}
			});
		})
	});

	function setMemberNo(num) {
		$("#updatememberno").val(num);
	}
	
	function setDeleteNo(num) {
		$("#deletememberno").val(num);
	}

	function getContextPath() {
		var hostIndex = location.href.indexOf(location.host) + location.host.length;
		return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
	}
</script>
</head>

<body>
	<!-- START nav -->
	<jsp:include page="./nav.jsp"></jsp:include>
	<!-- END nav -->

	<%-- <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_4.jpg');" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-2 bread">MyPage</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="${ root }/index">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>MyPage <i class="ion-ios-arrow-forward"></i></span>
					</p>
				</div>
			</div>
		</div>
	</section> --%>
	<div class="spacing_2"></div>
	<div class="container-xl">
		<div class="table-responsive">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-6">
							<h2>
								Your <b>Information</b>
							</h2>
						</div>
					</div>
				</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Name</th>
							<th>Email</th>
							<th>Address</th>
							<th>Phone</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${userinfo.username}</td>
							<td>${userinfo.email}</td>
							<td>${userinfo.address}</td>
							<td>${userinfo.phone}</td>
							<td>
								<a href="#editEmployeeModal" class="edit" data-toggle="modal" onclick="setMemberNo(${userinfo.memberno})"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a> 
								<a href='#deleteEmployeeModal' class="delete" data-toggle="modal" onclick="setDeleteNo(${userinfo.memberno})"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<!-- Edit Modal HTML -->
	<div id="editEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="updateForm" name="updateForm">
					<div class="modal-header">
						<h4 class="modal-title">Edit Yours</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<input type="hidden" id="updatememberno" name="updatememberno">
						<div class="form-group">
							<label>Password</label>
							<input type="password" class="form-control" id="updatePassword" required placeholder="New Your Password">
						</div>
						<div class="form-group">
							<label>Confirm Password</label>
							<input type="password" class="form-control" id="updatePasswordConfirm" required placeholder="New Your Password Confirm">
						</div>
						<div class="form-group">
							<label>Email</label>
							<input type="email" class="form-control" id="updateEmail" required placeholder="${userinfo.email}">
						</div>
						<div class="form-group">
							<label>Address</label>
							<textarea class="form-control" id="updateAddress" required placeholder="${userinfo.address}"></textarea>
						</div>
						<div class="form-group">
							<label>Phone</label>
							<input type="text" class="form-control" id="updatePhone" required placeholder="${userinfo.phone}">
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
						<input type="button" class="btn btn-info" data-dismiss="modal" value="Save" id="update" name="update">
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- Delete Modal HTML -->
	<div id="deleteEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="deleteForm" name="deleteForm">
					<input type="hidden" name="deletememberno" id="deletememberno">
					<div class="modal-header">
						<h4 class="modal-title">Delete Employee</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<p>정말 회원정보를 삭제하시겠습니까?</p>
						<p class="text-warning">
							<small>이 작업은 되돌릴 수 없습니다.</small>
						</p>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
						<input type="submit" class="btn btn-danger" data-dismiss="modal" id="delete" value="Delete">
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 비밀번호 modal -->
	<div class="modal" id="hi" data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title"> 비밀번호가 변경되었습니다!!</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td class="text-center">다시 로그인 해주세요.</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="location.href='${root}/logout'">Close</button>
		      </div>
			</div>
		</div>
	</div>
	<!-- modal 끝 -->

	<jsp:include page="./footer2.jsp"></jsp:include>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
            <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


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
</body>
</html>
</c:if>