<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page trimDirectiveWhitespaces="true" %>

<script type="text/javascript">
$(function() {
	$('#test_dd').click(function(){
		$('.test_none').attr('style', 'display:block');	
	});
});
</script>

<%-- 질문 보기 div --%>
<div class="question_div" id="viewDiv">
	<div class="notice_head">
		<h1 class="detail_title">${qvo.q_Title}</h1>
		<div class="detail_subhead">
			<span class="subhead_detail_writer">${qvo.memberVO.m_Name}<span style="padding-left: 5px; color: #626262">(${qvo.m_Id})</span></span>
			<span class="subhead_detail_date" id="test_dd"><fmt:formatDate value="${qvo.q_Date}"/></span>
								
			<c:choose>
				<c:when test="${loginSession.m_Id != 'admin'}">
					<span class="subhead_detail_right" >${qvo.q_Reply_Check}</span>
				</c:when>
				<c:when test="${loginSession.m_Id == 'admin'}">
					<button class="subhead_detail_right" id="changeReplyCheck">${qvo.q_Reply_Check}</button>
					<input type="hidden" id="q_No_ReplyChange" value="${qvo.q_No}"/>
					<input type="hidden" id="q_Reply_Check_ReplyChange" value="${qvo.q_Reply_Check}"/>
				</c:when>
			</c:choose>	
			
		</div>
	</div>
	
	<div class="detail_content" style="border-bottom: 1px solid white;">
		${qvo.q_Content}
	</div>
	
	<div class="form_bottom" style="margin-bottom: 10px; border-bottom: 1px solid #ccc;">
		<c:choose>
			<c:when test="${loginSession.m_Id != 'admin'}">
				<button class="common_btn" onclick="UpdateForm()" type="button">수정</button>
        		<a href="/mypage/question"><button class=common_btn>목록</button></a>
			</c:when>
			<c:when test="${loginSession.m_Id == 'admin'}">
        		<a href="/admin/service/question"><button class=common_btn>목록</button></a>
			</c:when>
		</c:choose>        
	</div>

	
	<%-- 답글 보기 div --%>
	<div class="question_reply_div">
	
		<c:if test="${not empty questionReplyList}" >
			
			<c:forEach var="questionReply" items="${questionReplyList}" varStatus="status">			
				
				<div class="reply_content ${questionReply.qr_No}">				
					<div class="reply_head" >
						
						<c:choose>
							<c:when test="${empty questionReply.memberVO.m_Name}"><span class="subhead_detail_writer">admin</span></c:when>
							<c:otherwise>
								<span class="subhead_detail_writer"> 
									${questionReply.memberVO.m_Name} <span style="padding-left: 5px; color: #626262">(${questionReply.m_Id})</span>							
								</span>
							</c:otherwise>
						</c:choose>				
						
						<span class="subhead_detail_date" style="float: right; padding-right: 30px;">
							<fmt:formatDate value="${questionReply.qr_Date}" pattern="yy-MM-dd HH:ss" />
						</span>						
																	
					</div>
					
					<div class="reply_body" id="replyView_${questionReply.qr_No}">
						<c:if test="${loginSession.m_Id == questionReply.m_Id or (loginSession.m_Id == 'admin' and empty questionReply.m_Id)}">
							<button class="reply_update_button" onclick="replyUpdateForm(${questionReply.qr_No})">수정</button>
						</c:if>
						
						${questionReply.qr_Content}							
					</div>
					
					<c:if test="${loginSession.m_Id == questionReply.m_Id or (loginSession.m_Id == 'admin' and empty questionReply.m_Id)}">
						<div class="reply_update_body" id="replyUpdateDiv_${questionReply.qr_No}" style="display: none">
							
							
							<form id="replyUpdateForm_${questionReply.qr_No}">	
								<input type="hidden" name="m_Id" value="${loginSession.m_Id}">
								<input type="hidden" name="q_No" value="${qvo.q_No}">
								<input type="hidden" name="qr_No" value="${questionReply.qr_No}">
								<textarea class="content_update" name="qr_Content" id="qr_content_update_${questionReply.qr_No}"  ></textarea> 
							</form>
							
							<div class="form_bottom">							
								<button class="common_btn" onclick="${changeAdminPage}replyUpdateComplete(${questionReply.qr_No})" type="button" style="width: 100px;">답글수정완료</button>
								<button class="common_btn" onclick="replyupdateCancle(${questionReply.qr_No})" type="button" style="width: 100px;">답글수정취소</button>
							</div>		
						</div>
					
						<script>
							$(function() {		
								$('#qr_content_update_${questionReply.qr_No}').val('${questionReply.qr_Content}');
							});		
						</script>					
					</c:if>
									
				</div>
		
			</c:forEach>
		</c:if>
	</div>
	<%-- 답글 보기 div end --%>
	
	<%-- 답글 입력 div --%>
	<div class="question_reply_insert_div">
		<form id="questionReplyInsertForm">
			<input type="hidden" name="m_Id" value="${loginSession.m_Id}">
			<input type="hidden" name="q_No" value="${qvo.q_No}">					
			<textarea class="qr_content_area" id="qr_content_insert" name="qr_Content" ></textarea> 										
		</form>
		<div class="form_bottom">
			<button class="common_btn" onclick="${changeAdminPage}questionReplyInsert()" style="float: left; margin-top: 5px; ">답글 등록</button>
		</div>	
		<script type="text/javascript">
			$(document).ready(function() {
			    $('.qr_content_area').summernote(setting_comment);
			});
	       </script>
	</div>
	<%-- 답글 입력 div end--%>
</div>
<%-- 질문 보기 div end --%>

<%-- 질문 수정 div --%>
<c:if test="${loginSession.m_Id != 'admin'}">
	<div class="question_div" id="updateDiv" style="display: none">
		<div style="text-align: center; margin-bottom: 20px;">
			<h1>공지사항 글수정</h1>
		</div>
		
		<form id="questionUpdateForm">	
			<input type="hidden" name="m_Id" value="${loginSession.m_Id}">
			<input type="hidden" name="q_No" value="${qvo.q_No}">
			<input type="text" name="q_Title" id="q_title_update" class="writeform_title_input" value="${qvo.q_Title}" placeholder="제목을 입력해주세요.">
			<textarea class="content_update" name="q_Content" id="q_content_update"  ></textarea> 
		</form>
		
		<div class="form_bottom">			
			<button class="common_btn" onclick="questionUpdate()" type="button">수정완료</button>
			<button class="common_btn" onclick="updateCancle()" type="button">수정취소</button>
		</div>		
		
	<script>
		$(function() {		
			$('#q_content_update').val('${qvo.q_Content}');
		});		
	</script>
		
	</div>	
</c:if>
<%-- 질문 수정 div end --%>

<%-- 답변상황 변경 div --%>
<c:if test="${loginSession.m_Id == 'admin'}">
	<script>
	/* === 1:1 답변상황 변경 버튼 클릭 === */
	$('#changeReplyCheck').click(function() {
		var q_Reply_Check = $('#q_Reply_Check_ReplyChange').val();
		var q_No = $('#q_No_ReplyChange').val();
		
		if(confirm('답변 상태를 변경 하시겠습니까?')){
			$.ajax({
	 			url : "/admin/service/question/replychange",  
	 			type : "post",
	 			data : "q_Reply_Check="+q_Reply_Check+"&q_No="+q_No,
	 			error : function(){  
	 				alert('시스템에 오류가 발생했습니다.\n다시 시도해주시거나 사이트 운영자에게 문의해주세요.');
	 			},
	 			success : function(resultData){ 
	 				if (resultData!='1') { 
		 				alert('답변상황 변경에 실패했습니다. \n사이트 운영자에게 문의해주세요.');
		 			} else if (resultData=='1') { 
	 					alert('답변상황 변경에 성공했습니다.');
	 					window.location.reload();
	 				} 
	 			}
	 		});			
		}
	});	
	</script>
</c:if>
<%-- 답변상황 변경 div end --%>

		

