<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page trimDirectiveWhitespaces="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!-- chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	
<div class="statisticDiv">
	
	<div class="statisticDivTop" >
		<button class="statisticBtn" onclick="openStatisticMemberGender()">회원 성별 통계</button>
		<button class="statisticBtn" onclick="openStatisticMemberNum()">월별 회원 가입자 수 통계</button>
		<button class="statisticBtn" onclick="openStatisticSalse()">월별 매출액 통계</button>
		<button class="statisticBtn" onclick="openStatisticBookingNum()">월별 예약횟수 통계</button>
	</div>
	
	<div id="member_gender_chart_div" style="">
		<canvas id="memberGenderStatistic" ></canvas>		
	</div>
	
	<div id="member_join_number_chart_div" style="display: none">
		<canvas id="memberJoinMonthStatistic"></canvas>
	</div>
	
	<div id="salse_chart_div" style="display: none">
		<canvas id="salesMonthChart"></canvas>
	</div>
	
	<div id="booking_chart_div" style="display: none">
		<canvas id="bookingNumMonthChart"></canvas>
	</div>
	
	<div class="chartData" style="display: none;">
	
		<c:if test="${not empty memberGenderStatisticList}">
			<c:forEach var="genderSt" items="${memberGenderStatisticList}">
				<input type="hidden" id="memberGender_${genderSt.m_Gender}" value="${genderSt.st_Count}">
			</c:forEach>
		</c:if>
		
		<c:if test="${not empty memberJoinMonthStatisticList}">
			<c:forEach var="monthJoin" items="${memberJoinMonthStatisticList}">
				<input type="hidden" id="memberGenderJoinChartData_${monthJoin.st_Month}${monthJoin.m_Gender}" value="${monthJoin.st_Count}">
			</c:forEach>
		</c:if>
		
		<c:if test="${not empty salesMonthStatisticList}">
			<c:forEach var="monthBookingSales" items="${salesMonthStatisticList}">
				<input type="hidden" id="salesMonthData_${monthBookingSales.st_Month}" value="${monthBookingSales.st_Price}">
			</c:forEach>
		</c:if>		
		
		<c:if test="${not empty bookingNumMonthStatisticList}">
			<c:forEach var="monthBookingNum" items="${bookingNumMonthStatisticList}">
				<input type="hidden" id="bookingNumMonthData_${monthBookingNum.st_Month}" value="${monthBookingNum.st_Count}">
			</c:forEach>
		</c:if>			  
	</div>
	
</div>	
<script>
	/* 비고: js파일로 분리하면 적용안됨 */
	/* ==== 회원성별통계 ==== */
	var memberGenderStatistiCtx = document.getElementById('memberGenderStatistic');
	var maleNum = $('#memberGender_m').val();
	var femailNum = $('#memberGender_f').val();
	
	var dataGenderStatistic = 	{
				datasets : [ {
					backgroundColor : ['rgba(84, 219, 185, 1)', 'rgba(254, 122, 93, 1)' ],
					data : [ maleNum, femailNum]
				} ], 
				// 라벨의 이름이 툴팁처럼 마우스가 근처에 오면 나타남 
				labels : [ '남성 회원', '여성 회원']	};
	var memberGenderStatisticChart = new Chart(memberGenderStatistiCtx, {
		type : 'doughnut',
		data : dataGenderStatistic,
		// 옵션 
		options : {
			legend : {
				display : true,
				labels: { fontSize: 18, 
					fontColor: 'black',
					fontFamily: 'S-CoreDream-4Regular' 
					}
			},
			title : {
				display : true,
				text : '가입 회원 성별 통계',
				fontSize: 18, 
				fontColor: 'black',
				fontFamily: 'S-CoreDream-4Regular'
			}			
		}
	});
	/* ==== 회원성별통계 end ==== */
	
	/* ===== 월별 가입자수 통계 ===== */
	var stNum01M = $('#memberGenderJoinChartData_01m').val();
	var stNum01F = $('#memberGenderJoinChartData_01f').val();
	var stNum02M = $('#memberGenderJoinChartData_02m').val();
	var stNum02F = $('#memberGenderJoinChartData_02f').val();
	var stNum03M = $('#memberGenderJoinChartData_03m').val();
	var stNum03F = $('#memberGenderJoinChartData_03f').val();
	var stNum04M = $('#memberGenderJoinChartData_04m').val();
	var stNum04F = $('#memberGenderJoinChartData_04f').val();
	var stNum05M = $('#memberGenderJoinChartData_05m').val();
	var stNum05F = $('#memberGenderJoinChartData_05f').val();
	var stNum06M = $('#memberGenderJoinChartData_06m').val();
	var stNum06F = $('#memberGenderJoinChartData_06f').val();
	var stNum07M = $('#memberGenderJoinChartData_07m').val();
	var stNum07F = $('#memberGenderJoinChartData_07f').val();
	var stNum08M = $('#memberGenderJoinChartData_08m').val();
	var stNum08F = $('#memberGenderJoinChartData_08f').val();
	var stNum09M = $('#memberGenderJoinChartData_09m').val();
	var stNum09F = $('#memberGenderJoinChartData_09f').val();
	var stNum10M = $('#memberGenderJoinChartData_10m').val();
	var stNum10F = $('#memberGenderJoinChartData_10f').val();
	var stNum11M = $('#memberGenderJoinChartData_11m').val();
	var stNum11F = $('#memberGenderJoinChartData_11f').val();
	var stNum12M = $('#memberGenderJoinChartData_12m').val();
	var stNum12F = $('#memberGenderJoinChartData_12f').val();
	
	var memberJoinMonthStatisticCtx = document.getElementById('memberJoinMonthStatistic');
	var dataJoinMonthStatistic = 	
				{
			labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			
			datasets : 
				[  {label: '21년 남성가입자수', 
					backgroundColor: 'rgba(84, 219, 185, 1)', 
					borderColor: 'rgba(84, 219, 185, 1)',
					data : [ stNum01M, stNum02M, stNum03M, stNum04M, stNum05M, stNum06M, stNum07M, stNum08M,
						stNum09M, stNum10M, stNum11M, stNum12M ]	
					},
					
					{
					label: '21년 여성가입자수', 
					backgroundColor: 'rgba(254, 122, 93, 1)', 
					borderColor: 'rgba(254, 122, 93, 1)',
					data : [ stNum01F, stNum02F, stNum03F, stNum04F, stNum05F, stNum06F, stNum07F, stNum08F,
						stNum09F, stNum10F, stNum11F, stNum12F ]	
					}
				]
			};
	var statisticSalesChart = new Chart(memberJoinMonthStatisticCtx, {
		type : 'bar',
		data : dataJoinMonthStatistic,
		options : {
			legend : {
				display : true,
				labels: { fontSize: 18, 
					fontColor: 'black',
					fontFamily: 'S-CoreDream-4Regular' 
					}
			},
			title : {
				display : true,
				text : '월별 가입자 통계',
				fontSize: 18, 
				fontColor: 'black',
				fontFamily: 'S-CoreDream-4Regular'
			},
			scales: {
				yAxes: [{
					ticks: {
						min:0,
						fontColor : "rgba(116, 116, 116, 1)",
						fontSize : 16,
						fontFamily: 'S-CoreDream-4Regular'
					}
				
				}],
				xAxes: [{
					ticks:{						
						fontColor : "rgba(116, 116, 116, 1)",
						fontSize : 16,
						fontFamily: 'S-CoreDream-4Regular'
					}
					
				}]
			}
		}
	});
	/* ===== 월별 가입자수 통계 end ===== */
	
	/* ===== 월별 매출액 통계 ===== */
	var sValue01 = $('#salesMonthData_01').val();
	var sValue02 = $('#salesMonthData_02').val();
	var sValue03 = $('#salesMonthData_03').val();
	var sValue04 = $('#salesMonthData_04').val();
	var sValue05 = $('#salesMonthData_05').val();
	var sValue06 = $('#salesMonthData_06').val();
	var sValue07 = $('#salesMonthData_07').val();
	var sValue08 = $('#salesMonthData_08').val();
	var sValue09 = $('#salesMonthData_09').val();
	var sValue10 = $('#salesMonthData_10').val();
	var sValue11 = $('#salesMonthData_11').val();
	var sValue12 = $('#salesMonthData_12').val();
	
	var salesMonthChartCtx = document.getElementById('salesMonthChart');
	var dataSalesChart = 	{
			labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			datasets : [ {
				label: '21년 매출', 
				backgroundColor: 'rgba(254, 122, 93, 1)', 
				borderColor: 'rgba(254, 122, 93, 1)',
				data : [ sValue01, sValue02, sValue03, sValue04, sValue05, sValue06, sValue07,
					sValue08, sValue09, sValue10, sValue11, sValue12 ]	
				}]
			};
	var statisticSalesChart = new Chart(salesMonthChartCtx, {
		type : 'bar',
		data : dataSalesChart,
		options : {
			legend : {
				display : true,
				labels: { fontSize: 18, 
					fontColor: 'black',
					fontFamily: 'S-CoreDream-4Regular' 
					}
			},
			title : {
				display : true,
				text : '월별 매출 통계',
				fontSize: 18, 
				fontColor: 'black',
				fontFamily: 'S-CoreDream-4Regular'
			},
			scales: {
				yAxes: [{
					ticks: {
						min:0,
						fontColor : "rgba(116, 116, 116, 1)",
						fontSize : 16,
						fontFamily: 'S-CoreDream-4Regular'
					}
				
				}],
				xAxes: [{
					ticks:{
						fontColor : "rgba(116, 116, 116, 1)",
						fontSize : 16,
						fontFamily: 'S-CoreDream-4Regular'
					}
					
				}]
			}
		}
	});
	/* ===== 월별 매출액 통계 end===== */
	
	/* ===== 월별 예약횟수 통계 ===== */
	var bNum01 = $('#bookingNumMonthData_01').val();
	var bNum02 = $('#bookingNumMonthData_02').val();
	var bNum03 = $('#bookingNumMonthData_03').val();
	var bNum04 = $('#bookingNumMonthData_04').val();
	var bNum05 = $('#bookingNumMonthData_05').val();
	var bNum06 = $('#bookingNumMonthData_06').val();
	var bNum07 = $('#bookingNumMonthData_07').val();
	var bNum08 = $('#bookingNumMonthData_08').val();
	var bNum09 = $('#bookingNumMonthData_09').val();
	var bNum10 = $('#bookingNumMonthData_10').val();
	var bNum11 = $('#bookingNumMonthData_11').val();
	var bNum12 = $('#bookingNumMonthData_12').val();
	
	var bookingNumMonthChartCtx = document.getElementById('bookingNumMonthChart');
	var dataBookingNumChart = 	{
			labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			datasets : [ {
				label: '21년 예약 횟수', 
				backgroundColor: 'rgba(254, 122, 93, 1)', 
				borderColor: 'rgba(254, 122, 93, 1)',
				data : [ bNum01, bNum02, bNum03, bNum04, bNum05, bNum06, bNum07,
					bNum08, bNum09, bNum10, bNum11, bNum12 ]	
				}]
			};
	var statisticBookingNumChart = new Chart(bookingNumMonthChartCtx, {
		type : 'bar',
		data : dataBookingNumChart,
		options : {
			legend : {
				display : true,
				labels: { fontSize: 18, 
					fontColor: 'black',
					fontFamily: 'S-CoreDream-4Regular' 
					}
			},
			title : {
				display : true,
				text : '월별 예약 통계',
				fontSize: 18, 
				fontColor: 'black',
				fontFamily: 'S-CoreDream-4Regular'
			},
			scales: {
				yAxes: [{
					ticks: {
						min:0,
						fontColor : "rgba(116, 116, 116, 1)",
						fontSize : 16,
						fontFamily: 'S-CoreDream-4Regular'
					}
				
				}],
				xAxes: [{
					ticks:{
						fontColor : "rgba(116, 116, 116, 1)",
						fontSize : 16,
						fontFamily: 'S-CoreDream-4Regular'
					}
					
				}]
			}
		}
	});
	/* ===== 월별 예약횟수 통계 end ===== */
	
	/* 차트 열고 닫기 함수 */
	function openStatisticMemberGender() {
	$('#member_gender_chart_div').attr("style", "display:block");
	$('#member_join_number_chart_div').attr("style", "display:none");
	$('#salse_chart_div').attr("style", "display:none");
	$('#booking_chart_div').attr("style", "display:none");
	}
	function openStatisticMemberNum() {
		$('#member_gender_chart_div').attr("style", "display:none");
		$('#member_join_number_chart_div').attr("style", "display:block");
		$('#salse_chart_div').attr("style", "display:none");
		$('#booking_chart_div').attr("style", "display:none");
	}
	function openStatisticSalse() {
		$('#member_gender_chart_div').attr("style", "display:none");
		$('#member_join_number_chart_div').attr("style", "display:none");
		$('#salse_chart_div').attr("style", "display:block");
		$('#booking_chart_div').attr("style", "display:none");
	}
	function openStatisticBookingNum() {
		$('#member_gender_chart_div').attr("style", "display:none");
		$('#member_join_number_chart_div').attr("style", "display:none");
		$('#salse_chart_div').attr("style", "display:none");
		$('#booking_chart_div').attr("style", "display:block");
	}
</script>