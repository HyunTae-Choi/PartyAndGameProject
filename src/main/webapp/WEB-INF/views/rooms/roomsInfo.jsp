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
	
	<c:if test="${r_info.r_no eq room1}">
		<title>우드 파티룸</title>
	</c:if>
	<c:if test="${r_info.r_no eq room2}">
		<title>레트로 파티룸</title>
	</c:if>
	<c:if test="${r_info.r_no eq room3}">
		<title>다락방 파티룸</title>
	</c:if>
	<c:if test="${r_info.r_no eq room4}">
		<title>루프탑 파티룸</title>
	</c:if>
	<c:if test="${r_info.r_no eq room5}">
		<title>데이리핑크 파티룸</title>
	</c:if>
	<c:if test="${r_info.r_no eq room6}">
		<title>달빛 파티룸</title>
	</c:if>
	<c:if test="${r_info.r_no eq room7}">
		<title>블랙&#38;화이트 파티룸</title>
	</c:if>
	<c:if test="${r_info.r_no eq room8}">
		<title>화이트 파티룸</title>
	</c:if>
	
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@300;400;500;700&display=swap" rel="stylesheet">
	<link href="/resources/image/party_icon.gif" rel="shortcut icon" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/subheader.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/roomLayout.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/log.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/cal.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/review.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/paging.css">
	
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
		$(function() {
			function numberWithCommas(x) {
			    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
			// part_time 라디오버튼 클릭시 이벤트 발생
		    $("input:radio[name=part_time]").click(function() {
		    	
		    	var today_timestamp = new Date($("#today_date_string").val()).getTime() / 1000;
		    	var date_timestamp = new Date($("#date_string").val()).getTime() / 1000;
		    	if(Number(today_timestamp) < Number(date_timestamp)) {
		    		if($("input[name=part_time]:checked").val() == "낮타임") {
			    		$("#b_date").val($("#date_string").val());
			    		$("#b_time").val("낮타임");
			    		$("#addPeople").attr("disabled", false);
			    		$.ajax({
							url : "/booking/bookingCheck.do",  
							type : "post",            
							data : $("#booking_chk").serialize(), //폼전체 데이터 전송
							dataType : "text",
							error : function() { 
								alert('시스템 오류 입니다. 관리자에게 문의 하세요');
							}, 
							success : function(resultData) { 
								if(resultData == 'SoldOut') { 
									$("#date_day_time").text($("#date_string").val() + " " + $("#day_string").val() + " 낮타임");
									$("#base_price").text("이미 예약된 상품입니다.");
									$("#base_unit").text("");
									$("#add_infotext").text("");
									$("#addPeople").val("0").prop("selected", true);
									$("#add_price").text("0");
									$("#addPeople").attr("disabled", true);
									$("#total_price_text").text("0");
								} else if(resultData == 'NotSoldOut') { 
									$("#date_day_time").text($("#date_string").val() + " " + $("#day_string").val() + " 낮타임");
									if($("#day_string").val() == '토요일' || $("#day_string").val() == '일요일') {
								    	$("#base_price").text("<fmt:formatNumber value='${r_info.r_weekend_day_price}'  groupingUsed='true' />");
										$("#base_unit").text("원");
										$("#addPeople").val("0").prop("selected", true);
										$("#add_price").text("0");
										var total_price = ${r_info.r_weekend_day_price} + Number($("#add_price").text());
										$("#totalprice").val(total_price);
										$("#total_price_text").text(numberWithCommas(total_price));
										$("#add_infotext").text("기준인원 " + ${r_info.r_min_num} + "명, 추가시 5,000원");
										$("#addPeople").change(function() {
											$("#add_price").text(numberWithCommas($(this).val() * 5000));
											var total_price = ${r_info.r_weekend_day_price} + ($(this).val() * 5000);
											$("#totalprice").val(total_price);
											$("#total_price_text").text(numberWithCommas(total_price));
										});
									} else {
										$("#base_price").text("<fmt:formatNumber value='${r_info.r_weekday_day_price}'  groupingUsed='true' />");
										$("#base_unit").text("원");
										$("#addPeople").val("0").prop("selected", true);
										$("#add_price").text("0");
										var total_price = ${r_info.r_weekday_day_price} + Number($("#add_price").text());
										$("#totalprice").val(total_price);
										$("#total_price_text").text(numberWithCommas(total_price));
										$("#add_infotext").text("기준인원 " + ${r_info.r_min_num} + "명, 추가시 5,000원");
										$("#addPeople").change(function() {
											$("#add_price").text(numberWithCommas($(this).val() * 5000));
											var total_price = ${r_info.r_weekday_day_price} + ($(this).val() * 5000);
											$("#totalprice").val(total_price);
											$("#total_price_text").text(numberWithCommas(total_price));
										});
									}
								} else {
									alert('데이터베이스 오류입니다. 관리자에게 문의 하세요');
								}
							}
						});
			    	}
					if($("input[name=part_time]:checked").val() == "밤타임") {
						$("#b_date").val($("#date_string").val());
			    		$("#b_time").val("밤타임");
			    		$("#addPeople").attr("disabled", false);
						$.ajax({
							url : "/booking/bookingCheck.do", 
							type : "post",            
							data : $("#booking_chk").serialize(), //폼전체 데이터 전송
							dataType : "text",
							error : function() { 
								alert('시스템 오류 입니다. 관리자에게 문의 하세요');
							}, 
							success : function(resultData) { 
								if(resultData == 'SoldOut') { 
									$("#date_day_time").text($("#date_string").val() + " " + $("#day_string").val() + " 밤타임");
									$("#base_price").text("이미 예약된 상품입니다.");
									$("#base_unit").text("");
									$("#add_infotext").text("");
									$("#addPeople").val("0").prop("selected", true);
									$("#add_price").text("0");
									$("#addPeople").attr("disabled", true);
									$("#total_price_text").text("0");
								} else if(resultData == 'NotSoldOut') { 
									$("#date_day_time").text($("#date_string").val() + " " + $("#day_string").val() + " 밤타임");
									if($("#day_string").val() == '금요일' || $("#day_string").val() == '토요일') {
								    	$("#base_price").text("<fmt:formatNumber value='${r_info.r_weekend_night_price}'  groupingUsed='true' />");
										$("#base_unit").text("원");
										$("#addPeople").val("0").prop("selected", true);
										$("#add_price").text("0");
										var total_price = ${r_info.r_weekend_night_price} + Number($("#add_price").text());
										$("#totalprice").val(total_price);
										$("#total_price_text").text(numberWithCommas(total_price));
										$("#add_infotext").text("기준인원 " + ${r_info.r_min_num} + "명, 추가시 10,000원");
										$("#addPeople").change(function() {
											$("#add_price").text(numberWithCommas($(this).val() * 10000));
											var total_price = ${r_info.r_weekend_night_price} + ($(this).val() * 10000);
											$("#totalprice").val(total_price);
											$("#total_price_text").text(numberWithCommas(total_price));
										});
									} else {
										$("#base_price").text("<fmt:formatNumber value='${r_info.r_weekday_night_price}'  groupingUsed='true' />");
										$("#base_unit").text("원");
										$("#addPeople").val("0").prop("selected", true);
										$("#add_price").text("0");
										var total_price = ${r_info.r_weekday_night_price} + Number($("#add_price").text());
										$("#totalprice").val(total_price);
										$("#total_price_text").text(numberWithCommas(total_price));
										$("#add_infotext").text("기준인원 " + ${r_info.r_min_num} + "명, 추가시 10,000원");
										$("#addPeople").change(function() {
											$("#add_price").text(numberWithCommas($(this).val() * 10000));
											var total_price = ${r_info.r_weekday_night_price} + ($(this).val() * 10000);
											$("#totalprice").val(total_price);
											$("#total_price_text").text(numberWithCommas(total_price));
										});
									}
								} else {
									alert('데이터베이스 오류입니다. 관리자에게 문의 하세요');
								}
							}
						});
			    	}
		    	}
		    });
		    $(".admin_review_delete_btn").click(function(e) {
		    	var btn = e.target.dataset;
		    	
		    	var reviewData ="b_No=" + btn.reservnum + "&r_No=" + btn.roomnum + "&rv_No=" + btn.reviewno;
				console.log(reviewData);
				
		    	if(!confirm('정말로 리뷰를 비활성화하시겠습니까? \n리뷰에 폭언 및 욕설이 있을 경우에만 비활성화가 허용됩니다.'))return;
		    	else {
		    		$.ajax({
			 			url : "/review/admindisableupdate",  
			 			type : "post",                
			 			data : reviewData,
			 							 			
			 			error : function(){ // 전송 실패시
			 				alert('시스템에 오류가 발생했습니다.\n다시 시도해주시거나 사이트 운영자에게 문의해주세요.');
			 			},
			 
			 			success : function(resultData){ // 전송 성공시 
			 				if(resultData == 'error'){
			 					alert('시스템에 오류가 발생했습니다.\n다시 시도해주시거나 사이트 운영자에게 문의해주세요.');
			 				}else if(resultData == '0'){ // 결과값 fail
				 				alert('리뷰가 비활성화 되지 않았습니다. \n사이트 운영자에게 문의해주세요.');
				 			} else if (resultData == '1'){
				 				alert('리뷰가 비활성화 되었습니다.');
				 				window.location.reload();
				 			} 				
			 			}
			 		}); 
		    	}
		    });
		    var urlPage = getURLParams(location.search).page;
		    if(urlPage != null){
		    	console.log(urlPage);
		    	$('#button1').removeClass("menu_selected");
				$('#button2').removeClass("menu_selected");
				$('#button3').addClass("menu_selected");

				$("#button_1_contents").css("display","none");
				$("#button_2_contents").css("display","none");
				$("#button_3_contents").css("display","block"); 
				
				$('html').scrollTop(600);
		    };
		});
		function getURLParams(url) {
	        var result = {};
	        url.replace(/[?&]{1}([^=&#]+)=([^&#]*)/g, function(s, k, v) { result[k] = decodeURIComponent(v); });
	        return result;
	    }
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
		<div id="room_layout">
			<div id="container">
				<div id="room_infomation">
					<div id="room_image">
							<input type="radio" name="pos" id="pos1" checked>
							<input type="radio" name="pos" id="pos2">
							<input type="radio" name="pos" id="pos3">
							<input type="radio" name="pos" id="pos4">
							<ul>
								<li style="background: url(/uploadimage/${r_info.r_no }/${r_info.r_introimg1 }) no-repeat;"></li>
								<li style="background: url(/uploadimage/${r_info.r_no }/${r_info.r_introimg2 }) no-repeat;"></li>
								<li style="background: url(/uploadimage/${r_info.r_no }/${r_info.r_introimg3 }) no-repeat;"></li>
								<li style="background: url(/uploadimage/${r_info.r_no }/${r_info.r_introimg4 }) no-repeat;"></li>
							</ul>
						</div>
						<div id="room_image_small">
							<p class="smallimg" style="font-size: 0px;">
								<label for="pos1" style="background: url(/uploadimage/${r_info.r_no }/${r_info.r_introimg1 }) no-repeat; background-size: cover;">1</label>
								<label for="pos2" style="background: url(/uploadimage/${r_info.r_no }/${r_info.r_introimg2 }) no-repeat; background-size: cover;">2</label>
								<label for="pos3" style="background: url(/uploadimage/${r_info.r_no }/${r_info.r_introimg3 }) no-repeat; background-size: cover;">3</label>
								<label for="pos4" style="background: url(/uploadimage/${r_info.r_no }/${r_info.r_introimg4 }) no-repeat; background-size: cover;">4</label>
							</p>
						</div>
					<div id="button_group">
						<div id="button_1">
							<button id="button1">상세정보</button>
						</div>
						<div id="button_2">
							<button id="button2">주의사항</button>
						</div>
						<div id="button_3">
							<button id="button3">후기</button>
						</div>
					</div>
					<div id="button_1_contents" style="margin-bottom: 100px;">
						<p style="margin-bottom: 10px;"><strong style="font-size: 24px;">${r_info.r_name}</strong></p>
						<p style="margin-bottom: 10px; font-size: 14px;">${r_info.r_intro}</p>
						<p style="margin-bottom: 10px;">
							<strong style="font-size: 18px;"><span style="background-color: #FAC51C">&nbsp;낮타임&nbsp;</span></strong>
							<strong style="font-size: 18px;"> = 12 : 00 ~ 18 : 00</strong>
						</p>
						<p style="margin-bottom: 10px;">
							<strong style="font-size: 18px;"><span style="background-color: #FAC51C">&nbsp;밤타임&nbsp;</span></strong>
							<strong style="font-size: 18px;"> = 20 : 00 ~ 다음날 10 : 00</strong>
						</p>
						<p style="margin-bottom: 10px;"><br></p>
						<table>
							<tbody>
								<tr>
									<td style="width: 12.5%; background-color: #FAC51C;">
										<span style="font-size: 14px;"><strong>구분</strong></span>
									</td>
									<td style="width: 12.5%; background-color: #FAC51C;">
										<span style="font-size: 14px;"><strong>월</strong></span>
									</td>
									<td style="width: 12.5%; background-color: #FAC51C;">
										<span style="font-size: 14px;"><strong>화</strong></span>
									</td>
									<td style="width: 12.5%; background-color: #FAC51C;">
										<span style="font-size: 14px;"><strong>수</strong></span>
									</td>
									<td style="width: 12.5%; background-color: #FAC51C;">
										<span style="font-size: 14px;"><strong>목</strong></span>
									</td>
									<td style="width: 12.5%; background-color: #FAC51C;">
										<span style="font-size: 14px;"><strong>금</strong></span>
									</td>
									<td style="width: 12.5%; background-color: #FAC51C;">
										<span style="font-size: 14px;"><strong>토</strong></span>
									</td>
									<td style="width: 12.5%; background-color: #FAC51C;">
										<span style="font-size: 14px;"><strong>일</strong></span>
									</td>
								</tr>
								<tr>
									<td style="background-color: #efefef;">
										<span style="font-size: 14px;"><strong>낮타임</strong></span>
									</td>
									<td>
										<span style="font-size: 14px;"><fmt:formatNumber value="${r_info.r_weekday_day_price div 10000}"/>만원</span>
									</td>
									<td>
										<span style="font-size: 14px;"><fmt:formatNumber value="${r_info.r_weekday_day_price div 10000}"/>만원</span>
									</td>
									<td>
										<span style="font-size: 14px;"><fmt:formatNumber value="${r_info.r_weekday_day_price div 10000}"/>만원</span>
									</td>
									<td>
										<span style="font-size: 14px;"><fmt:formatNumber value="${r_info.r_weekday_day_price div 10000}"/>만원</span>
									</td>
									<td>
										<span style="font-size: 14px;"><fmt:formatNumber value="${r_info.r_weekday_day_price div 10000}"/>만원</span>
									</td>
									<td>
										<span style="font-size: 14px;"><fmt:formatNumber value="${r_info.r_weekend_day_price div 10000}"/>만원</span>
									</td>
									<td>
										<span style="font-size: 14px;"><fmt:formatNumber value="${r_info.r_weekend_day_price div 10000}"/>만원</span>
									</td>
								</tr>
								<tr>
									<td style="background-color: #efefef;">
										<span style="font-size: 14px;"><strong>밤타임</strong></span>
									</td>
									<td>
										<span style="font-size: 14px;"><fmt:formatNumber value="${r_info.r_weekday_night_price div 10000}"/>만원</span>
									</td>
									<td>
										<span style="font-size: 14px;"><fmt:formatNumber value="${r_info.r_weekday_night_price div 10000}"/>만원</span>
									</td>
									<td>
										<span style="font-size: 14px;"><fmt:formatNumber value="${r_info.r_weekday_night_price div 10000}"/>만원</span>
									</td>
									<td>
										<span style="font-size: 14px;"><fmt:formatNumber value="${r_info.r_weekday_night_price div 10000}"/>만원</span>
									</td>
									<td>
										<span style="font-size: 14px;"><fmt:formatNumber value="${r_info.r_weekend_night_price div 10000}"/>만원</span>
									</td>
									<td>
										<span style="font-size: 14px;"><fmt:formatNumber value="${r_info.r_weekend_night_price div 10000}"/>만원</span>
									</td>
									<td>
										<span style="font-size: 14px;"><fmt:formatNumber value="${r_info.r_weekday_night_price div 10000}"/>만원</span>
									</td>
								</tr>
							</tbody>
						</table>
						<p style="margin-bottom: 10px;"><br></p>
						<p style="margin-bottom: 10px;"><strong style="font-size: 14px;">보증금 + 50,000원(이용금액 이외 별도금액)</strong></p>
						<p style="margin-bottom: 10px; font-size: 14px;">(파티룸 예약일 기준 차주 월요일 19시 이전에 환급됩니다)</p>
						<p style="margin-bottom: 10px;"><strong style="font-size: 14px;">보증금 환급불가기준</strong></p>
						<p style="margin-bottom: 10px; font-size: 14px;">오염,파손,늦은퇴실,설거지미실시,청소미실시,구토후미수습</p>
						<p style="margin-bottom: 10px; font-size: 14px;">실내흡연,초과인원외 무단입실,문밖으로 쓰레기배출</p>
						<p style="margin-bottom: 10px;"><br></p>
						<table>
							<tbody>
								<tr>
									<td style="width: 21.63%; text-align: left; font-size: 14px; background-color: #FAC51C; font-weight: bold;">기준인원</td>
									<td colspan="2" style="width: 78.21%;text-align: left; font-size: 14px; font-weight: bold;">&nbsp;${r_info.r_min_num}명</td>
								</tr>
								<tr>
									<td rowspan="2" style="width: 140px; text-align: left; font-size: 14px; background-color: #FAC51C; font-weight: bold;">기준인원 초과 시</td>
									<td style="width: 15.66%; text-align: left; font-size: 14px; background-color: #efefef; font-weight: bold;">&nbsp;낮타임</td>
									<td style="text-align: left; font-size: 14px;">&nbsp;1인당 5,000원</td>
								</tr>
								<tr>
									<td style="width: 15.66%; text-align: left; font-size: 14px; background-color: #efefef; font-weight: bold;">&nbsp;밤타임</td>
									<td style="text-align: left; font-size: 14px;">&nbsp;1인당 10,000원</td>
								</tr>
								<tr>
									<td style="width: 140px; text-align: left; font-size: 14px; background-color: #FAC51C; font-weight: bold;">최대인원</td>
									<td colspan="2" style="text-align: left; font-size: 14px; font-weight: bold;">&nbsp;${r_info.r_max_num}명</td>
								</tr>
							</tbody>
						</table>
						<p style="margin-bottom: 10px;"><br></p>
						<p style="margin-bottom: 10px;">
							<strong style="font-size: 14px;"><span style="background-color: #FAC51C">&nbsp;전화 문의&nbsp;</span></strong>
							<span style="font-size: 14px;">= 02-6666-5555 (am 10:00 ~ pm 10:00)</span>
						</p>
						<p style="margin-bottom: 10px;"><br></p>
						<img src="/resources/image/use.png" style="margin-left: 10px;">
						<p><br></p>
						<p style="font-size: 14px; margin-bottom: 10px;">(나와있는 사진과 실제 비치되어있는 모든 물품들은 상이할수있습니다)</p>
						<p><br></p>
						<p style="font-size: 14px; margin-bottom: 10px;">★코로나 예방/방지를 위한 노력 ★</p>
						<p style="font-size: 14px; margin-bottom: 10px;">-전문 방역업체와 함께 [바이오크린콜]제품과)</p>
						<p style="font-size: 14px; margin-bottom: 10px;">방역용 분사기기로 꼼꼼하게 방역을 진행하고 있습니다</p>
					</div>
					<div id="button_2_contents" style="display: none; margin-bottom: 100px;">
						<p style="margin-bottom: 10px;"><strong style="font-size: 24px;">${r_info.r_name}</strong></p>
						<p style="margin-bottom: 10px; font-size: 14px;">${r_info.r_intro}</p>
						<p style="margin-bottom: 10px;"><br></p>
						<p style="margin-bottom: 10px;">
							<span style="font-size: 18px;">
								<strong>
									<span style="color: #D14841; text-decoration: underline;">
										숙박업소가 아닌 파티룸 입니다.
									</span>
								</strong>
							</span>
						</p>
						<p style="margin-bottom: 10px;">
							<span style="font-size: 18px;">
								<strong>
									<span style="color: #D14841; text-decoration: underline;">
										아래 사항 꼭 확인하셔서 예약부탁드립니다.
									</span>
								</strong>
							</span>
						</p>
						<p style="margin-bottom: 10px;"><br></p>

						<p style="margin-bottom: 10px;">
							<span style="font-size: 14px;">
								<span style="color: #fff; background-color: #000;">
									<strong>[입,퇴실안내]</strong>
								</span>
							</span>
						</p>
						<p style="margin-bottom: 10px;">
							<span style="font-size: 14px;">
								ㅁ 퇴실 시 마지막점검(쓰레기분리수거,설거지,분실물) 부탁드립니다.
							</span>
						</p>
						<p style="margin-bottom: 10px;">
							<span style="font-size: 14px;">
								ㅁ 쓰레기는 봉투에 담아 묶어서 실내 신발장 근처에 두시면 됩니다.<br>(절대 문밖에 내놓지 말아주세요)
							</span>
						</p>
						<p style="margin-bottom: 10px; width: 600px;">
							<span style="font-size: 14px;">
								ㅁ 10시부터 12시까지, 18시부터 20시까지 파티룸 청소시간이므로 파티룸의 원활한 운영을 위해 시간을 꼭 지켜주세요.
							</span>
						</p>

						<p style="margin-bottom: 10px;"><br></p>
						<p style="margin: 10px 0;">
							<span style="font-size: 14px;">
								<span style="color: #fff; background-color: #000;">
									<strong>[인원추가요금]</strong>
								</span>
							</span>
						</p>
						<p style="margin-bottom: 10px; width: 600px;">
							<span style="font-size: 14px;">
								ㅁ 비수기) 기준인원 초과시 1인당 추가비용 : 낮 타임 1인당 5,000원 / 숙박포함 밤 타임 1인당 10,000원
							</span>
						</p>
						<p style="margin-bottom: 10px; width: 600px;">
							<span style="font-size: 14px;">
								ㅁ 준성수기) 기준인원 초과시 1인당 추가비용 : 낮/밤 타임 구분없이 1인당 15,000원
							</span>
						</p>
						<p style="margin-bottom: 10px; width: 600px;">
							<span style="font-size: 14px;">
								ㅁ 성수기) 낮/밤 타임 구분없이 1인당 20,000원 
							</span>
						</p>
						<p style="margin-bottom: 10px; width: 600px;">
							<span style="font-size: 14px;">
								ㅁ 극성수기) 낮/밤 타임 구분없이 1인당 25,000원
							</span>
						</p>
						<p style="margin-bottom: 10px; width: 600px;">
							<span style="font-size: 14px;">
								ㅁ 각 객실마다 정해진 최대수용인원 초과를 엄격히 금하며, 예약된 인원외에는 파티룸에 입실 할 수 없습니다.
							</span>
						</p>

						<p style="margin-bottom: 10px;"><br></p>
						<p style="margin: 10px 0;">
							<span style="font-size: 14px;">
								<span style="color: #fff; background-color: #000;">
									<strong>[예약안내]</strong>
								</span>
							</span>
						</p>
						<p style="margin-bottom: 10px;">
							<span style="font-size: 14px;">
								ㅁ 숙소연락처는 예약과 동시에 고객님의 휴대폰으로 자동발송됩니다.
							</span>
						</p>
						<p style="margin-bottom: 10px;">
							<span style="font-size: 14px;">
								ㅁ 예약 전 취소수수료를 꼭 확인바랍니다.
							</span>
						</p>
						<p style="margin-bottom: 10px; width: 600px;">
							<span style="font-size: 14px;">
								ㅁ 파티룸은 숙박시설이 아니기에 숙박 관련 용품은 일체 제공되지 않습니다. (세면도구,수건 제공불가)
							</span>
						</p>
						<p style="margin-bottom: 10px; width: 600px;">
							<span style="font-size: 14px;">
								ㅁ 바닥난방이 따로 되지않습니다 각 파티룸마다 온열기구 1대씩 비치되어있습니다.
							</span>
						</p>
						<p style="margin-bottom: 10px; width: 600px;">
							<span style="font-size: 14px;">
								ㅁ 보증금 5만원있습니다 쓰레기 분리수거/설거지/파손/오염/늦은퇴실 등 파티룸상태가 문제없을시 예약하신주 차주 월요일 19시이전에 환급됩니다.
							</span>
						</p>
						<p style="margin-bottom: 10px; width: 600px;">
							<span style="font-size: 14px;">
								ㅁ 예약이 완료되면 고객님께 보증금안내 문구를 발송해드리며 안내문구 발송은 예약일에따라 상이합니다. 보증금 입금이 되어야지만 안내문자를 발송해드립니다.
							</span>
						</p>
						<p style="margin-bottom: 10px; width: 600px;">
							<span style="font-size: 14px;">
								ㅁ 취침/휴식을 위하여 쿠션,담요 등 제공합니다. (파티룸마다 상이함)
							</span>
						</p>
						<p style="margin-bottom: 10px; width: 600px;">
							<span style="font-size: 14px;">
								ㅁ 확정인원 예약 후 인원변경에 대한 금액 환급 불가합니다.
							</span>
						</p>
						<p style="margin-bottom: 10px; width: 600px;">
							<span style="font-size: 14px;">
								ㅁ 실내 흡연은 절대 불가합니다. (실내 흡연적발시 보증금환급불가)
							</span>
						</p>
						<p style="margin-bottom: 10px; width: 600px;">
							<span style="font-size: 14px;">
								ㅁ 예약하신 인원외에 무단으로 입실시에는 보증금 환금 불가 및 퇴실이 이루어질수있습니다.
							</span>
						</p>
						<p style="margin-bottom: 10px; width: 600px;">
							<span style="font-size: 14px;">
								ㅁ 분실물을 보관하지 않습니다 퇴실 후 당일에 직접 분실물을 찾아가셔야 합니다.
							</span>
						</p>

						<p style="margin-bottom: 10px;"><br></p>
						<p style="margin: 10px 0;">
							<span style="font-size: 14px;">
								<span style="color: #fff; background-color: #000;">
									<strong>[이용 주의사항]</strong>
								</span>
							</span>
						</p>
						<p style="margin-bottom: 10px;">
							<span style="font-size: 14px; width: 600px;">
								ㅁ 파티룸객실 예약 현황은 실시간 예약 특성상 100% 일치하지 않을 수 있습니다.<br>
								경우에 따라 중복예약이 발생할 수 있으며, 이 경우 먼저 결제된 예약 건이 우선 예약됩니다.
							</span>
						</p>
						<p style="margin-bottom: 10px;">
							<span style="font-size: 14px; width: 600px;">
								ㅁ 파티룸 객실 및 기타시설물은 다른 사용자를 위해서 깨끗이 사용해 주시기 바랍니다.
							</span>
						</p>
						<p style="margin-bottom: 10px; width: 600px;">
							<span style="font-size: 14px;">
								ㅁ 다른 이용 고객의 불편함이 없도록 무분별한 오락, 음주 및 고성방가를 자제하여 주시기 바랍니다.
							</span>
						</p>
						<p style="margin-bottom: 10px; width: 600px;">
							<span style="font-size: 14px;">
								ㅁ 쾌적하고 안락한 파티룸 운영 방침에 따라 최대정원 이상의 입실은 금합니다.
							</span>
						</p>
						<p style="margin-bottom: 10px; width: 600px;">
							<span style="font-size: 14px;">
								ㅁ 이용 시 시설물에 대한 책임은 투숙객에게 있으며 분실/파손 발생 시 구입가로 배상하셔야 합니다.
							</span>
						</p>
						<p style="margin-bottom: 10px; width: 600px;">
							<span style="font-size: 14px;">
								ㅁ 이용자의 귀중품 분실시 책임은 이용자에게 있으니 관리 부탁드립니다.
							</span>
						</p>
						<p style="margin-bottom: 10px; width: 600px;">
							<span style="font-size: 14px;">
								ㅁ 미성년자는 보호자의 동행 없이는 투숙이 불가합니다.
							</span>
						</p>
						<p style="margin-bottom: 10px; width: 600px;">
							<span style="font-size: 14px;">
								ㅁ 퇴실시 음식물을 비롯한 모든 쓰레기는 분리수거해 주시고, 사용하신 주방기구는 세척해 주시기 바랍니다.
							</span>
						</p>
						<p style="margin-bottom: 10px; width: 600px;">
							<span style="font-size: 14px;">
								ㅁ 정리한 쓰레기는 파티룸 내 한 곳에 두시면 청소팀이 확인하여 처리할 예정입니다. (문밖에 쓰레기 배출 시 보증금 환급불가)
							</span>
						</p>
						<p style="margin-bottom: 10px;"><br></p>
						<p style="margin: 10px 0;">
							<span style="font-size: 14px;">
								<span style="color: #fff; background-color: #000;">
									<strong>[환불규정 안내]</strong>
								</span>
							</span>
						</p>
						<p style="margin-bottom: 10px;">
							<span style="font-size: 14px;">
								<strong>이용 8일 전 </strong>
								총 금액의 100% 환불
							</span>
						</p>
						<p style="margin-bottom: 10px;">
							<span style="font-size: 14px;">
								<strong>이용 7일 전 </strong>
								총 금액의 100% 환불
							</span>
						</p>
						<p style="margin-bottom: 10px;">
							<span style="font-size: 14px;">
								<strong>이용 6일 전 </strong>
								총 금액의 100% 환불
							</span>
						</p>
						<p style="margin-bottom: 10px;">
							<span style="font-size: 14px;">
								<strong>이용 5일 전 </strong>
								총 금액의 100% 환불
							</span>
						</p>
						<p style="margin-bottom: 10px;">
							<span style="font-size: 14px;">
								<strong>이용 4일 전 </strong>
								총 금액의 100% 환불
							</span>
						</p>
						<p style="margin-bottom: 10px;">
							<span style="font-size: 14px;">
								<strong>이용 3일 전 </strong>
								환불 불가
							</span>
						</p>
						<p style="margin-bottom: 10px;">
							<span style="font-size: 14px;">
								<strong>이용 2일 전 </strong>
								환불 불가
							</span>
						</p>
						<p style="margin-bottom: 10px;">
							<span style="font-size: 14px;">
								<strong>이용 전날 </strong>
								　환불 불가
							</span>
						</p>
						<p style="margin-bottom: 10px;">
							<span style="font-size: 14px;">
								<strong>이용 당일 </strong>
								　환불 불가
							</span>
						</p>
						<p style="margin-bottom: 10px;"><br></p>
						<p style="margin-bottom: 10px; width: 600px;">
							<span style="font-size: 14px;">
								[ 구매 후 예약 상황에 따라 예약 불가 및 예약 취소가 될 수 있습니다. 구매 후 반드시 숙소로 예약 확정 여부 확인을 부탁드립니다. (이로 인한 사유로 인한 취소 시, 예약 당일이라도 100% 환불이 가능하며, 그 외 보상은 불가하오니 반드시 예약 확정 여부 확인을 부탁드립니다]
							</span>
						</p>
					</div>
					<div id="button_3_contents" style="display: none; margin-bottom: 100px;">							
						<c:if test="${not empty reviewList}">							
							<c:forEach var="reviewVO" items="${reviewList}" >															
								<div class="review">									
									<div class="review_writer" >											
										<span>${reviewVO.memberVO.m_Name}</span>												
											<span class="star-rating">
												<span style="width:${reviewVO.rv_Grade/5*100}%;"></span>
											</span>													
										<span style="color: black; font-size: 15px;"><fmt:formatDate value="${reviewVO.rv_Date}" pattern="yyyy-MM-dd"/></span>																				
									</div>
									
									<div id="review_content" style="width: 600px; min-height: 50px; margin-bottom: 10px; display: table;">
										<p style="font-size: 16px; display: table-cell; vertical-align: middle;">
											${reviewVO.rv_Content}
										</p>
									</div>
									
									<c:if test="${loginSession.m_Id == 'admin'}">
										<div id="review_function" style="width: 600px; margin-bottom: 10px;">
											<button class="admin_review_delete_btn" data-reservnum="${reviewVO.b_No}" 
											data-roomnum="${reviewVO.r_No}" data-reviewno="${reviewVO.rv_No}"
											style="border: 1px solid #d1d1d1; color:red; padding: 5px;">리뷰 비활성화</button>
										</div>
									</c:if>										
								</div>								
							</c:forEach>													
						</c:if>
						
						<c:if test="${empty reviewList}">
							<div id="reply" style="width: 600px; height:80px; line-height:80px; border-bottom: 1px solid #d1d1d1; margin: 10px 0; padding-bottom: 10px;">
								<p style="text-align:center; font-size: 18px;">리뷰가 아직 없습니다. 멋진 경험을 공유하시고 마일리지를 얻으세요!</p>
							</div>
						</c:if>
						<div id="pagination-container">			
							<c:if test="${pvo.totalCnt != null }">
								<ul id="pagination">									
									<%-- 페이지 생성 반복문 section으로 반복문 범위 지정--%>
									<c:forEach var="pageNum" begin="${pvo.section*10-9}" end="${pvo.section*10}" step="1">
										
										<%-- section이 2 이상일 경우, pre표시 --%>
										<c:if test="${pvo.section >= 2 && pageNum == (pvo.section*10-9)}">
											<li><a href="${contextPath}/rooms?r_no=${r_info.r_no}&page=${(pvo.section-1)*10}">&lt;</a></li>
										</c:if>
																	
										<c:choose>
											<%-- page와 pageNum이 같은 경우, 페이지 번호를 강조하여 현재 페이지임을 표기 --%>			
											<c:when test="${pageNum == pvo.page}">
												<li id="active"><a href="${contextPath}/rooms?r_no=${r_info.r_no}&page=${pageNum}">${pageNum}</a></li>				
											</c:when>
											
											<%-- 현재 페이지가(pageNum) maxPage 이하이면 페이지 번호 생성 --%>
											<c:when test="${pvo.maxPage >= pageNum }">
												<li><a href="${contextPath}/rooms?r_no=${r_info.r_no}&page=${pageNum}">${pageNum}</a></li>										
											</c:when>					
										</c:choose>						
								
										<%-- next표시 --%>
										<c:if test="${pvo.maxSection > pvo.section && pageNum == pvo.section*10}">
											<li><a href="${contextPath}/rooms?r_no=${r_info.r_no}&page=${pvo.section*10+1}">&gt;</a>
										</c:if>					
									</c:forEach>	
								</ul>				
							</c:if>
						</div>
					</div>
				</div>
				<div id="room_reservation">
					<div id="room_title">${r_info.r_name}</div>
					<div id="room_reserv_info">예약은 익일 부터 예약 가능합니다.</div>
					<div id="room_calendar" class="my-calendar clearfix">
						<div class="calendar-box">
							<div class="ctr-box clearfix">
								<button type="button" title="prev" class="btn-cal prev" id="prev_btn"></button>
								<span class="cal-year"></span>
								<span class="cal-month"></span>
								<button type="button" title="next" class="btn-cal next" id="next_btn"></button>
							</div>
							<table class="cal-table">
								<thead>
									<tr>
										<th class="color_red">일</th>
										<th>월</th>
										<th>화</th>
										<th>수</th>
										<th>목</th>
										<th>금</th>
										<th class="color_blue">토</th>
									</tr>
								</thead>
								<tbody class="cal-body"></tbody>
							</table>
						</div>
					</div>
					<input type="hidden" value="" name="today_date_string" id="today_date_string">
					<input type="hidden" value="" name="date_string" id="date_string">
					<input type="hidden" value="" name="day_string" id="day_string">
					<script src="/resources/js/cal.js"></script>
					<div id="room_time_select">
						<input type="radio" name="part_time" id="day_time" value="낮타임">
						<label for="day_time" style="padding-right: 20px; font-size: 18px;"> 낮타임</label>
						<input type="radio" name="part_time" id="night_time" value="밤타임">
						<label for="night_time" style="font-size: 18px;"> 밤타임</label>
					</div>
					<form name="booking_chk" id="booking_chk">
						<input type="hidden" value="${r_info.r_no }" name="r_no" id="r_no">
						<input type="hidden" value="" name="b_date" id="b_date">
						<input type="hidden" value="" name="b_time" id="b_time">
					</form>
					<div class="clearfix" id="room_price">
						<div id="date" style="float: left;">
							<p style="font-size: 16px; color: #ffb300; font-weight: 500;" id="date_day_time">
								해당날짜는 예약이 불가능합니다.
							</p>
						</div>
						<div id="base_price_div" style="float: right;">
							<span style="font-size: 16px; font-weight: bold;" id="base_price">0</span><span id="base_unit" style="font-weight: bold;">원</span>
						</div>
					</div>
					<div id="room_addPeople" class="clearfix">
						<select id="addPeople" name="addPeople" style="font-size: 14px; border: 1px solid #ccc; height: 28px; padding: 0 10px;">
							<option value="0">추가인원</option>
						</select>
						<input type="hidden" id="addPeople_number" name="addPeople_number" value="0">
						<script src="/resources/js/room_title_addpeople.js"></script>
						<span style="margin-left: 10px; font-size: 13px; color: rgba(0,0,0,0.6);" id="add_infotext"></span>
						<div id="add_price_div" style="float: right;">
							<span style="font-size: 13px;" id="add_price">0</span><span id="add_unit" style="font-size: 13px;">원</span>
						</div>
					</div>
					<div id="total_price" class="clearfix">
						<div style="float: left;">
							<span style="font-size: 16px;">총 합계</span>
						</div>
						<div style="float: right;">
							<span id="total_price_text">0</span><span id="total_unit">원</span>
							<input type="hidden" name="totalprice" id="totalprice" value="">
						</div>
					</div>
					<form method="post" name="reservation_form" id="reservation_form">
						<input type="hidden" name="reserv_no" id="reserv_no" value=""> <!-- 100121052510~20 --><!-- 100121052530~40 -->
						<input type="hidden" name="reserv_roomNum" id="reserv_roomNum" value="">
						<input type="hidden" name="reserv_roomName" id="reserv_roomName" value="">
						<input type="hidden" name="reserv_date" id="reserv_date" value="">
						<input type="hidden" name="reserv_timestamp" id="reserv_timestamp" value="">
						<input type="hidden" name="reserv_time" id="reserv_time" value="">
						<input type="hidden" name="reserv_basePeople" id="reserv_basePeople" value="">
						<input type="hidden" name="reserv_addPeople" id="reserv_addPeople" value="">
						<input type="hidden" name="reserv_totalPeople" id="reserv_totalPeople" value="">
						<input type="hidden" name="reserv_basePrice" id="reserv_basePrice" value="">
						<input type="hidden" name="reserv_addPrice" id="reserv_addPrice" value="">
						<input type="hidden" name="reserv_memberSale" id="reserv_memberSale" value="">
						<input type="hidden" name="reserv_totalPrice_m" id="reserv_totalPrice_m" value="">
						<input type="hidden" name="reserv_totalPrice_n" id="reserv_totalPrice_n" value="">
					</form>
					<div id="reservation_button_space" class="clearfix">
						<div id="cancel_button" style="margin-left: 10px;">
							<button id="cancel_btn" onclick="cancel_button()">취소</button>
						</div>
						<div id="reservation_button">
							<button id="reserv_btn" onclick="reserv_button()">예약</button>
							<script>
								
								function reserv_button(){
									var today_date_string = $("#today_date_string").val();
									var date_string = $("#date_string").val();
									var today_timestamp = new Date(today_date_string).getTime() / 1000;
									var date_timestamp = new Date(date_string).getTime() / 1000;
									if(Number(today_timestamp) >= Number(date_timestamp)) {
										alert("해당 날짜는 예약할 수 없습니다.");
									} else {
										if($("#base_price").text() == '이미 예약된 상품입니다.') {
											alert("해당 상품은 이미 예약된 상품입니다.");	
										} else {
											var dateString = $("#date_string").val();
											var dateArray = dateString.split('-');
											var date = (dateArray[0] + dateArray[1] + dateArray[2]).substring(2);
											if($("input:radio[name='part_time']:checked").val() == '낮타임') {
												var randomNum = Math.floor(Math.random() * 11) + 10;
											}
											if($("input:radio[name='part_time']:checked").val() == '밤타임') {
												var randomNum = Math.floor(Math.random() * 11) + 30;
											}
											var reserv_no = ${r_info.r_no} + date + randomNum;
											$("#reserv_no").val(reserv_no);
											$("#reserv_roomNum").val(${r_info.r_no});
											$("#reserv_roomName").val("${r_info.r_name}");
											$("#reserv_date").val($("#date_string").val());
											$("#reserv_timestamp").val(new Date($("#date_string").val()).getTime() / 1000);
											$("#reserv_time").val($("input:radio[name='part_time']:checked").val());
											$("#reserv_basePeople").val(${r_info.r_min_num});
											$("#reserv_addPeople").val($("#addPeople option:selected").val());
											$("#reserv_totalPeople").val((Number(${r_info.r_min_num}) + Number($("#addPeople option:selected").val())));
											$("#reserv_basePrice").val($("#base_price").text());
											$("#reserv_addPrice").val($("#add_price").text());
											$("#reserv_memberSale").val($("#totalprice").val() * 0.05);
											$("#reserv_totalPrice_m").val($("#totalprice").val() * 0.95);
											$("#reserv_totalPrice_n").val($("#totalprice").val());
											$('#reserv_form_modal').attr("style", "display:block");	
										}
									}
								}
								
								function cancel_button(){
									location.href = "/#rooms";
								}
								
								$("#member_reserv_btn").click(function() {
									if(${loginSession.m_Id == null || loginSession.m_Id == ''}) {
										$('#reserv_form_modal').attr("style", "display:none");	
										$("#open_login_modal").click();
									} else {
										$("#reservation_form").attr("action", "reservationInfo_m");
										$("#reservation_form").submit();
									}
								});
								
								$("#non_member_reserv_btn").click(function() {
									$("#reservation_form").attr("action", "reservationInfo_n");
									$("#reservation_form").submit();
								});
							</script>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="footer">
			<tiles:insertAttribute name="subfooter" />
		</div>
	</div>
</body>
</html>