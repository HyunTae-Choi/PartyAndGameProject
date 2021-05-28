<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page trimDirectiveWhitespaces="true" %>

<div class="question_div" id="viewDiv">
	<div class="notice_head">
		<h1 class="detail_title">${qvo.q_Title}</h1>
		<div class="detail_subhead">
			<span class="subhead_detail_writer">${qvo.m_Name}</span>
			<span class="subhead_detail_date"><fmt:formatDate value="${qvo.q_Date}"/></span>
			<span class="subhead_detail_right">${qvo.q_Reply_Check}</span>
		</div>
	</div>
	
	<div class="detail_content">
		${qvo.q_Content}
	</div>
		
	<div class="form_bottom">
        <button class="common_btn" onclick="UpdateForm()" type="button">수정</button>
        <a href="/mypage/question"><button class=common_btn>목록</button></a>
	</div>
</div>	


<div class="question_div" id="updateDiv" style="display: none">
	<div style="text-align: center; margin-bottom: 20px;">
		<h1>공지사항 글수정</h1>
	</div>
	
	<form id="questionUpdateForm">	
		<input type="hidden" name="q_No" value="${qvo.q_No}">
		<input type="text" name="q_Title" id="q_title_update" class="writeform_title_input" value="${qvo.q_Title}" placeholder="제목을 입력해주세요.">
		<textarea name="q_Content" class="content_update" id="q_content_update"  ></textarea> 
	</form>
	
	<div class="form_bottom">
		<button class="common_btn" onclick="questionUpdate()" type="button">수정완료</button>
		<button class="common_btn" onclick="updateCancle()" type="button">수정취소</button>
	</div>		
</div>

<script>
	$(function() {		
		$('#q_content_update').val('${qvo.q_Content}');
	});		
</script>
	


		

