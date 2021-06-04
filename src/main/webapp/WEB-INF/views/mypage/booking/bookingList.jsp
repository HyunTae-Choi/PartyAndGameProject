<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page trimDirectiveWhitespaces="true" %>

<c:set var="today" value="<%=new java.util.Date()%>"/>

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
		});
		$(".reserv_return_btn").click(function() {
			var b_no = $(this).parents("tr").attr("data-reservnum");
			$("#b_no").val(b_no);
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
		});
		$(".review_btn").click(function() {
			history.back();
		});
	});
</script>
<div id="booking_table_div">
	<form style="padding: 0;">
		<input type="hidden" name="b_no" id="b_no" value="">
	</form>
	<table>
		<caption style="padding-bottom: 10px">
			${loginSession.m_Name }님 예약 내역 조회　 
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
				<th width="80px;">리뷰작성</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${not empty memberReservList}" >
					<c:forEach var="memberReservList" items="${memberReservList}">
						<tr data-reservnum="${memberReservList.b_no}" data-reservdate="${memberReservList.b_date}" data-roomnum="${memberReservList.r_no}">
							<td>${memberReservList.b_no}</td>
							<td>${memberReservList.roomsVO.r_name}</td>
							<td class="regdate">${memberReservList.b_regdate}</td>
							<td class="reservdate">${memberReservList.b_date}</td>
							<td>${memberReservList.b_time}</td>
							<td>${memberReservList.b_number}명</td>
							<td><fmt:formatNumber value="${memberReservList.b_price}"  groupingUsed="true" />원</td>
							<c:choose>
								<c:when test="${memberReservList.b_status eq '예약완료'}">
									<td>
										${memberReservList.b_status}
										<br>
										<button class="reserv_cancel_btn" style="color:red;">예약취소</button>
									</td>
								</c:when>
								<c:when test="${memberReservList.b_status eq '환불요청'}">
									<td>
										${memberReservList.b_status}
										<br>
										<button class="reserv_return_btn" style="color:red;">요청취소</button>
									</td>
								</c:when>
								<c:otherwise>
									<td>${memberReservList.b_status}</td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${memberReservList.b_status eq '대여완료'}">
									<td>
										<button class="review_btn" style="color:red;">리뷰작성</button>
									</td>
								</c:when>
								<c:otherwise>
									<td>
										<button class="review_btn" style="color:gray;" disabled="disabled">리뷰작성</button>
									</td>									
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="8">예약리스트가 없습니다.</td>
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
						<li><a href="/mypage/booking?page=${(pageVO.section-1)*10}">&lt;</a></li>
					</c:if>
												
					<c:choose>
						<%-- page와 pageNum이 같은 경우, 페이지 번호를 강조하여 현재 페이지임을 표기 --%>		
						<c:when test="${pageNum == pageVO.page}">
							<li id="active"><a href="/mypage/booking?page=${pageNum}">${pageNum}</a></li>				
						</c:when>
						
						<%-- 현재 페이지가(pageNum) maxPage 이하이면 페이지 번호 생성 --%>
						<c:when test="${pageVO.maxPage >= pageNum }">
							<li><a href="/mypage/booking?page=${pageNum}">${pageNum}</a></li>										
						</c:when>					
					</c:choose>						
			
					<%-- next표시 --%>
					<c:if test="${pageVO.maxSection > pageVO.section && pageNum == pageVO.section*10}">
						<li><a href="/mypage/booking?page=${pageVO.section*10+1}">&gt;</a>
					</c:if>					
				</c:forEach>	
			</ul>				
		</c:if>
	</div>
</div>
		

