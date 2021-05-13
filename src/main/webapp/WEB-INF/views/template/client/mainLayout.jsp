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
	<link rel="stylesheet" type="text/css" href="/resources/css/mainheader.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/mainLayout.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/log.css">
	
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="/resources/js/main.js"></script>
	<script src="/resources/js/login.js"></script>

  </head>

  <body>
    <div id="wrap">
		<div id="header">
			<tiles:insertAttribute name="mainheader" />
		</div>
		<div id="imgslide">
			<ul>
				<li id="imgslide_item" style="background: linear-gradient( rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.3) ),url(/resources/image/1.png) no-repeat;">
					<div id="textbox">
						<h2>파티룸 3시간 패키지</h2><br>
						<h4>4인기준, 3시간에 평일 6만원, 주말 8만원</h4><br>
						<h4>+ 추가 1시간당 1만원</h4><br>
						<h4>밤 10시까지 이용 가능합니다.</h4>
					</div>
				</li>
				<li id="imgslide_item" style="background: linear-gradient( rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.3) ),url(/resources/image/2.png) no-repeat;">
					<div id="textbox">
						<h2>프라이빗 공간의 모든 것, 쏘플!</h2><br>
						<h4>#스튜디오렌탈  #회의실/강의실  #업무공간  #주방키친  #스터디룸</h4><br>
						<h4>다양한 컨셉이 있는 공간을 만나보세요</h4>
					</div>
				</li>
				<li id="imgslide_item" style="background: linear-gradient( rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.3) ),url(/resources/image/3.png) no-repeat;">
					<div id="textbox">
						<h2>스튜디오 공간도, 쏘플!</h2><br>
						<h4>#자연광  #루프탑테라스  #주방키친  #플랜테리어</h4><br>
						<h4>다양한 연출이 가능한 SSOPLE STUDIO</h4>
					</div>
				</il>
			</ul>
		</div>
		<div id="about">
			<div id="container">
				<div id="about_textbox">
					<h3>
						원하는 컨셉으로 추억을 남기는
						<br>
						<strong>파티룸 대실은 Party&Game</strong>
					</h3>
					<p>
                    	Party&Game 파티룸 대실 업체는 프라이빗한 공간 우드, 다락방, 루프탑, 화이트 등 다양한 컨셉의 룸을 제공하는 <span style="color: skyblue">파티룸 대여 업체</span>입니다.
                    	<br><br><br>
                    	각 파티룸의 컨셉과 감성을 바탕으로 기억에 남을 추억과 행복한 시간을 보내기 위한 뜻을 가진 많은 상품들로 구성되어 있습니다.<br> 쉬는 시간없이 일을 하는 청춘들, 입시 스트레스로 많은 피로가 쌓이는 학생들과 휴가를 원하는 가족들에게 
                    	<span style="text-decoration: underline;">즐거운 시간을 보내며 스트레스를 해소하고 평생 기억에 남을 추억</span>을 만들어줄 수 있는 Party&Game이 되겠습니다.
					</p>
				</div>
			</div>
		</div>
		<div id="rooms">
			<div id="container">
				<h1>ROOMS</h1>
				<div id="rooms_product_row">
					<div id="rooms_product">
						<a href="#">
							<div id="rooms_img" style="background: url(/resources/image/room1.jpg) no-repeat; background-size: contain;"></div>
						</a>
						<a href="#">
							<div id="rooms_title">
								<p>
									<b>우드 파티룸</b><br>
									<span>기준 4명 ~ 최대 6명</span>
								</p>
							</div>
						</a>
					</div>
					<div id="rooms_product">
						<a href="#">
							<div id="rooms_img" style="background: url(/resources/image/room2.jpg) no-repeat; background-size: contain;"></div>
						</a>
						<a href="#">
							<div id="rooms_title">
								<p>
									<b>레트로 파티룸</b><br>
									<span>기준 4명 ~ 최대 8명</span>
								</p>
							</div>
						</a>
					</div>
					<div id="rooms_product">
						<a href="#">
							<div id="rooms_img" style="background: url(/resources/image/room3.jpg) no-repeat; background-size: contain;"></div>
						</a>
						<a href="#">
							<div id="rooms_title">
								<p>
									<b>다락방 파티룸</b><br>
									<span>기준 4명 ~ 최대 8명</span>
								</p>
							</div>
						</a>
					</div>
					<div id="rooms_product">
						<a href="#">
							<div id="rooms_img" style="background: url(/resources/image/room4.jpg) no-repeat; background-size: contain;"></div>
						</a>
						<a href="#">
							<div id="rooms_title">
								<p>
									<b>루프탑 파티룸</b><br>
									<span>기준 4명 ~ 최대 8명</span>
								</p>
							</div>
						</a>
					</div>
				</div>
				<div id="rooms_product_row">
					<div id="rooms_product">
						<a href="#">
							<div id="rooms_img" style="background: url(/resources/image/room5.jpg) no-repeat; background-size: contain;"></div>
						</a>
						<a href="#">
							<div id="rooms_title">
								<p>
									<b>데일리핑크 파티룸</b><br>
									<span>기준 6명 ~ 최대 12명</span>
								</p>
							</div>
						</a>
					</div>
					<div id="rooms_product">
						<a href="#">
							<div id="rooms_img" style="background: url(/resources/image/room6.jpg) no-repeat; background-size: contain;"></div>
						</a>
						<a href="#">
							<div id="rooms_title">
								<p>
									<b>달빛 파티룸</b><br>
									<span>기준 6명 ~ 최대 12명</span>
								</p>
							</div>
						</a>
					</div>
					<div id="rooms_product">
						<a href="#">
							<div id="rooms_img" style="background: url(/resources/image/room7.jpg) no-repeat; background-size: contain;"></div>
						</a>
						<a href="#">
							<div id="rooms_title">
								<p>
									<b>블랙&화이트 파티룸</b><br>
									<span>기준 8명 ~ 최대 16명</span>
								</p>
							</div>
						</a>
					</div>
					<div id="rooms_product">
						<a href="#">
							<div id="rooms_img" style="background: url(/resources/image/room8.jpg) no-repeat; background-size: contain;"></div>
						</a>
						<a href="#">
							<div id="rooms_title">
								<p>
									<b>화이트 파티룸</b><br>
									<span>기준 10명 ~ 최대 25명</span>
								</p>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div id="event">
			<div id="container">
				<h1>EVENT</h1>
				<ul id="event_item">
					<li>
						<div style="background: url(/resources/image/event_icon1.png) no-repeat;">
							<strong>Sale.</strong>
							<br>
							회원 예약 시 총 결제금액에서 5% 할인 이벤트
						</div>
					</li>
					<li>
						<div style="background: url(/resources/image/event_icon2.png) no-repeat;">
							<strong>Mileage.</strong>
							<br>
							회원 예약 시 총 결제금액에서 10% 마일리지 적립 이벤트
						</div>
					</li>
					<li>
						<div style="background: url(/resources/image/event_icon3.png) no-repeat;">
							<strong>Quiz.</strong>
							<br>
							현장 실시간 퀴즈 이벤트 각종 상품 지급 이벤트
						</div>
					</li>
					<li>
						<div style="background: url(/resources/image/event_icon4.png) no-repeat;">
							<strong>Birthday.</strong>
							<br>
							생일자가 포함된 모임에 생일용품 무료 지급 이벤트
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div id="service">
			<div id="container">
				<h1>SERVICE</h1>
				<ul id="service_item">
					<a href="#">
						<li>
							<div style="background: url(/resources/image/service_icon1.png) no-repeat;">
								<strong>Notice.</strong>
								<br>
								공지사항
							</div>
						</li>
					</a>
					<a href="#">
						<li>
							<div style="background: url(/resources/image/service_icon2.png) no-repeat;">
								<strong>Information Use.</strong>
								<br>
								이용안내
							</div>
						</li>
					</a>
					<a href="#">
						<li>
							<div style="background: url(/resources/image/service_icon3.png) no-repeat;">
								<strong>FAQ.</strong>
								<br>
								자주 묻는 질문
							</div>
						</li>
					</a>
					<a href="#">
						<li>
							<div style="background: url(/resources/image/service_icon4.png) no-repeat;">
								<strong>Tel.</strong>
								<br>
								02-6666-5555
							</div>
						</li>
					</a>
				</ul>
			</div>
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
  </body>
</html>
