package com.pag.client.reservation.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pag.client.login.vo.LoginVO;
import com.pag.client.member.service.MemberService;
import com.pag.client.member.vo.MemberVO;

@Controller
public class ReservationController {
	private Logger log = LoggerFactory.getLogger(ReservationController.class);
	
	@Autowired
	private MemberService memberService;
	
	// 비회원 예약 페이지 컨트롤러
	@RequestMapping(value = "/reservationInfo_n", method = RequestMethod.POST)
	public String reservationInfo_n() {
		log.info("reservationInfo_n 호출 성공");
		return "reservationInfo_n";
	}
	
	// 회원 예약 페이지 컨트롤러
	@RequestMapping(value = "/reservationInfo_m", method = RequestMethod.POST)
	public String reservationInfo_m(Model model, HttpSession session) {
		log.info("reservationInfo_m 호출 성공");
		
		LoginVO loginSession = null;
		if((loginSession = (LoginVO) session.getAttribute("loginSession")) == null) {
			return "redirect:/";	
		}
		
		MemberVO mvo = new MemberVO();
		mvo.setM_Id(loginSession.getM_Id());
		mvo = memberService.memberSelect(mvo);
		model.addAttribute("mvo", mvo);
		
		return "reservationInfo_m";
	}
}
