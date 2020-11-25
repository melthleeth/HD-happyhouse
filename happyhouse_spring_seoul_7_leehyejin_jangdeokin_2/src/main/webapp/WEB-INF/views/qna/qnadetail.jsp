<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
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
<!-- <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA7GT09DhDSFW-RCE_lr1Qv78b1av8RO9k&callback=initMap&region=kr"></script> -->

<script type="text/javascript">
	$(document).ready(function() {
		$("#goHome").click(function() {
			location.href = "${root}/notice/qna?pg=1&key=noticeno&word=";
		})
		
		$("#delete").click(function() {
			let delno = $("#deletenoticeno").val();
			$.ajax({
				url:'${root}/notice/delete?deletenoticeno=' + delno,  
				type:'GET',
				contentType:'application/json;charset=utf-8',
				success:function() {
					location.href = "${root}/notice/qna?pg=1&key=noticeno&word=";
				},
				error:function(xhr,status,msg){
					console.log("상태값 : " + status + " Http에러메시지 : "+msg);
				}
			})
		})
		
		$("#update").click(function() {
			if($('#updateSubject').val() == '') {
				$('#updateSubject').val($("#bsubject").val());
			}
			
			if($('#updateContent').val() == '') {
				$('#updateContent').val($("#bcontent").val());	
			}
			
			let data = JSON.stringify({
					'noticeno': $('#updatenoticeno').val(),			
					'subject' : $('#updateSubject').val(), 	
					'content' : $('#updateContent').val(), 
				});
			console.log(data);
			
			$.ajax({
				url:'${root}/notice/modify',  
				type:'post',
				data : data,
				contentType:'application/json;charset=utf-8',
				success:function() {
					location.href = "${root}/notice/qna?pg=1&key=noticeno&word=";
				},
				error:function(xhr,status,msg){
					console.log();
					console.log("상태값 : " + status + " Http에러메시지 : "+msg);
				}
			});
		});
	});
	
	 function writeCmt() {
      
         var board = $("#comment_commentno").val(); // 게시글 번호 
         var id = $("#comment_id").val(); // 작성자 id
         var content = $("#comment_content").val(); // 댓글 내용 
        console.log(board);
         if(!content) {
         	alert("내용을 입력하세요.");
            return false;
         } else {    
        	 let data = JSON.stringify({
					'comment_commentno': board,
					'comment_id' : id,
					'comment_content' : content, 
				});
				
				$.ajax({
					url:'${root}/comment/write',  
					type:'post',
					data : data,
					contentType:'application/json;charset=utf-8',
					success:function(data) {
						console.log(data);
						location.href="${root}/notice/qnadetail?no=" + board;
					},
					error:function(xhr,status,msg){
						console.log("상태값 : " + status + " Http에러메시지 : "+msg);
					}
				});
         } 
     }
</script>
</head>
<body>

	<jsp:include page="../nav.jsp"></jsp:include>

	<div class="container col-lg-6" align="center">
		<h1 class="page_header">${notice.subject}</h1>
		<table class="table_board">
			<input type="hidden" name="bsubject" id="bsubject" value="${notice.subject}" />
			<input type="hidden" name="bcontent" id="bcontent" value="${notice.content}" />
			<tr class="spacing_1" align="center">
				<td><label class="label_style_1" for="subject">작성자: </label></td>
				<td class="td_style_1 text-left">${ notice.userid }</td>
			</tr>
			<tr class="spacing_1" align="center">
				<td colspan="2" class="text_hidden">-</td>
			</tr>
			<tr class="spacing_1" align="center">
				<td><label class="label_style_1" for="content">내용: </label>
				</td>
				<td class="td_style_2 text-left"> ${ notice.content } </td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<c:if
						test="${userinfo.username == notice.userid || userinfo.username == 'admin'}">
						<a href="#editNoticeModal"
							class="btn_font btn_spacing btn_register" data-toggle="modal">수정</a>
					</c:if>
					<button type="button" class="btn_font btn_default btn_spacing"
						id="goHome">글목록</button>
					<c:if
						test="${userinfo.username == notice.userid || userinfo.username == 'admin'}">
						<a href="#deleteNoticeModal"
							class="btn_font btn_spacing btn_confirm" data-toggle="modal">삭제</a>
					</c:if>
				</td>
			</tr>
		</table>
		<!-- 댓글 작성 부분 -->
		<hr>
		<c:if test="${userinfo != null }">
			<div class="container">
				<form name="commentInsertForm">
					<div class="comment_write">
						<input type="hidden" name="no" id="no" value="${notice.noticeno}" />
						<input type="hidden" name="id" id="id" value="${userinfo.username}" />
						 <input
							type="text" class="input_style_3" id="comment_content" name="comment_content"
							placeholder="내용을 입력하세요."> <span class="input-group-btn">
							<button class="btn_font btn_spacing_4 btn_default" type="button"
								name="commentInsertBtn">등록</button>
						</span>
					</div>
				</form>
			</div>
		</c:if>
		<div class="container">
			<div class="commentList"></div>
			<div class="spacing_2"></div>
		</div>
		
	
	<%@ include file="commentS.jsp" %>
	
	<!-- Edit Modal HTML -->
	<div id="editNoticeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="updateForm" name="updateForm">
					<div class="modal-header">
						<h4 class="modal-title board_title">Q&A 수정하기</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<input type="hidden" id="updatenoticeno" name="updatenoticeno" value="${notice.noticeno}">
						<div class="text-left">
							<label class="label_style_1">제목</label>
							<input type="text" class="input_style_2" id="updateSubject" required placeholder="${notice.subject}">
						</div>
						<div class="text-left">
							<label class="label_style_1">내용</label>
							<input type="text" class="input_style_2" id="updateContent" required placeholder="${notice.content}">
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn_font btn_spacing_2 btn_confirm" data-dismiss="modal" value="Save" id="update" name="update">
						<input type="button" class="btn_font btn_spacing_2 btn_default" data-dismiss="modal" value="Cancel">
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
					<input type="hidden" name="deletenoticeno" id="deletenoticeno" value="${notice.noticeno}">
					<div class="modal-header">
						<h4 class="modal-title board_title">Q&A 삭제하기</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body text-left">
						<p>해당 Q&A를 삭제하시겠습니까?</p>
						<p class="text-warning">
							<small>되돌리기 불가능</small>
						</p>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn_font btn_spacing_2 btn_confirm" data-dismiss="modal" id="delete" value="Delete">
						<input type="button" class="btn_font btn_spacing_2 btn_default" data-dismiss="modal" value="Cancel">
						
					</div>
				</form>
			</div>
		</div>
	</div>
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