<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page trimDirectiveWhitespaces="true" %>

<c:set var="today" value="<%=new java.util.Date()%>"/>

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
		$(function() {
			$(".reserv_cancel_btn").click(function() {
				var today = new Date();
				var year = today.getFullYear();
				var month = today.getMonth() + 1;
				var date = today.getDate();
				if(month < 10) {
					if(date < 10) {
						var today_date = year + "-0" + month + "-0" + date;
					} else {
						var today_date = year + "-0" + month + "-" + date;
					}
				} else {
					if(date < 10) {
						var today_date = year + "-" + month + "-0" + date;
					} else {
						var today_date = year + "-" + month + "-" + date;
					}
				}
				var reserv_date = $(this).parents("tr").attr("data-reservdate");
				var date_difference_timestamp = (new Date(reserv_date).getTime() - new Date(today_date).getTime()) / 1000;
				var date_difference = date_difference_timestamp / (3600*24);
				if (!confirm("예약번호 : " + $("#b_no").val() + "\n파티룸 예약취소 하시겠습니까?")) {
		            return;
		        } else {
		        	if(date_difference < 4) {
						alert("이용 3일 전부터는 예약취소가 불가능합니다.");
					} else {
						var b_no = $(this).parents("tr").attr("data-reservnum");
						$("#b_no").val(b_no);
						$.ajax({
							url : "/booking/bookingReservCancel",  
							type : "post",            
							data : {b_no : $("#b_no").val()}, //폼전체 데이터 전송
							dataType : "text",
							error : function() { 
								alert('시스템 오류 입니다. 관리자에게 문의 하세요');
							}, 
							success : function(resultData) { 
								if(resultData == 'success') { 
									alert("예약번호 : " + $("#b_no").val() + "\n파티룸 예약 취소신청에 성공했습니다.");
									location.reload();
								} else {
									alert("파티룸 예약 취소신청에 실패했습니다.");
								}
							}
						});
					}
		        }
				
			});
			$(".reserv_return_btn").click(function() {
				var b_no = $(this).parents("tr").attr("data-reservnum");
				$("#b_no").val(b_no);
				if (!confirm("예약번호 : " + $("#b_no").val() + "\n파티룸 재예약 하시겠습니까?")) {
		            return;
		        } else {
		        	$.ajax({
						url : "/booking/bookingReservReturn",  
						type : "post",            
						data : {b_no : $("#b_no").val()}, //폼전체 데이터 전송
						dataType : "text",
						error : function() { 
							alert('시스템 오류 입니다. 관리자에게 문의 하세요');
						}, 
						success : function(resultData) { 
							if(resultData == 'success') { 
								alert("예약번호 : " + $("#b_no").val() + "\n파티룸 재예약에 성공했습니다.");
								location.reload();
							} else {
								alert("파티룸 재예약에 실패했습니다.");
							}
						}
					});
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
				<div id="booking_table_div" style="margin-top: 115px;">
					<form style="padding: 0;">
						<input type="hidden" name="b_no" id="b_no" value="">
					</form>
					<table>
						<caption style="padding-bottom: 10px">
							<%= request.getParameter("u_name") %>님 예약 내역 조회　 
							<span style="font-size: 14px">　이용 3일 전부터는 예약취소가 불가능합니다.</span>
							<fmt:formatDate var="now" type="date" value="${today}" pattern="yyyy-MM-dd"/>
							<span style="font-size: 14px; float: right;">${now }</span>
						</caption>
						<thead>
							<tr>
								<th width="160px;">예약번호</th>
								<th width="220px;">파티룸 명</th>
								<th width="150px;">예약등록일</th>
								<th width="150px;">예약날짜</th>
								<th width="70px;">시간</th>
								<th width="70px;">인원</th>
								<th width="100px;">금액</th>
								<th width="100px;">예약상황</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty nonReservList}" >
									<c:forEach var="nonReservList" items="${nonReservList}">
										<tr data-reservnum="${nonReservList.b_no}" data-reservdate="${nonReservList.b_date}">
											<c:if test="${nonReservList.b_date ge now}">
												<td>${nonReservList.b_no}</td>
												<td>${nonReservList.roomsVO.r_name}</td>
												<td class="regdate">${nonReservList.b_regdate}</td>
												<td class="reservdate">${nonReservList.b_date}</td>
												<td>${nonReservList.b_time}</td>
												<td>${nonReservList.b_number}명</td>
												<td><fmt:formatNumber value="${nonReservList.b_price}"  groupingUsed="true" />원</td>
												<c:choose>
													<c:when test="${nonReservList.b_status eq '예약완료'}">
														<td>
															${nonReservList.b_status}
															<br>
															<button class="reserv_cancel_btn" style="color:red;">예약취소</button>
														</td>
													</c:when>
													<c:when test="${nonReservList.b_status eq '환불요청'}">
														<td>
															${nonReservList.b_status}
															<br>
															<button class="reserv_return_btn" style="color:red;">요청취소</button>
														</td>
													</c:when>
													<c:otherwise>
														<td>${nonReservList.b_status}</td>
													</c:otherwise>
												</c:choose>
											</c:if>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="8">예약리스트가 없습니다. 이름 이메일 전화번호가 정확한지 확인해주세요.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<button id="return_btn">다시검색</button>
					<script>
						$("#return_btn").click(function() {
							history.back();
						});
					</script>
				</div>
			</div>
		</div>
		
		<div id="footer">
			<tiles:insertAttribute name="subfooter" />
		</div>
	</div>
</body>
</html>