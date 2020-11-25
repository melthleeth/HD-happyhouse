<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="root" value="${pageContext.request.contextPath}" />
<script>
	var no = '${notice.noticeno}'; //게시글 번호
 	console.log(no + "!!!!!!!!");
	$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
	    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
	    commentInsert(insertData); //Insert 함수호출(아래)
	});
 
 
 
	//댓글 목록 
	function commentList(){
		var no = '${notice.noticeno}';
		var id = '${userinfo.username}';
		
	    $.ajax({
	        url : '${root}/comment/list/' + no,
	        type : 'get',
	        success : function(data){
	            var a =''; 
	            $.each(data, function(key, value){ 
	            	console.log(value);
	                a += '<div class="commentArea">';
	                a += '<div class="text-left comment_style_1 commentInfo'+value.commentno+'">'+''+value.comment_id;
	                if(id == value.comment_id || id == "admin") {
	                	a += '<div class="btn_spacing_5"><a class="btn_font_small btn_spacing_3 btn_default_small_2" onclick="commentUpdate('+value.commentno+',\''+value.comment_content+'\');"> 수정 </a>';
		                a += '<a class="btn_font_small btn_spacing_3 btn_default_small_2" onclick="commentDelete('+value.commentno+');"> 삭제 </a></div>';	
	                }
	                a += '</div>';
	                a += '<div class="text-left comment_style_2 commentContent'+value.commentno+'"> <span>'+value.comment_content +'</span>';
	                a += '</div></div>';

	            });
	            $(".commentList").html(a);
	        }
	    });
	};
//댓글 등록
function commentInsert(insertData){
	var data = JSON.stringify({
		'comment_commentno': $("#no").val(),
		'comment_id' : $("#id").val(),
		'comment_content': $("#comment_content").val(),
	});
	
    $.ajax({
        url : '${root}/comment/write',
        type : 'post',
        contentType:'application/json;charset=utf-8',
        data : data,
        success : function(data){
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=comment_content]').val('');
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(commentno, comment_content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="input_style_3" name="content_'+commentno+'" value="'+comment_content+'"/>';
    a += '<span class="input-group-btn"><button class="btn_font btn_spacing_4 btn_confirm" type="button" onclick="commentUpdateProc('+commentno+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+commentno).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(commentno){
	var updatedata = JSON.stringify({
		'commentno': commentno,
		'comment_content': $('[name=content_'+commentno+']').val(),
	});

    $.ajax({
        url : '${root}/comment/modify',
        type : 'put',
        contentType:'application/json;charset=utf-8',
        data : updatedata,
        success : function(){
            commentList(); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(commentno){
    $.ajax({
        url : '${root}/comment/delete/'+commentno,
        type : 'delete',
        success : function(data){
            commentList(); //댓글 삭제후 목록 출력 
        }
    });
}
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
  
</script>