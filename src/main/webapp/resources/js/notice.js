
/* === 글쓰기 수정완료 버튼 클릭 === */
/*함수가 아닌 클릭으로 진행하면 에러가남.*/
function noticeUpdate() {
	if(confirm('수정하시겠습니까?')){
		if (!formBlankCheck($('#n_title_update'), '제목을')) { return; }
		else if (!formBlankCheck($('#n_content_update'), "내용을")) { return; }
		else {
				$("#noticeUpdateForm").attr({
					"method": "post",
					"action": "/notice/update"
				});
				$("#noticeUpdateForm").submit()
		}
	}
}

function admin_noticeUpdate() {
	if(confirm('수정하시겠습니까?')){
		if (!formBlankCheck($('#n_title_update'), '제목을')) { return; }
		else if (!formBlankCheck($('#n_content_update'), "내용을")) { return; }
		else {
				$("#noticeUpdateForm").attr({
					"method": "post",
					"action": "/admin/service/notice/update"
				});
				$("#noticeUpdateForm").submit();
		}
	}
}



	
$(function() {
	/* === 공지사항 목록 버튼 클릭 === */
	$('#notice_list').click(function() {
		window.location.href = '/notice';
	});
	
	$('#admin_notice_list').click(function() {
		window.location.href = '/admin/service/notice';
	});
	
	
	
	/* === 글쓰기 버튼 클릭 === */
	$('#notice_writeform').click(function() {
		window.location.href = '/notice/write';
	});
	
	$('#admin_notice_writeform').click(function() {
		window.location.href = '/admin/service/notice/write';
	});



	/* === 글쓰기 등록 버튼 클릭 === */
	$('#notice_insert').click(function() {
		if(confirm('공시사항에 글을 등록하시겠습니까?')){
			if (!formBlankCheck($('#n_title_insert'), '제목을')) { return; }
			else if (!formBlankCheck($('#n_content_insert'), "내용을")) { return; }
			else {
				$("#noticeInsertForm").attr({
					"method": "post",
					"action": "/notice/insert"
				});
				$("#noticeInsertForm").submit();
			}
		}
	});
	
	$('#admin_notice_insert').click(function() {
		if(confirm('공시사항에 글을 등록하시겠습니까?')){
			if (!formBlankCheck($('#n_title_insert'), '제목을')) { return; }
			else if (!formBlankCheck($('#n_content_insert'), "내용을")) { return; }
			else {
				$("#noticeInsertForm").attr({
					"method": "post",
					"action": "/admin/service/notice/insert"
				});
				$("#noticeInsertForm").submit();
			}
		}
	});
	
	$('#notice_delete').click(function() {
		if(confirm('공시사항을 삭제 하시겠습니까? 재등록은 불가능 합니다.')){
			var btn = $(this).data().noticeno;			
			var data ="n_No=" + btn;
			
			var admin = $(this).data().admin;		
			
			$.ajax({
		 			url : "/notice/unavailable",  
		 			type : "post",                
		 			data : data,		 							 			
		 			error : function(){ // 전송 실패시
		 				alert('시스템에 오류가 발생했습니다.\n다시 시도해주시거나 운영자에게 문의해주세요.');
		 			},		 
		 			success : function(resultData){ // 전송 성공시 
		 				if(resultData == 'error'){
		 					alert('로그인에 오류가 발생했습니다.\n다시 시도해주시거나 운영자에게 문의해주세요.');
			 			} else if(resultData != '1'){
			 				alert('공지사항이 비활성화 되지 않았습니다.\n다시 시도해주시거나 운영자에게 문의해주세요.');
			 			} else if (resultData == '1'){
			 				alert('공지사항이 비활성화 되었습니다.');			 				
			 				if(admin == 'admin_'){
			 					location.replace('/admin/service/notice');
			 				} else {
			 					location.replace('/notice');
			 				}			 							 				
			 			} 				
		 			}
		 		}); 			
		}
	});	
	
});