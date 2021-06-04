<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page trimDirectiveWhitespaces="true" %>

<c:set var="today" value="<%=new java.util.Date()%>"/>
<script>
	$(function() {
		$(".reserv_complete_btn").click(function() {
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
			if(date_difference <= 0) {
				alert("예약일이 지났습니다.");
			} else {
				var b_no = $(this).parents("tr").attr("data-reservnum");
				$("#b_no").val(b_no);
				$.ajax({
					url : "/booking/bookingReservComplete",  
					type : "post",            
					data : {b_no : $("#b_no").val()},
					dataType : "text",
					error : function() { 
						alert('시스템 오류 입니다.');
					}, 
					success : function(resultData) { 
						if(resultData == 'success') { 
							alert("예약번호 : " + $("#b_no").val() + "\n파티룸 예약완료");
							location.reload();
						} else {
							alert("실패");
						}
					}
				});
			}
		});
		$(".reserv_cancel_btn").click(function() {
			var b_no = $(this).parents("tr").attr("data-reservnum");
			$("#b_no").val(b_no);
			$.ajax({
				url : "/booking/bookingDelete",  
				type : "post",            
				data : {b_no : $("#b_no").val()},
				dataType : "text",
				error : function() { 
					alert('시스템 오류 입니다.');
				}, 
				success : function(resultData) { 
					if(resultData == 'success') { 
						alert("예약번호 : " + $("#b_no").val() + "\n파티룸 예약취소 완료");
						location.reload();
					} else {
						alert("실패");
					}
				}
			});
		});
	});
</script>
<style>
	#booking_table_div ul::after {
		content:'';
		display:block;
		clear:both;
	}
</style>
<div id="booking_table_div">
	<form style="padding: 0;">
		<input type="hidden" name="b_no" id="b_no" value="">
		<input type="hidden" name="b_price_mileage" id="b_price_mileage" value="">
	</form>
	<ul style="margin: 50px 0 0 90px;">
		<li style="float: left; margin-right: 10px; font-weight: bold;"><a href="/admin/manage/booking/bookingFullList">전체</a></li>
		<li style="float: left; margin-right: 10px; font-weight: bold;"><a href="/admin/manage/booking/bookingWaitingList">입금대기</a></li>
		<li style="float: left; margin-right: 10px; font-weight: bold;"><a href="/admin/manage/booking/bookingReservList">예약완료</a></li>
		<li style="float: left; margin-right: 10px; font-weight: bold;"><a href="/admin/manage/booking/bookingReservDayList">예약당일</a></li>
		<li style="float: left; margin-right: 10px; font-weight: bold;"><a href="/admin/manage/booking/bookingRefundWaitingList">환불요청</a></li>
		<li style="float: left; margin-right: 10px; font-weight: bold;"><a href="/admin/manage/booking/bookingRefundList">환불완료</a></li>
	</ul>
 	<table style="margin-left: 90px; margin-top: 10px;">
		<caption style="padding-bottom: 10px">
			입금대기 리스트 조회
			<fmt:formatDate var="now" type="date" value="${today}" pattern="yyyy-MM-dd"/>
			<span style="font-size: 14px; float: right;">${now }</span>
		</caption>
		<thead>
			<tr style="font-size: 13px;">
				<th width="107px;">예약번호</th>
				<th width="130px;">파티룸 명</th>
				<th width="120px;">아이디</th>
				<th>이름</th>
				<th width="100px;">전화번호</th>
				<th>예약등록일</th>
				<th>예약날짜</th>
				<th>시간</th>
				<th>인원</th>
				<th>금액</th>
				<th>예약상황</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${not empty bookingWaitingList}" >
					<c:forEach var="bookingList" items="${bookingWaitingList}">
						<tr style="font-size: 13px;" data-reservnum="${bookingList.b_no}" data-reservdate="${bookingList.b_date}">
							<td>${bookingList.b_no}</td>
							<td>${bookingList.roomsVO.r_name}</td>
							<c:if test="${empty bookingList.m_id }">
								<td>비회원</td>
							</c:if>
							<c:if test="${not empty bookingList.m_id }">
								<td>${bookingList.m_id }</td>
							</c:if>
							<td>${bookingList.u_name}</td>
							<td>${bookingList.u_phone}</td>
							<td class="regdate">${bookingList.b_regdate}</td>
							<td class="reservdate">${bookingList.b_date}</td>
							<td>${bookingList.b_time}</td>
							<td>${bookingList.b_number}명</td>
							<td><fmt:formatNumber value="${bookingList.b_price}"  groupingUsed="true" />원</td>
							<td>
								${bookingList.b_status}
								<br>
								<button class="reserv_complete_btn" style="color:red; font-size: 13px;">예약완료</button>
								<br>
								<button class="reserv_cancel_btn" style="color:red; font-size: 13px;">예약취소</button>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="8">입금대기 리스트가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<div id="pagination-container">	
		<c:if test="${pageVO.totalCnt != null }">
			<ul id="pagination">
				<%-- 페이지 생성 반복문 section으로 반복문 범위 지정 --%>
				<c:forEach var="pageNum" begin="${pageVO.section*10-9}" end="${pageVO.section*10}" step="1">
					
					<%-- section이 2 이상일 경우, pre표시 --%>
					<c:if test="${pageVO.section >= 2 && pageNum == (pageVO.section*10-9)}">
						<li><a href="/admin/manage/booking/bookingWaitingList?page=${(pageVO.section-1)*10}">&lt;</a></li>
					</c:if>
												
					<c:choose>
						<%-- page와 pageNum이 같은 경우, 페이지 번호를 강조하여 현재 페이지임을 표기 --%>		
						<c:when test="${pageNum == pageVO.page}">
							<li id="active"><a href="/admin/manage/booking/bookingWaitingList?page=${pageNum}">${pageNum}</a></li>				
						</c:when>
						
						<%-- 현재 페이지가(pageNum) maxPage 이하이면 페이지 번호 생성 --%>
						<c:when test="${pageVO.maxPage >= pageNum }">
							<li><a href="/admin/manage/booking/bookingWaitingList?page=${pageNum}">${pageNum}</a></li>										
						</c:when>					
					</c:choose>						
			
					<%-- next표시 --%>
					<c:if test="${pageVO.maxSection > pageVO.section && pageNum == pageVO.section*10}">
						<li><a href="/admin/manage/booking/bookingWaitingList?page=${pageVO.section*10+1}">&gt;</a>
					</c:if>					
				</c:forEach>	
			</ul>				
		</c:if>
	</div>
</div>