package com.pag.client.reservation.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReservationController {
	private Logger log = LoggerFactory.getLogger(ReservationController.class);
	@RequestMapping(value = "/reservationInfo", method = RequestMethod.POST)
	public String reservationInfo() {
		log.info("reservationInfo 호출 성공");
		return "reservationInfo";
	}
}
