<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page trimDirectiveWhitespaces="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>




<div class="question_div">
	<div style="text-align: center; margin-bottom: 20px;">
		<h1>1:1 문의하기</h1>
	</div>
	
	<form id="questionInsertForm">			
		<input type="text" name="q_Title" id="q_title_insert" class="writeform_title_input" placeholder="제목을 입력해주세요.">		
		<textarea class="q_content_area" id="q_content_insert" name="q_Content" ></textarea> 										
	</form>
	
	<div class="form_bottom">
		<button class="common_btn" id="question_insert">등록</button>
		<a href="/mypage/question"><button class=common_btn>목록</button></a>
	</div>	
</div>
		
<script>
$(document).ready(function() {
    $('.q_content_area').summernote(setting);
        
});
</script>
