<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page trimDirectiveWhitespaces="true" %>

<div id="partyroom_table_div">
	<h1 style="margin: 50px 0 0 90px; font-size: 18px;">파티룸 수정</h1>
	<div style="margin: 10px 0 0 90px; border-bottom: 1px solid #e3e3e3; border-top: 1px solid #e3e3e3;">
		<form id="partyroom_Update_form" name="partyroom_Update_form" enctype="multipart/form-data">
			<div style="border-bottom: 1px solid #e3e3e3; height: 43px;">
				<div style="float: left; padding: 10px 5px; background: #f1f1f1;">
					<span>파티룸 번호　　</span>
				</div>
				<div style="float: left; padding: 10px 5px; margin-left: 5px;">
					<select id="r_no" name="r_no" style="vertical-align: 1px;">
						<option value="${roomsUpdate.r_no }">${roomsUpdate.r_no }</option>
					</select>
				</div>
			</div>
			<div style="border-bottom: 1px solid #e3e3e3; height: 43px;">
				<div style="float: left; padding: 10px 5px; background: #f1f1f1;">
					<span>파티룸 명　　　</span>
				</div>
				<div style="float: left; padding: 10px 5px; margin-left: 5px;">
					<input type="text" autocomplete="off" id="r_name" name="r_name" value="${roomsUpdate.r_name }" size="100" placeholder="파티룸 명을 입력해주세요.">
				</div>
			</div>
			<div style="border-bottom: 1px solid #e3e3e3; height: 43px;">
				<div style="float: left; padding: 10px 5px; background: #f1f1f1;">
					<span>파티룸 한줄소개</span>
				</div>
				<div style="float: left; padding: 10px 5px; margin-left: 5px;">
					<input type="text" autocomplete="off" id="r_intro" name="r_intro" value="${roomsUpdate.r_intro }" size="100" placeholder="파티룸 한줄소개를 입력해주세요.">
				</div>
			</div>
			<div style="border-bottom: 1px solid #e3e3e3; height: 43px;">
				<div style="float: left; padding: 10px 5px; background: #f1f1f1;">
					<span>파티룸 기준인원</span>
				</div>
				<div style="float: left; padding: 10px 5px; margin-left: 5px;">
					<input type="text" autocomplete="off" id="r_min_num" name="r_min_num" value="${roomsUpdate.r_min_num }" size="2" style="text-align: right;"> 명
				</div>
			</div>
			<div style="border-bottom: 1px solid #e3e3e3; height: 43px;">
				<div style="float: left; padding: 10px 5px; background: #f1f1f1;">
					<span>파티룸 최대인원</span>
				</div>
				<div style="float: left; padding: 10px 5px; margin-left: 5px;">
					<input type="text" autocomplete="off" id="r_max_num" name="r_max_num" value="${roomsUpdate.r_max_num }" size="2" style="text-align: right;"> 명
				</div>
			</div>
			<div style="border-bottom: 1px solid #e3e3e3; height: 43px;">
				<div style="float: left; padding: 10px 5px; background: #f1f1f1;">
					<span>평일 낮타임가격</span>
				</div>
				<div style="float: left; padding: 10px 5px; margin-left: 5px;">
					<input type="text" autocomplete="off" id="r_weekday_day_price" name="r_weekday_day_price" value="${roomsUpdate.r_weekday_day_price }" size="6" style="text-align: right;"> 원
				</div>
			</div>
			<div style="border-bottom: 1px solid #e3e3e3; height: 43px;">
				<div style="float: left; padding: 10px 5px; background: #f1f1f1;">
					<span>평일 밤타임가격</span>
				</div>
				<div style="float: left; padding: 10px 5px; margin-left: 5px;">
					<input type="text" autocomplete="off" id="r_weekday_night_price" name="r_weekday_night_price" value="${roomsUpdate.r_weekday_night_price }" size="6" style="text-align: right;"> 원
				</div>
			</div>
			<div style="border-bottom: 1px solid #e3e3e3; height: 43px;">
				<div style="float: left; padding: 10px 5px; background: #f1f1f1;">
					<span>주말 낮타임가격</span>
				</div>
				<div style="float: left; padding: 10px 5px; margin-left: 5px;">
					<input type="text" autocomplete="off" id="r_weekend_day_price" name="r_weekend_day_price" value="${roomsUpdate.r_weekend_day_price }" size="6" style="text-align: right;"> 원
				</div>
			</div>
			<div style="border-bottom: 1px solid #e3e3e3; height: 43px;">
				<div style="float: left; padding: 10px 5px; background: #f1f1f1;">
					<span>주말 밤타임가격</span>
				</div>
				<div style="float: left; padding: 10px 5px; margin-left: 5px;">
					<input type="text" autocomplete="off" id="r_weekend_night_price" name="r_weekend_night_price" value="${roomsUpdate.r_weekend_night_price }" size="6" style="text-align: right;"> 원
				</div>
			</div>
			<div style="border-bottom: 1px solid #e3e3e3; height: 43px;">
				<div style="float: left; padding: 10px 5px; background: #f1f1f1;">
					<span>파티룸 썸네일　</span>
				</div>
				<div style="float: left; padding: 10px 5px; margin-left: 5px;">
					<input type="file" id="thumbnail" name="thumbnail" accept="image/*">
					<span>기존 썸네일 파일 : ${roomsUpdate.r_thumbnail }</span>
					<input type="hidden" id="r_thumbnail" name="r_thumbnail" value="${roomsUpdate.r_thumbnail }">
				</div>
			</div>
			<div style="border-bottom: 1px solid #e3e3e3; height: 43px;">
				<div style="float: left; padding: 10px 5px; background: #f1f1f1;">
					<span>파티룸 이미지　</span>
				</div>
				<div style="float: left; padding: 10px 5px; margin-left: 5px;">
					<input type="file" id="introimg1" name="introimg1" accept="image/*">
					<span>기존 이미지1 파일 : ${roomsUpdate.r_introimg1 }</span>
					<input type="hidden" id="r_introimg1" name="r_introimg1" value="${roomsUpdate.r_introimg1 }">
				</div>
			</div>
			<div style="border-bottom: 1px solid #e3e3e3; height: 43px;">
				<div style="float: left; padding: 10px 5px; background: #f1f1f1;">
					<span>파티룸 이미지　</span>
				</div>
				<div style="float: left; padding: 10px 5px; margin-left: 5px;">
					<input type="file" id="introimg2" name="introimg2" accept="image/*">
					<span>기존 이미지2 파일 : ${roomsUpdate.r_introimg2 }</span>
					<input type="hidden" id="r_introimg2" name="r_introimg2" value="${roomsUpdate.r_introimg2 }">
				</div>
			</div>
			<div style="border-bottom: 1px solid #e3e3e3; height: 43px;">
				<div style="float: left; padding: 10px 5px; background: #f1f1f1;">
					<span>파티룸 이미지　</span>
				</div>
				<div style="float: left; padding: 10px 5px; margin-left: 5px;">
					<input type="file" id="introimg3" name="introimg3" accept="image/*">
					<span>기존 이미지3 파일 : ${roomsUpdate.r_introimg3 }</span>
					<input type="hidden" id="r_introimg3" name="r_introimg3" value="${roomsUpdate.r_introimg3 }">
				</div>
			</div>
			<div style="border-bottom: 1px solid #e3e3e3; height: 43px;">
				<div style="float: left; padding: 10px 5px; background: #f1f1f1;">
					<span>파티룸 이미지　</span>
				</div>
				<div style="float: left; padding: 10px 5px; margin-left: 5px;">
					<input type="file" id="introimg4" name="introimg4" accept="image/*">
					<span>기존 이미지4 파일 : ${roomsUpdate.r_introimg4 }</span>
					<input type="hidden" id="r_introimg4" name="r_introimg4" value="${roomsUpdate.r_introimg4 }">
				</div>
			</div>
		</form>
	</div>
	<button id="partyroom_Update_action_btn">수정</button>
	<script>
		$("#partyroom_Update_action_btn").click(function(){
			/* 파티룸 번호 null 체크 */
			if($("#r_no").val() == "0") {
				alert("파티룸 번호를 선택해주세요.");
				$("#r_no").focus();
				return;
			} 
			/* 파티룸 명 null 체크 */ 
			else if($("#r_name").val() == "") {
				alert("파티룸 명을 입력해주세요.");
				$("#r_name").focus();
				return;
			} 
			/* 파티룸 한줄소개 null 체크 */ 
			else if($("#r_intro").val() == "") {
				alert("파티룸 한줄소개를 입력해주세요.");
				$("#r_intro").focus();
				return;
			} 
			/* 파티룸 기준인원 null 체크 */ 
			else if($("#r_min_num").val() == "") {
				alert("파티룸 기준인원을 입력해주세요.");
				$("#r_min_num").focus();
				return;
			} 
			/* 파티룸 최대인원 null 체크 */ 
			else if($("#r_max_num").val() == "") {
				alert("파티룸 최대인원을 입력해주세요.");
				$("#r_max_num").focus();
				return;
			} 
			/* 파티룸 평일 낮타임가격 null 체크 */
			else if($("#r_weekday_day_price").val() == "") {
				alert("파티룸 평일 낮타임가격을 입력해주세요.");
				$("#r_weekday_day_price").focus();
				return;
			} 
			/* 파티룸 평일 밤타임가격 null 체크 */
			else if($("#r_weekday_night_price").val() == "") {
				alert("파티룸 평일 밤타임가격을 입력해주세요.");
				$("#r_weekday_night_price").focus();
				return;
			} 
			/* 파티룸 주말 낮타임가격 null 체크 */
			else if($("#r_weekend_day_price").val() == "") {
				alert("파티룸 주말 낮타임가격을 입력해주세요.");
				$("#r_weekend_day_price").focus();
				return;
			} 
			/* 파티룸 주말 밤타임가격 null 체크 */
			else if($("#r_weekend_night_price").val() == "") {
				alert("파티룸 주말 밤타임가격을 입력해주세요.");
				$("#r_weekend_night_price").focus();
				return;
			} else {
				var formData = new FormData($("#partyroom_Update_form")[0]); 
				$.ajax({
					url : "/admin/manage/partyroomUpdateAction",
					type : "post",            
					data : formData, //폼전체 데이터 전송
					dataType : "text",
					contentType: false,
					processData: false,
					error : function() { 
						alert('시스템 오류 입니다.');
					}, 
					success : function(resultData) { 
						if(resultData == 'success') { 
							alert("파티룸 수정 성공");
							location.href = document.referrer;
						} else {
							alert("파티룸 수정 실패");
							location.reload();
						}
					}
				});
			}
		});
	</script>
</div>