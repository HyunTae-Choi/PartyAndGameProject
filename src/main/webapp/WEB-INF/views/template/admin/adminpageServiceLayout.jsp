<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="/resources/image/party_icon.gif" rel="shortcut icon" type="image/x-icon">
	<title><tiles:getAsString name="title" /></title>
	
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@300;400;500;700&display=swap" rel="stylesheet">
	<link href="/resources/image/party_icon.gif" rel="shortcut icon" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/subheader.css">
	
	<link rel="stylesheet" type="text/css" href="/resources/css/mainLayout.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/mypageLayout.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/mypage_infodiv.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/mypage_bookingdiv.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/mypage_questiondiv.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/log.css">
	
	<link rel="stylesheet" type="text/css" href="/resources/css/adminpage_noticediv.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/common_list_writeform.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/paging.css">
	
	<!-- 글쓰기 에디터 css-->
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
	
	<!-- j쿼리 js-->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<!-- 글쓰기 에디터 js-->
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<script src="/resources/js/writeform.js"></script>
	
	<script src="/resources/js/mypage.js"></script>
	<script src="/resources/js/modal.js"></script>
	<script src="/resources/js/notice.js"></script>
	<script src="/resources/js/question.js"></script>
	
	<script>
		$(window).scroll(function() {
			$('#header').css({left: 0 - $(this).scrollLeft()});
		});
	</script>
	
</head>

<body>
	<div id="wrap">
	
		<div id="header">
			<tiles:insertAttribute name="adminheader" />
		</div>
		
		<div id="mypage_layout">
			<div id="container">			
				<div id="side_menu">
					<ul>
						<li><a href="${contextPath}/admin/service/notice"><button id="admin_notice_btn">공지사항</button></a></li>
						<li><a href="${contextPath}/admin/service/question"><button id="admin_question_btn">1:1 문의</button></a></li>
					</ul>
				</div>
	
				<div id="main_content">				
					<tiles:insertAttribute name="content" />
				</div>			
			</div>
		</div>
				
		<div id="footer">
			<tiles:insertAttribute name="subfooter" />
		</div>
		
	</div>
  </body>
</html>
