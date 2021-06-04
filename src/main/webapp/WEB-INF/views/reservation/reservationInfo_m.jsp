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
	<link rel="stylesheet" type="text/css" href="/resources/css/reservationInfoLayout.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/log.css">
	
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="/resources/js/modal.js"></script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<tiles:insertAttribute name="subheader" />
		</div>
		<div id="reservation_layout">
			<div id="container">
				<div id="reservation_title">
					<h1>회원 결제하기</h1>
				</div>
				<div id="reservation_wrap">
					<div id="reservation_left_box">
						<div id="reservation_info_box">
							<div style="padding: 24px;">
								<h6 style="font-size: 16px; padding-bottom: 10px;">예약 상품 정보</h6>
								<div>
									<div id="reservation_img">
										<c:if test="${param.reserv_roomNum eq room1}">
											<img src="/resources/image/room1.jpg">
										</c:if>
										<c:if test="${param.reserv_roomNum eq room2}">
											<img src="/resources/image/room2.jpg">
										</c:if>
										<c:if test="${param.reserv_roomNum eq room3}">
											<img src="/resources/image/room3.jpg">
										</c:if>
										<c:if test="${param.reserv_roomNum eq room4}">
											<img src="/resources/image/room4.jpg">
										</c:if>
										<c:if test="${param.reserv_roomNum eq room5}">
											<img src="/resources/image/room5.jpg">
										</c:if>
										<c:if test="${param.reserv_roomNum eq room6}">
											<img src="/resources/image/room6.jpg">
										</c:if>
										<c:if test="${param.reserv_roomNum eq room7}">
											<img src="/resources/image/room7.jpg">
										</c:if>
										<c:if test="${param.reserv_roomNum eq room8}">
											<img src="/resources/image/room8.jpg">
										</c:if>
									</div>
									<div id="reservation_info">
										<span>예약 번호 : <%= request.getParameter("reserv_no") %></span><br>
										<span>파티룸 명 : <%= request.getParameter("reserv_roomName") %></span><br>
										<span>예약 날짜 : <%= request.getParameter("reserv_date") %></span><br>
										<span>예약 시간 : <%= request.getParameter("reserv_time") %></span><br>
										<span>총 인원 : <%= request.getParameter("reserv_totalPeople") %>명 (초과 인원 <%= request.getParameter("reserv_addPeople") %>명)</span>
									</div>
								</div>
							</div>
						</div>
						<div id="reservation_person_info_box">
							<div style="padding: 24px;">
								<h6 style="font-size: 16px; padding-bottom: 10px;">예약자 정보</h6>
								<div>
									<span>예약자 이름　　 : </span>
									<input type="text" id="nameInput" name="nameInput" value="${loginSession.m_Name }" readonly="readonly"><br>
									<span>예약자 이메일　 : </span>
									<input type="email" id="emailInput" name="emailInput" value="${loginSession.m_Email }" readonly="readonly"><br>
									<span>예약자 전화번호 : </span>
									<input type="text" id="phoneInput" name="phoneInput" value="${loginSession.m_Phone }" readonly="readonly">
								</div>
							</div>
						</div>
						<div id="reservation_refund_info_box">
							<div style="padding: 24px;">
								<h6 style="font-size: 16px; padding-bottom: 10px;">취소/환불 규정에 대한 동의</h6>
								<div>
									<table>
										<tr>
											<td>이용 8일 전</td>
											<td>총 금액의 100% 환불</td>
										</tr>
										<tr>
											<td>이용 7일 전</td>
											<td>총 금액의 100% 환불</td>
										</tr>
										<tr>
											<td>이용 6일 전</td>
											<td>총 금액의 100% 환불</td>
										</tr>
										<tr>
											<td>이용 5일 전</td>
											<td>총 금액의 100% 환불</td>
										</tr>
										<tr>
											<td>이용 4일 전</td>
											<td>총 금액의 100% 환불</td>
										</tr>
										<tr>
											<td>이용 3일 전</td>
											<td>환불 불가</td>
										</tr>
										<tr>
											<td>이용 2일 전</td>
											<td>환불 불가</td>
										</tr>
										<tr>
											<td>이용 전날</td>
											<td>환불 불가</td>
										</tr>
										<tr>
											<td>이용 당일</td>
											<td>환불 불가</td>
										</tr>
									</table>
									<div id="refundCheck_box" style="margin-top: 20px;">
										<input type="checkbox" name="refundCheck" id="refundCheck" value="off">
										<label for="refundCheck" style="font-size: 13px; vertical-align: 1px;"> 동의합니다</label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="reservation_right_box">
						<div id="reservation_payment_info_box">
							<div style="padding: 24px;">
								<h6 style="font-size: 16px; padding-bottom: 10px;">최종 결제금액</h6>
								<div>
									<div id="reservation_payment_info">
										<div id="reservation_payment_info_row_1">
											<div id="reservation_payment_info_left">
												<span>상품가격</span><br>
												<span>인원 추가금액</span><br>
												<span>회원 할인금액</span>
											</div>
											<div id="reservation_payment_info_right">
												<span style="color: #000;"><%= request.getParameter("reserv_basePrice") %>원</span><br>
												<span style="color: #000;"><%= request.getParameter("reserv_addPrice") %>원</span><br>
												<span style="color: #000;">-<fmt:formatNumber value='<%= request.getParameter("reserv_memberSale") %>'  groupingUsed='true' />원</span>
											</div>
										</div>
										<div id="reservation_payment_info_row_2">
											<div id="reservation_payment_info_left">
												<span style="color: #000;">총 결제금액</span>
											</div>
											<div id="reservation_payment_info_right">
												<span style="font-size: 14px; margin-bottom: 4px; color: #ffb300; font-weight: 700;">
													<fmt:formatNumber value='<%= request.getParameter("reserv_totalPrice_m") %>'  groupingUsed='true' />원
												</span>
											</div>
										</div>
										
									</div>
								</div>
							</div>
						</div>
						<div id="reservation_payment">
							<div style="padding: 24px;">
								<h6 style="font-size: 16px; padding-bottom: 10px;">결제수단</h6>
								<div style="font-size: 14px; margin-bottom: 5px;">
									<span style="font-size: 14px;">무통장입금</span>
								</div>
								<div style="font-size: 14px; padding: 3px; border: 1px solid #e5e5e5;">
									OO은행 123456000123 (주)OOO
								</div>
								<span style="font-size: 12px; color: #999;">입금자명은 예약자 이름과 동일해야 합니다.</span><br>
								<span style="font-size: 12px; color: #999;">주문 후 1시간 동안 미입금 시 자동 취소됩니다.</span>
							</div>
						</div>
						<div id="reservation_payment_chk_btn">
							<div style="padding: 10px 24px 24px 24px;">
								<div id="paymentCheck_box">
									<input type="checkbox" name="paymentCheck" id="paymentCheck" value="0">
									<label for="paymentCheck" style="font-size: 13px; vertical-align: 1px;"> 구매조건 확인 및 결제진행에 동의</label>
								</div>
							</div>
							<button id="booking_btn">결제</button>
							<button id="cancel_btn">취소</button>
							<form action="/booking/bookingNonMember.do" method="post" name="booking_form" id="booking_form">
								<input type="hidden" name="b_no" id="b_no" value="">
								<input type="hidden" name="b_date" id="b_date" value="">
								<input type="hidden" name="b_timestamp" id="b_timestamp" value="">
								<input type="hidden" name="b_time" id="b_time" value="">
								<input type="hidden" name="b_number" id="b_number" value="">
								<input type="hidden" name="b_price" id="b_price" value="">
								<input type="hidden" name="m_id" id="m_id" value="${loginSession.m_Id }">
								<input type="hidden" name="u_name" id="u_name" value="${loginSession.m_Name }">
								<input type="hidden" name="u_email" id="u_email" value="${loginSession.m_Email }">
								<input type="hidden" name="u_phone" id="u_phone" value="${loginSession.m_Phone }">
								<input type="hidden" name="r_no" id="r_no" value="">
							</form>
							<script>
								$("#booking_btn").click(function() {
									if($("#paymentCheck").is(":checked") == true && $("#refundCheck").is(":checked") == true) {
										var reserv_roonName = "<%= request.getParameter("reserv_roomName") %>";
										var reserv_no = <%= request.getParameter("reserv_no") %>;
										var reserv_date = "<%= request.getParameter("reserv_date") %>";
										var reserv_timestamp = "<%= request.getParameter("reserv_timestamp") %>";
										var reserv_time = "<%= request.getParameter("reserv_time") %>";
										var reserv_totalPeople = <%= request.getParameter("reserv_totalPeople") %>;
										var reserv_totalPrice = <%= request.getParameter("reserv_totalPrice_m") %>;
										var reserv_roomNum = <%= request.getParameter("reserv_roomNum") %>;
										$("#b_no").val(reserv_no);
										$("#b_date").val(reserv_date);
										$("#b_timestamp").val(reserv_timestamp);
										$("#b_time").val(reserv_time);
										$("#b_number").val(reserv_totalPeople);
										$("#b_price").val(reserv_totalPrice);
										$("#r_no").val(reserv_roomNum);
										$.ajax({
											url : "/booking/bookingMember.do",  
											type : "post",            
											data : $("#booking_form").serialize(), //폼전체 데이터 전송
											dataType : "text",
											error : function() { 
												alert('시스템 오류 입니다. 관리자에게 문의 하세요');
											}, 
											success : function(resultData) { 
												if(resultData == 'success') { 
													alert("예약번호 : " + $("#b_no").val() + "\n파티룸 명 : " + reserv_roonName + "\n예약날짜 : " + $("#b_date").val() + "\n예약시간 : " + $("#b_time").val() + "\n파티룸 예약 성공했습니다.");
													location.href = "/";
												} else {
													alert("파티룸 예약 실패했습니다.");
													history.back();
												}
											}
										});
									} else if($("#paymentCheck").is(":checked") == true && $("#refundCheck").is(":checked") == false) {
										alert("취소/환불 규정에 대한 동의해주세요.");
										$("#refundCheck").focus();
									} else if($("#paymentCheck").is(":checked") == false && $("#refundCheck").is(":checked") == true) {
										alert("구매조건 확인 및 결제진행에 동의해주세요.");
										$("#paymentCheck").focus();
									} else {
										alert("취소/환불 규정과 구매조건 확인 및 결제진행 모두 동의해주세요.");
										$("#refundCheck").focus();
									}
									
								});
								$("#cancel_btn").click(function(){
									history.back();
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