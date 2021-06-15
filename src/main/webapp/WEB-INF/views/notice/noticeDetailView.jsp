<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page trimDirectiveWhitespaces="true" %>

<div class="${changeAdminPage}notice_common_div " id="viewDiv">
	<div class="notice_head">
		<h1 class="detail_title">${nvo.n_Title}</h1>
		<div class="detail_subhead">
			<span class="subhead_detail_writer">${nvo.n_Writer}</span>
			<span class="subhead_detail_date"><fmt:formatDate value="${nvo.n_Date}"/></span>
			<span class="subhead_detail_right">조회 수 ${nvo.n_Hit}</span>
		</div>
	</div>
	
	<div class="detail_content">
		${nvo.n_Content}
	</div>
		
	<div class="form_bottom">	
		<c:if test="${loginSession.m_Id == 'admin'}">
        <button class="common_btn" onclick="UpdateForm()" type="button">수정</button>
        <button class="common_btn" id="notice_delete" data-noticeno="${nvo.n_No}" data-admin="${changeAdminPage}" type="button">삭제</button>
        </c:if>
        <button class="common_btn" id="${changeAdminPage}notice_list">목록</button>
	</div>
</div>

<c:if test="${loginSession.m_Id == 'admin'}">
<!-- admin으로 로그인할 경우에만 출력 -->

	<div class="${changeAdminPage}notice_common_div" id="updateDiv" style="display: none">
		<div style="text-align: center; margin-bottom: 20px;">
			<h1>공지사항 글수정</h1>
		</div>
		
		<form id="noticeUpdateForm">	
			<input type="hidden" name="n_No" value="${nvo.n_No}">
			<input type="text" name="n_Title" id="n_title_update" class="writeform_title_input" value="${nvo.n_Title}" placeholder="제목을 입력해주세요.">
			<textarea name="n_Content" class="content_update" id="n_content_update"  ></textarea> 
		</form>
		
		<div class="form_bottom">
			<button class="common_btn" onclick="${changeAdminPage}noticeUpdate()" type="button">수정완료</button>
			<button class="common_btn" onclick="updateCancle()" type="button">수정취소</button>
		</div>		
	</div>
	
	<script>
		$(function() {		
			$('#n_content_update').val('${nvo.n_Content}');
		});		
	</script>
	
</c:if>


		

