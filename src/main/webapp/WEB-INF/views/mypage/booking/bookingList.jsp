<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page trimDirectiveWhitespaces="true" %>

<style>
	#booking_btn {
		border-bottom: 2px solid #ffb300;
	}
</style>

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
		/* == 리뷰 작성 클릭 == */
		$(".review_btn").click(function(e) {
			/* 리뷰창에 값 넣기 */		    		    
		    $('#b_no_rv').empty();
		    $('#r_name_rv').empty();
		    $('#b_date_rv').empty();
		    
		    var tr = e.target.parentNode.parentNode.dataset;		   
		    
		    $('#b_no_rv').append(tr.reservnum);
		    $('#r_name_rv').append(tr.roomname);
		    $('#b_date_rv').append(tr.reservdate);
		    $('#b_date_rv').append(' ' + tr.reservtime);
		    
		    /* 등록 버튼의 dataset에 값 넣기 */
		    var domBtn = document.getElementById('review_insert_btn');
			domBtn.dataset.reservnum = tr.reservnum;
			domBtn.dataset.roomnum = tr.roomnum;
			domBtn.dataset.mid = '${loginSession.m_Id}';  
		    
		    $('#review_form_modal').attr("style", "display:block");		    
		});
		
		/* == 리뷰 별점 누를때 == */
		$('.review_modify_star_content_value').click(function(){			
			$(this).prevAll().addClass('review_modify_star_btn_active');
			$(this).prevAll().removeClass('review_modify_star_btn_nonactive');
			$(this).removeClass('review_modify_star_btn_nonactive');
			$(this).addClass('review_modify_star_btn_active');
			$(this).nextAll().addClass('review_modify_star_btn_nonactive');
			$(this).nextAll().removeClass('review_modify_star_btn_active');
			
			$('.review_modify_star_content_value_text').empty();
			$('.review_modify_star_content_value_text').append($(this).attr("data-text"));		
			
			var value = $(this).val();
			$('#rv_grade_insert').val(value);
			$('#rv_grade_update').val(value);
		});
		
		/* == 리뷰 등록 버튼 클릭 == */
		$("#review_insert_btn").click(function(e) {
			var btn = e.target.dataset;
			console.log(btn.reservnum);
			console.log(btn.roomnum);
			console.log(btn.mid);
			
			var reviewData ="rv_Grade=" + $('#rv_grade_insert').val() + "&rv_Content=" + $('#rv_content_insert').val()
			+"&m_Id=" + btn.mid + "&b_No=" + btn.reservnum+ "&r_No=" + btn.roomnum;
			
			
			if (!formBlankCheck($('#rv_grade_insert'), '리뷰 점수를')) return;
			else if (!formBlankCheck($('#rv_content_insert'), "리뷰를")) return;
			else {
				$.ajax({
		 			url : "/review/insert",  
		 			type : "post",                
		 			data : reviewData,
		 							 			
		 			error : function(){ // 전송 실패시
		 				alert('시스템에 오류가 발생했습니다.\n다시 시도해주시거나 운영자에게 문의해주세요.');
		 			},
		 
		 			success : function(resultData){ // 전송 성공시 
		 				if(resultData == 'error'){
		 					alert('시스템에 오류가 발생했습니다.\n다시 시도해주시거나 운영자에게 문의해주세요.');
		 				} else if(resultData == 'errorReveiwFail'){ // 리뷰 작성 fail
			 				alert('리뷰가 등록되지 않았습니다. \n다시 시도해주시거나 운영자에게 문의해주세요.');
			 			} else if(resultData == 'errorMileageFail'){ // 마일리지 지급 fail
			 				alert('리뷰가 등록되었으나 시스템에러로 마일리지가 지급되지 않았습니다. \n운영자에게 문의해주세요.');
			 			} else if (resultData == 'success'){
			 				alert('마일리지가 지급되었습니다. 감사합니다.');
			 				window.location.reload();
			 			} 				
		 			}
		 		}); 
			}    
		});
		
		/* == 리뷰 수정(수정폼) 클릭 == */
		$(".review_modify_btn").click(function(e) {
			
			/* 리뷰창에 값 넣기 */		    		    
		    $('#b_no_rv_update').empty();
		    $('#r_name_rv_update').empty();
		    $('#b_date_rv_update').empty();
		    
		    var tr = e.target.parentNode.parentNode.dataset;
		    $('#b_no_rv_update').append(tr.reservnum);
		    $('#r_name_rv_update').append(tr.roomname);
		    $('#b_date_rv_update').append(tr.reservdate);
		    $('#b_date_rv_update').append(' ' + tr.reservtime);
		    
		    /* 수정 버튼의 dataset에 값 넣기 */
 		    var domBtn = document.getElementById('review_update_btn');
			domBtn.dataset.reservnum = tr.reservnum;
			domBtn.dataset.roomnum = tr.roomnum;
			domBtn.dataset.reviewno = tr.reviewno;
			domBtn.dataset.mid = '${loginSession.m_Id}'; 
			
			// reviewData 객체 생성
			//var reviewData ="m_Id=" + '${loginSession.m_Id}'+ "&b_No=" + tr.reservnum + "&r_No=" + tr.roomnum + "&rv_No=" + tr.reviewno;
			var reviewData = {
				m_Id: '${loginSession.m_Id}',
				b_No: tr.reservnum,
				r_No: tr.roomnum,
				rv_No: tr.reviewno
			};		
			
			$.ajax({
	 			url : "/review/updatedata",  
	 			type : "post",
	 			data : reviewData,
	 			dataType:"json",	 			
	 			error : function(){ // 전송 실패시
	 				alert('시스템에 오류가 발생했습니다.\n다시 시도해주시거나 사이트 운영자에게 문의해주세요.');
	 			},
	 
	 			success : function(resultData){ // 전송 성공시 
	 				if(resultData == null){
	 					alert('시스템에 오류가 발생했습니다.\n다시 시도해주시거나 사이트 운영자에게 문의해주세요.');
	 				} else {
	 					var grade = resultData.rv_Grade;
	 					var content = resultData.rv_Content;
	 					
	 					/* 불러온 값 넣기 */
	 					// content
	 					$('#rv_content_update').empty();
	 					$('#rv_content_update').summernote('code');
	 					$('#rv_content_update').summernote('destroy');
	 					$('#rv_content_update').val(content);
	 					$('#rv_content_update').summernote(setting_review);
	 					
	 					// grade
	 					$("#star_value_"+grade).trigger("click");
	 				}
		 						
	 			}
	 		}); 	
		    $('#review_modify_form_modal').attr("style", "display:block");		    
		});
		
		
		/* == 리뷰 수정(완료) 버튼 클릭 == */
		$("#review_update_btn").click(function(e) {
			var btn = e.target.dataset;
			
			var reviewData = {
					rv_Grade: $('#rv_grade_update').val(),
					rv_Content: $('#rv_content_update').val(),
					m_Id: btn.mid,
					b_No: btn.reservnum,
					r_No: btn.roomnum,
					rv_No: btn.reviewno	
				};
			
			if (!formBlankCheck($('#rv_grade_update'), '리뷰 점수를')) return;
			else if (!formBlankCheck($('#rv_content_update'), "리뷰를")) return;
			else {
				$.ajax({
		 			url : "/review/update",  
		 			type : "post",                
		 			data : reviewData,
		 							 			
		 			error : function(){ // 전송 실패시
		 				alert('시스템에 오류가 발생했습니다.\n다시 시도해주시거나 사이트 운영자에게 문의해주세요.');
		 			},
		 
		 			success : function(resultData){ // 전송 성공시 
		 				if(resultData == 'error'){
		 					alert('시스템에 오류가 발생했습니다.\n다시 시도해주시거나 사이트 운영자에게 문의해주세요.');
		 				}else if(resultData == '0'){ // 결과값 fail
			 				alert('리뷰가 수정되지 않았습니다. \n사이트 운영자에게 문의해주세요.');
			 			} else if (resultData == '1'){
			 				alert('리뷰가 수정되었습니다. 감사합니다.');
			 				window.location.reload();
			 			} 				
		 			}
		 		}); 
			}
		    		    
		});
		
		/* == 리뷰 삭제 버튼 클릭 == */
		$("#review_delete_btn").click(function(e) {
			var btn = e.target.previousElementSibling.dataset;	
			
			var reviewData = {
				m_Id: '${loginSession.m_Id}',
				b_No: btn.reservnum,
				r_No: btn.roomnum,
				rv_No: btn.reviewno	
			};
			
			if(!confirm('리뷰를 삭제하시겠습니까? 복구나 재작성은 불가능합니다.')) return;  
			else {
				$.ajax({
		 			url : "/review/disableupdate",  
		 			type : "post",                
		 			data : reviewData,			 							 			
		 			error : function(){ // 전송 실패시
		 				alert('시스템에 오류가 발생했습니다.\n다시 시도해주시거나 사이트 운영자에게 문의해주세요.');
		 			},			 
		 			success : function(resultData){ // 전송 성공시 
		 				if(resultData == 'error'){
		 					alert('시스템에 오류가 발생했습니다.\n다시 시도해주시거나 사이트 운영자에게 문의해주세요.');
		 				}else if(resultData == '0'){ // 결과값 fail
			 				alert('리뷰가 삭제되지 않았습니다. \n사이트 운영자에게 문의해주세요.');
			 			} else if (resultData == '1'){
			 				alert('리뷰가 삭제되었습니다.');
			 				window.location.reload();
			 			} 				
		 			}
		 		}); 
			}
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
						<tr data-reservnum="${memberReservList.b_no}" data-reservdate="${memberReservList.b_date}" data-reservtime="${memberReservList.b_time}" data-roomnum="${memberReservList.r_no}" data-roomname="${memberReservList.roomsVO.r_name}" data-reviewno="${memberReservList.reviewVO.rv_No}">
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
								<c:when test="${memberReservList.b_status eq '대여완료' and not empty memberReservList.reviewVO.rv_No and memberReservList.reviewVO.rv_Availabled eq '유효'}">
									<td>
										<button class="review_modify_btn" style="color:blue;">리뷰수정</button>
									</td>
								</c:when>
								<c:when test="${memberReservList.b_status eq '대여완료' and not empty memberReservList.reviewVO.rv_No and memberReservList.reviewVO.rv_Availabled eq '회원비활성'}">
									<td>
										<span style="color:pink;">삭제된<br>리뷰</span>
									</td>
								</c:when>
								<c:when test="${memberReservList.b_status eq '대여완료' and not empty memberReservList.reviewVO.rv_No and memberReservList.reviewVO.rv_Availabled eq '관리자비활성'}">
									<td>
										<span style="color:pink;">비활성화<br>된 리뷰</span>
									</td>
								</c:when>
								<c:when test="${memberReservList.b_status eq '대여완료'}">
									<td>
										<button class="review_btn" style="color:black;">리뷰작성</button>
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
		

