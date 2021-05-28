package com.pag.client.booking.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pag.client.booking.service.BookingService;
import com.pag.client.booking.vo.BookingVO;

@Controller
@RequestMapping(value="/booking")
public class BookingController {
	private Logger log = LoggerFactory.getLogger(BookingController.class);
	
	@Autowired
	private BookingService bookingService;
	
	@ResponseBody
	@RequestMapping(value="/bookingCheck.do", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String bookingCheck(@ModelAttribute BookingVO bookingVO) {
		log.info("bookingCheck 호출 성공");
		String resultString = "";
		
		int result = bookingService.bookingCheck(bookingVO);
		
		if(result == 1) {
			resultString = "SoldOut";
		} else {
			resultString = "NotSoldOut";
		}
		
		log.info("result = " + result);
		
		return resultString+"";   
	}
	
	@ResponseBody
	@RequestMapping(value="/bookingNonMember.do", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String bookingNonMember(@ModelAttribute BookingVO bookingVO) {
		log.info("bookingNonMember 호출 성공");
		String resultString = "";
		
		int result = bookingService.bookingNonMember(bookingVO);
		
		if(result == 1) {
			resultString = "success";
		} else {
			resultString = "fail";
		}
		
		log.info("result = " + result);
		
		return resultString;  
	}
	
	@RequestMapping(value = "/nonReservConfirm", method = RequestMethod.GET)
	public String nonReservConfirm(@ModelAttribute BookingVO bookingVO) {
		log.info("nonReservConfirm 호출 성공");
		return "nonReservConfirm";
	}
	
	@RequestMapping(value = "/nonReservList", method = RequestMethod.POST)
	public String nonReservList(@ModelAttribute BookingVO bookingVO, Model model) {
		log.info("nonReservList 호출 성공");
		
		List<BookingVO> nonReservList = bookingService.nonReservList(bookingVO);
		model.addAttribute("nonReservList", nonReservList);
		
		return "nonReservList";
	}
	
	@ResponseBody
	@RequestMapping(value="/bookingReservCancel", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String bookingReservCancel(@ModelAttribute BookingVO bookingVO) {
		log.info("bookingReservCancel 호출 성공");
		String resultString = "";
		
		int result = bookingService.bookingReservCancel(bookingVO);
		
		if(result == 1) {
			resultString = "success";
		} else {
			resultString = "fail";
		}
		
		log.info("result = " + result);
		
		return resultString;  
	}
	
	@ResponseBody
	@RequestMapping(value="/bookingReservReturn", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String bookingReservReturn(@ModelAttribute BookingVO bookingVO) {
		log.info("bookingReservReturn 호출 성공");
		String resultString = "";
		
		int result = bookingService.bookingReservReturn(bookingVO);
		
		if(result == 1) {
			resultString = "success";
		} else {
			resultString = "fail";
		}
		
		log.info("result = " + result);
		
		return resultString;  
	}
}
