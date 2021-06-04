<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page trimDirectiveWhitespaces="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>




<div class="${changeAdminPage}notice_common_div">
	<div style="text-align: center; margin-bottom: 20px;">
		<h1>공지사항 글쓰기</h1>
	</div>
	
	<form id="noticeInsertForm">			
		<input type="text" name="n_Title" id="n_title_insert" class="writeform_title_input" placeholder="제목을 입력해주세요.">		
		<textarea class="n_content_area" id="n_content_insert" name="n_Content" ></textarea> 										
	</form>
	
	<div class="form_bottom">
		<button class="common_btn" id="${changeAdminPage}notice_insert">등록</button>
		<button class="common_btn" id="${changeAdminPage}notice_list" >목록</button>
	</div>	
</div>
		
<script>
$(document).ready(function() {
    $('.n_content_area').summernote(setting);
        
});
</script>
