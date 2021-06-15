<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page trimDirectiveWhitespaces="true" %>

<div id="partyroom_table_div">
	<form style="padding: 0;" id="partyroomList_form" name="partyroomList_form">
		<input type="hidden" name="r_no" id="r_no" value="">
	</form>
 	<table id="partyroomList_table" style="margin-left: 90px; margin-top: 50px;">
		<caption style="padding-bottom: 10px">
			파티룸 리스트
		</caption>
		<thead>
			<tr style="font-size: 14px;">
				<th width="110px;">방 번호</th>
				<th width="700px;">파티룸 명</th>
				<th width="80px;">수정</th>
				<th width="80px;">파티룸상태</th>
				<th width="80px;">비활성화</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${not empty partyroomList}" >
					<c:forEach var="partyroomList" items="${partyroomList}">
						<tr style="font-size: 14px;" data-roomnum="${partyroomList.r_no}">
							<td>${partyroomList.r_no}</td>
							<td>${partyroomList.r_name}</td>
							<td><button class="partyroom_Update">수정</button></td>
							<c:choose>
								<c:when test="${partyroomList.r_availabled eq 1}">
									<td style="font-size: 16px;">유효</td>
								</c:when>
								<c:otherwise>
									<td style="font-size: 16px;">비활성</td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${partyroomList.r_availabled eq 1}">
									<td><button class="partyroom_Unavailable">비활성</button></td>
								</c:when>
								<c:otherwise>
									<td><button class="partyroom_Available">복구</button></td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">파티룸 리스트가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<button id="partyroom_insert_btn">추가</button>
	<script>
		$("#partyroom_insert_btn").click(function(){
			if($("#partyroomList_table > tbody tr").length < 8) {
				location.href = "/admin/manage/partyroomInsertPage";
			} else {
				alert("파티룸이 총 8개 다 추가되었습니다.");
			}
		
		});
		
		$(".partyroom_Update").click(function() {
			var r_no = $(this).parents("tr").attr("data-roomnum");
			$("#r_no").val(r_no);
			$.ajax({
				url : "/admin/manage/partyroomUnavailableCheck",  
				type : "post",            
				data : {r_no : $("#r_no").val()}, //폼전체 데이터 전송
				dataType : "text",
				error : function() { 
					alert('시스템 오류 입니다.');
				}, 
				success : function(resultData) { 
					if(resultData == 'unavailable') { 
						$("#partyroomList_form").attr("action", "/admin/manage/partyroomUpdateForm");
						$("#partyroomList_form").attr("method", "post");
						$("#partyroomList_form").submit();
					} else {
						alert("파티룸 번호 : " + $("#r_no").val() + "\n해당 파티룸은 비활성화 상태가 아닙니다.");
					}
				}
			});
		});
		
		$(".partyroom_Unavailable").click(function() {
			var r_no = $(this).parents("tr").attr("data-roomnum");
			$("#r_no").val(r_no);
			$.ajax({
				url : "/admin/manage/partyroomBookingCheck",  
				type : "post",            
				data : {r_no : $("#r_no").val()},
				dataType : "text",
				error : function() { 
					alert('시스템 오류 입니다.');
				}, 
				success : function(resultData) { 
					if(resultData == 'no') { 
						$.ajax({
							url : "/admin/manage/partyroomUnavailableAction",  
							type : "post",            
							data : {r_no : $("#r_no").val()},
							dataType : "text",
							error : function() { 
								alert('시스템 오류 입니다.');
							}, 
							success : function(resultData) { 
								if(resultData == 'success') { 
									alert("파티룸 번호 : " + $("#r_no").val() + "\n해당 파티룸 비활성화에 성공했습니다.");
									location.reload();
								} else {
									alert("파티룸 번호 : " + $("#r_no").val() + "\n해당 파티룸 비활성화에 실패했습니다.");
								}
							}
						});
					} else {
						alert("파티룸 번호 : " + $("#r_no").val() + "\n해당 파티룸은 예약자가 있어 비활성화에 실패했습니다.");
					}
				}
			});
		});
		
		$(".partyroom_Available").click(function() {
			var r_no = $(this).parents("tr").attr("data-roomnum");
			$("#r_no").val(r_no);
			$.ajax({
				url : "/admin/manage/partyroomAvailableAction",  
				type : "post",            
				data : {r_no : $("#r_no").val()},
				dataType : "text",
				error : function() { 
					alert('시스템 오류 입니다.');
				}, 
				success : function(resultData) { 
					if(resultData == 'success') { 
						alert("파티룸 번호 : " + $("#r_no").val() + "\n해당 파티룸 활성화에 성공했습니다.");
						location.reload();
					} else {
						alert("파티룸 번호 : " + $("#r_no").val() + "\n해당 파티룸 활성화에 실패했습니다.");
					}
				}
			});
		});
	</script>
</div>