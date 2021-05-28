<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page trimDirectiveWhitespaces="true" %>

<div id="booking_table_div">
	<table>
		<caption>예약 내역 조회</caption>
		<tr>
			<th width="160px;">예약번호</th>
			<th width="220px;">파티룸 명</th>
			<th width="70px;">인원</th>
			<th width="70px;">시간</th>
			<th width="100px;">금액</th>
			<th width="150px;">예약등록일</th>
			<th width="150px;">예약날짜</th>
			<th width="100px;">예약상황</th>
			<th width="100px;">리뷰</th>
		</tr>
		<tr>
			<td>100421042062</td>
			<td>루프탑 파티룸</td>
			<td>6명</td>
			<td>밤타임</td>
			<td>180000원</td>
			<td>2021-04-10</td>
			<td>2021-04-20</td>
			<td>대여완료</td>
			<td><button style="color: skyblue">리뷰</button></td>
		</tr>
		<tr>
			<td>100121050432</td>
			<td>블랙&화이트 파티룸</td>
			<td>15명</td>
			<td>밤타임</td>
			<td>200000원</td>
			<td>2021-04-28</td>
			<td>2021-05-04</td>
			<td>예약완료<br><button style="color: red">취소신청</button></td>
			<td><button disabled="disabled">리뷰</button></td>
		</tr>
		<tr>
			<td>100121051016</td>
			<td>데일리 파티룸</td>
			<td>20명</td>
			<td>낮타임</td>
			<td>80000원</td>
			<td>2021-05-04</td>
			<td>2021-05-10</td>
			<td>입금대기</td>
			<td><button disabled="disabled">리뷰</button></td>
		</tr>
	</table>
	<button id="next_btn">다음</button>
	<button id="prev_btn">이전</button>
</div>
		

