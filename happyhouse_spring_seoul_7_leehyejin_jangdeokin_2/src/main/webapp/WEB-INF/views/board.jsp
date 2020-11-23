<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>HappyHouse_Front_End_서울_7_이혜진_장덕인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500,700,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">

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

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA7GT09DhDSFW-RCE_lr1Qv78b1av8RO9k&callback=initMap&region=kr"></script> -->

<script type="text/javascript">
	$(document).ready(function() {
		
		$('#mvWriteBtn').focusin(function() {
			$(location).attr("href", "${root}/write");
		});
		
		$("#searchBtn").click(function() {
			
			if($("#sword").val() == "") {
				console.log("모든 목록 조회!!");
			} 
			$("#searchform").attr("action", "${root}/notice/list").submit();
		});
		
		$(".page-item").click(function() {
			$("#pg").val(($(this).attr("data-pg")));
			$("#pageform").attr("action", "${root}/notice/list").submit();
		});
		
		$("#delete").click(function() {
			let delno = $("#deletenoticeno").val();
			$.ajax({
				url:'${root}/notice/delete?deletenoticeno=' + delno,  
				type:'GET',
				contentType:'application/json;charset=utf-8',
				success:function() {
					location.href = "${root}/notice/list?pg=1&key=noticeno&word=";
				},
				error:function(xhr,status,msg){
					console.log("상태값 : " + status + " Http에러메시지 : "+msg);
				}
			})
		})
		
		$("#update").click(function() {
			let data = JSON.stringify({
					'noticeno': $('#updatenoticeno').val(),
					'subject' : $('#updateSubject').val(), 
					'content' : $('#updateContext').val(), 
				});
			console.log(data);
			
			$.ajax({
				url:'${root}/notice/modify',  
				type:'post',
				data : data,
				contentType:'application/json;charset=utf-8',
				success:function() {
					location.href = "${root}/notice/list?pg=1&key=noticeno&word=";
				},
				error:function(xhr,status,msg){
					console.log();
					console.log("상태값 : " + status + " Http에러메시지 : "+msg);
				}
			});
		});
	});
	
	function setDeleteNo(num) {
		$("#deletenoticeno").val(num);
	};
	
	function setUpdateNo(num) {
		$("#updatenoticeno").val(num);
	}
	
</script>
</head>
<body>

	<jsp:include page="./nav.jsp"></jsp:include>

	<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="pg" id="pg" value=""> <input
			type="hidden" name="key" id="key" value="${key}"> <input
			type="hidden" name="word" id="word" value="${word}">
	</form>
	<div class="container" align="center">
		<div class="col-lg-8" align="center">
			<h2>공지사항</h2>
			<table class="table table-borderless">
				<tr>
					<c:if test="${userinfo.username == 'admin' }">
					<td align="right"><button type="button" id="mvWriteBtn"
							class="btn btn-link">글쓰기</button></td>
					</c:if>
				</tr>
			</table>
			<form id="searchform" method="get" class="form-inline" action="">
				<input type="hidden" name="pg" id="pg" value="1">
				<table class="table table-borderless">
					<tr>
						<td align="right"><select class="form-control" name="key"
							id="skey">
								<option value="noticeno">글번호</option>
								<option value="subject">제목</option>
						</select> <input type="text" class="form-control" placeholder="검색어 입력."
							name="word" id="sword">
							<button type="button" id="searchBtn" class="btn btn-primary">검색</button>
						</td>
					</tr>
				</table>
			</form>
			<!-- <table class="table table-borderless">
	  	<tr>
	  		<td align="right">
		  	  <select class="form-control" name="spp" id="spp" onchange="javascript:countList();">
			    <option value="10" selected="selected">10개씩보기</option>
			    <option value="20">20개씩보기</option>
			    <option value="50">50개씩보기</option>
			  </select>
			</td>
	  	</tr>
	  </table> -->
			<c:if test="${notices.size() != 0}">
				<c:forEach var="notice" items="${notices}">
					<table class="table table-active">
						<tbody>
							<tr class="table-info">
								<td>작성자 : ${notice.userid}</td>
								<td align="right">작성일 : ${notice.regtime}</td>
							</tr>
							<tr>
								<td colspan="2" class="table-danger"><strong>${notice.noticeno}.
										${notice.subject}</strong></td>
							</tr>
							<tr>
								<td colspan="2">${notice.content}</td>
							</tr>
							<c:if test="${userinfo.username == 'admin'}">
								<tr>
									<td colspan="2">
										<a href="#editNoticeModal" class="update" data-toggle="modal" onclick="setUpdateNo(${notice.noticeno})">수정</a>
										<a href="#deleteNoticeModal" class="delete" data-toggle="modal" onclick="setDeleteNo(${notice.noticeno})">삭제</a>
									</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</c:forEach>
				<table>
					<tr>
						<td>${navigation.navigator}</td>
					</tr>
				</table>
			</c:if>
			<c:if test="${notices.size() == 0}">
				<table class="table table-active">
					<tbody>
						<tr class="table-info" align="center">
							<td>작성된 글이 없습니다.</td>
						</tr>
					</tbody>
				</table>
			</c:if>
		</div>
	</div>
	
	<!-- Edit Modal HTML -->
	<div id="editNoticeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="updateForm" name="updateForm">
					<div class="modal-header">
						<h4 class="modal-title">Edit Notice</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<input type="hidden" id="updatenoticeno" name="updatenoticeno">
						<div class="form-group">
							<label>Subject</label>
							<input type="text" class="form-control" id="updateSubject" required placeholder="${notice.subject}">
						</div>
						<div class="form-group">
							<label>Context</label>
							<input type="text" class="form-control" id="updateContext" required placeholder="${notice.context}">
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
	<div id="deleteNoticeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="deleteForm" name="deleteForm" method="get">
					<input type="hidden" name="deletenoticeno" id="deletenoticeno">
					<div class="modal-header">
						<h4 class="modal-title">Delete Notice</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<p>Are you sure you want to delete these Records?</p>
						<p class="text-warning">
							<small>This action cannot be undone.</small>
						</p>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
						<input type="button" class="btn btn-danger" data-dismiss="modal" id="delete" value="Delete">
						
					</div>
				</form>
			</div>
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