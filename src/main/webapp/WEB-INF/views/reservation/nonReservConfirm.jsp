<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page trimDirectiveWhitespaces="true" %>

<c:set var="room1" value="1001" />
<c:set var="room2" value="1002" />
<c:set var="room3" value="1003" />
<c:set var="room4" value="1004" />
<c:set var="room5" value="1005" />
<c:set var="room6" value="1006" />
<c:set var="room7" value="1007" />
<c:set var="room8" value="1008" />

<!DOCTYPE html>
<html>
<head>
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
	<link rel="stylesheet" type="text/css" href="/resources/css/reservconfirm_bookingdiv.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/log.css">
	
	<!-- 글쓰기 에디터 css-->
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
	
	<!-- j쿼리 js-->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<!-- 글쓰기 에디터 js-->
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<script src="/resources/js/writeform.js"></script>
	
	<script src="/resources/js/room.js"></script>
	<script src="/resources/js/modal.js"></script>
	<script>
		$(function(){
			$("#confirm_btn").click(function() {
				if($("#u_name").val() == null || $("#u_name").val() == "") {
					alert("이름을 입력해주세요.");
					$("#u_name").focus();
				} else if($("#u_email").val() == null || $("#u_email").val() == "") {
					alert("이메일을 입력해주세요.");
					$("#u_email").focus();
				} else if($("#u_phone").val() == null || $("#u_phone").val() == "") {
					alert("전화번호를 입력해주세요.");
					$("#u_phone").focus();
				} else {
					$("#reserv_confirm_form").submit();
				}
			});
		});
		$(window).scroll(function() {
			$('#header').css({left: 0 - $(this).scrollLeft()});
		});
	</script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<tiles:insertAttribute name="subheader" />
		</div>
		<div id="reservConfirm_Layout" style="margin-top: 90px; height: 1080px; width: 1920px;">
			<div id="container">
				<div id="booking_table_div">
					<form method="post" action="/booking/nonReservList" id="reserv_confirm_form" name="reserv_confirm_form">
						<label>이름 : </label>
						<input type="text" name="u_name" id="u_name" value="" autocomplete='off' size="30">
						<label>　이메일 : </label>
						<input type="text" name="u_email" id="u_email" value="" autocomplete='off' size="30">
						<label>　전화번호 : </label>
						<input type="text" name="u_phone" id="u_phone" value="" autocomplete='off' size="30">　
						<input type="button" name="confirm_btn" id="confirm_btn" value="확인" style="padding: 0 5px;">
					</form>
					<p style="margin: 15px 0 0 116px;">파티룸 예약 신청할 때 작성한 이름 이메일 전화번호로 검색하세요.</p>
				</div>
			</div>
		</div>
		<div id="footer">
			<tiles:insertAttribute name="subfooter" />
		</div>
	</div>
</body>
</html>