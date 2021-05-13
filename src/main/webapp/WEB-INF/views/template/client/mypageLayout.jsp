<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="/resources/image/party_icon.gif" rel="shortcut icon" type="image/x-icon">
	<title><tiles:getAsString name="title" /></title>
	
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@300;400;500;700&display=swap" rel="stylesheet">
	<link href="image/party_icon.gif" rel="shortcut icon" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/subheader.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/mainLayout.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/mypageLayout.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/mypage_infodiv.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/mypage_bookingdiv.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/mypage_questiondiv.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/log.css">
	
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="/resources/js/mypage.js"></script>
	<script src="/resources/js/login.js"></script>
</head>

<body>
	<div id="wrap">
		<div id="header">
			<tiles:insertAttribute name="subheader" />
		</div>
		<div id="mypage_layout">
			<div id="container">
				<div id="side_menu">
					<ul>
						<li><button id="info_btn">내 정보</button></li>
						<li><button id="booking_btn">예약 내역</button></li>
						<li><button id="question_btn">문의 내역</button></li>
						<li><button id="modify_btn">회원 정보수정</button></li>
						<li><button id="secede_btn">회원 탈퇴</button></li>
					</ul>
				</div>
				<div id="main_content">
					<div id="info_div">
						<div id="info_div_1">
							<p><span style="font-weight: 700;">최현태</span> 님 안녕하세요.</p>
							<span>누적 결제금액 : 0원</span>
						</div>
						<div id="info_div_2">
							<p>포인트</p>
							<span>&nbsp1000포인트</span>
						</div>
						<div id="info_div_2">
							<p>쿠폰</p>
							<span>&nbsp0장</span>
						</div>
					</div>
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
					<div id="question_table_div">
						<table>
							<caption>문의 내역 조회</caption>
							<tr>
								<th width="100px;">문의글 번호</th>
								<th width="524px;" style="text-align: left;">문의글 제목</th>
								<th width="70px;">작성자</th>
								<th width="170px;">등록일</th>
								<th width="100px;">답변여부</th>
							</tr>
							<tr>
								<td>3</td>
								<td style="text-align: left;"><a href="#">문의드립니다.</a></td>
								<td>홍길동</td>
								<td>2021-04-20</td>
								<td>답변완료</td>
							</tr>
							<tr>
								<td>48</td>
								<td style="text-align: left;"><a href="#">이벤트 문의드립니다.</a></td>
								<td>홍길동</td>
								<td>2021-04-20</td>
								<td>답변완료</td>
							</tr>
							<tr>
								<td>163</td>
								<td style="text-align: left;"><a href="#">파티룸 문의드립니다.</a></td>
								<td>홍길동</td>
								<td>2021-04-20</td>
								<td>답변대기</td>
							</tr>
						</table>
						<button id="write_btn">글쓰기</button>
						<button id="next_btn">다음</button>
						<button id="prev_btn">이전</button>
					</div>
				</div>
			</div>
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
  </body>
</html>
