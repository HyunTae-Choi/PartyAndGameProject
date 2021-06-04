package com.pag.client.reservation.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReservationController {
	private Logger log = LoggerFactory.getLogger(ReservationController.class);
	
	// 비회원 예약 페이지 컨트롤러
	@RequestMapping(value = "/reservationInfo_n", method = RequestMethod.POST)
	public String reservationInfo_n() {
		log.info("reservationInfo_n 호출 성공");
		return "reservationInfo_n";
	}
	
	// 회원 예약 페이지 컨트롤러
	@RequestMapping(value = "/reservationInfo_m", method = RequestMethod.POST)
	public String reservationInfo_m() {
		log.info("reservationInfo_m 호출 성공");
		return "reservationInfo_m";
	}
}
