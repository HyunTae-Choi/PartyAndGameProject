/* ==================== 1:1 문의사항 ==================== */

/* === 1:1 문의사항 글쓰기 등록 버튼 클릭 === */
function questionInsert(){
	if(confirm('문의글을 등록하시겠습니까?')){
			if (!formBlankCheck($('#q_title_insert'), '제목을')) { return; }
			else if (!formBlankCheck($('#q_content_insert'), "내용을")) { return; }
			else {
				$("#questionInsertForm").attr({
					"method": "post",
					"action": "/mypage/question/insert"
				});
				$("#questionInsertForm").submit();
			}
		}
};
		
	
function questionUpdate(){
	if(confirm('문의글을 수정하시겠습니까?')){
			if (!formBlankCheck($('#q_title_update'), '제목을')) { return; }
			else if (!formBlankCheck($('#q_content_update'), "내용을")) { return; }
			else {
				$("#questionUpdateForm").attr({
					"method": "post",
					"action": "/mypage/question/update"
				});
				$("#questionUpdateForm").submit();
			}
		}
};
		



/* ==================== 1:1 문의사항 답글 ==================== */

/* === 1:1 문의사항 답글입력 버튼 클릭 === */
function questionReplyInsert(){
	if(confirm('답글을 입력하시겠습니까?')){
			if (!formBlankCheck($('#qr_content_insert'), '내용을')) { return; }
			else {
				$("#questionReplyInsertForm").attr({
					"method": "post",
					"action": "/mypage/question_reply/insert"
				});
				$("#questionReplyInsertForm").submit();
			}
		}
};
function admin_questionReplyInsert(){
	if(confirm('답글을 입력하시겠습니까?')){
			if (!formBlankCheck($('#qr_content_insert'), '내용을')) { return; }
			else {
				$("#questionReplyInsertForm").attr({
					"method": "post",
					"action": "/admin/service/question_reply/insert"
				});
				$("#questionReplyInsertForm").submit();
			}
		}
};		

/* === 1:1 문의사항 답글 수정폼 불러오기 === */
function replyUpdateForm(qr_no){
	$('#replyUpdateDiv_' + qr_no).attr('style', 'display:block');
	$('#replyView_'+ qr_no).attr('style', 'display:none');
	$('#qr_content_update_' + qr_no).summernote(setting_comment);
};


/* === 1:1 문의사항 답글 수정취소 === */
function replyupdateCancle(qr_no){
	if(confirm('정말 수정을 취소하시겠습니까?')){
			$('#qr_content_update_' + qr_no).summernote('code');
			$('#qr_content_update_' + qr_no).summernote('destroy');
			$('#replyUpdateDiv_' + qr_no).attr('style', 'display:none');
			$('#replyView_'+ qr_no).attr('style', 'display:block');
		} 
};

/* === 1:1 문의사항 답글 수정완료 === */
function replyUpdateComplete(qr_no){
	if(confirm('답글을 수정하시겠습니까?')){
			if (!formBlankCheck($('#qr_content_update_' + qr_no), '내용을')) { return; }
			else {
				$('#replyUpdateForm_' + qr_no).attr({
					"method": "post",
					"action": "/mypage/question_reply/update"
				});
				$('#replyUpdateForm_' + qr_no).submit();
				}
			}
};

function admin_replyUpdateComplete(qr_no){
	if(confirm('답글을 수정하시겠습니까?')){
			if (!formBlankCheck($('#qr_content_update_' + qr_no), '내용을')) { return; }
			else {
				$('#replyUpdateForm_' + qr_no).attr({
					"method": "post",
					"action": "/admin/service/question_reply/update"
				});
				$('#replyUpdateForm_' + qr_no).submit();
				}
			}
};

